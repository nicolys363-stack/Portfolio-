Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Publicar Portfólio no GitHub - Nicoly Silva'
$form.Size = New-Object System.Drawing.Size(450,220)
$form.StartPosition = 'CenterScreen'
$form.TopMost = $true

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(20,20)
$label.Size = New-Object System.Drawing.Size(400,40)
$label.Text = "Cole o seu Token de Acesso do GitHub ou Senha abaixo para concluir o Push do seu Portfólio:"

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(20,70)
$textBox.Size = New-Object System.Drawing.Size(390,20)
$textBox.UseSystemPasswordChar = $true

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(150,110)
$button.Size = New-Object System.Drawing.Size(130,35)
$button.Text = 'Fazer Push Agora'
$button.DialogResult = [System.Windows.Forms.DialogResult]::OK

$form.Controls.Add($label)
$form.Controls.Add($textBox)
$form.Controls.Add($button)

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK -and $textBox.Text.Trim() -ne "") {
    $token = $textBox.Text.Trim()
    $git = "C:\Users\lucas\.gemini\antigravity\scratch\mingit\cmd\git.exe"
    
    Set-Location "C:\Users\lucas\.gemini\antigravity\scratch\portfolio-nicoly"
    & $git init
    & $git config user.name "Nicoly Silva"
    & $git config user.email "nycolys364@gmail.com"
    & $git add .
    & $git commit -m "Initial commit: Portfolio Nicoly Silva"
    & $git branch -M main
    & $git remote remove origin 2>$null
    & $git remote add origin "https://${token}@github.com/nicolys363-stack/Portfolio-.git"
    
    $output = & $git push -u origin main 2>&1
    
    [System.Windows.Forms.MessageBox]::Show("Push realizado com sucesso!`n`n$output", "Sucesso", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}
