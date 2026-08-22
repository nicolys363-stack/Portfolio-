param(
    [int]$Port = 8080
)

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$Port/")
$listener.Prefixes.Add("http://127.0.0.1:$Port/")

try {
    $listener.Start()
} catch {
    $Port = 5500
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:$Port/")
    $listener.Prefixes.Add("http://127.0.0.1:$Port/")
    $listener.Start()
}

$url = "http://localhost:$Port/"
Write-Host "=========================================="
Write-Host " Servidor rodando em: $url"
Write-Host " Servidor rodando em: http://127.0.0.1:$Port/"
Write-Host "=========================================="

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".svg"  = "image/svg+xml"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".png"  = "image/png"
    ".ico"  = "image/x-icon"
}

$baseDir = $PSScriptRoot
if (-not $baseDir) { $baseDir = (Get-Item -Path ".").FullName }

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $rawPath = $request.Url.AbsolutePath.TrimStart('/')
        $localPath = [System.Uri]::UnescapeDataString($rawPath)
        if ([string]::IsNullOrWhiteSpace($localPath) -or $localPath -eq "/") {
            $localPath = "index.html"
        }
        
        # Replace forward slashes with system path separator
        $normalizedPath = $localPath.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $filePath = Join-Path $baseDir $normalizedPath
        
        Write-Host "[REQUEST] $($request.HttpMethod) $rawPath -> $filePath"
        
        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $contentType = $mimeTypes[$ext]
            if (-not $contentType) { $contentType = "application/octet-stream" }
            
            $response.ContentType = $contentType
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            $response.StatusCode = 200
        } else {
            $response.StatusCode = 404
            $notFound = [System.Text.Encoding]::UTF8.GetBytes("<html><body><h2>404 Not Found</h2><p>Arquivo nao encontrado: $localPath</p></body></html>")
            $response.ContentType = "text/html; charset=utf-8"
            $response.ContentLength64 = $notFound.Length
            $response.OutputStream.Write($notFound, 0, $notFound.Length)
        }
        $response.Close()
    } catch {
        Write-Host "[ERROR] $_"
    }
}
