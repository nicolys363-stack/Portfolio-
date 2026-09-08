<div align="center">

# 💜 Portfólio Profissional — Nicoly Silva

**Estudante de Ciência da Computação na FIAP • Bolsista 100% • Desenvolvedora Web**

[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://developer.mozilla.org/pt-BR/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)](https://developer.mozilla.org/pt-BR/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-9333EA?style=for-the-badge)](LICENSE)

<br />

[Visualizar Projetos](#-projetos-em-destaque) •
[Habilidades & Tecnologias](#-tecnologias--competências) •
[Como Executar Localmente](#-como-executar-localmente) •
[Contato](#-contato--redes)

</div>

---

## 👩‍💻 Sobre o Projeto

Este repositório contém o código-fonte do portfólio profissional de **Nicoly Silva**, desenvolvido com foco em alta performance, estética moderna em **modo escuro com paleta roxa sofisticada**, design responsivo e arquitetura semântica limpa.

O portfólio consolida sua trajetória acadêmica na graduação em **Ciência da Computação na FIAP (1º semestre, Bolsista 100%)**, suas qualificações profissionais pelo **SENAI** e **SENAC**, além de seus principais projetos práticos desenvolvidos na área de desenvolvimento web e aplicações.

---

## ✨ Destaques de Arquitetura & UX

- ⚡ **Zero Dependências Pesadas:** Desenvolvido em HTML5 semântico, CSS3 moderno com variáveis customizadas e JavaScript puro (*Vanilla JS*) para carregamento instantâneo.
- 🎨 **Design System Sofisticado:** Paleta de cores em roxo moderno (*amethyst, royal violet & radiant lilac*), com efeitos sutis de *glassmorphism*, *glows* e tipografia moderna (*Outfit* & *Plus Jakarta Sans*).
- 📱 **100% Responsivo:** Otimizado para smartphones, tablets, notebooks e desktops.
- 🔍 **SEO & Acessibilidade:** Metadados estruturados, Open Graph completo, semântica ARIA e alta legibilidade.
- 🛡️ **Segurança & Boas Práticas:** Estrutura limpa, sem credenciais expostas e `.gitignore` configurado.

---

## 🚀 Projetos em Destaque

| Projeto | Descrição | Tecnologias | Link do Deploy |
| :--- | :--- | :--- | :---: |
| **Dr. Nick** | Interface moderna desenvolvida durante curso do SENAI com foco em UX. | Google Antigravity, UI/UX, Web | [Acessar Projeto 🔗](https://dr-nick.netlify.app/) |
| **Lista de Tarefas** | Aplicação completa para gestão de atividades com persistência em banco de dados e operações CRUD. | JavaScript, Banco de Dados, CRUD, Web | [Acessar Projeto 🔗](https://lista-tarefas-842l.vercel.app/) |
| **Página Smartwatch** | Landing page de alta conversão para smartwatch com design responsivo e experiência de usuário moderna. | Google Antigravity, UX/UI, Landing Page | [Acessar Projeto 🔗](https://pagina-de-vendas-sage.vercel.app/) |
| **CoopStar** | Site institucional corporativo para empresa de logística contendo seções de serviços e formulário de contato. | HTML5, CSS3, Web, Formulários | [Acessar Projeto 🔗](https://coopstarn.netlify.app/) |

---

## 🛠️ Tecnologias & Competências

- **Desenvolvimento Web & Front-end:** HTML5, CSS3, JavaScript (ES6+), Design Responsivo, Flexbox/Grid, Glassmorphism.
- **Dados & Aplicações:** Python, Fundamentos de Data Science, Modelagem & Persistência em Banco de Dados.
- **Ferramentas & Design:** Google Antigravity, Prototipagem, UX/UI Design.
- **Formações:** Graduação em Ciência da Computação na FIAP (em andamento, Bolsista 100%), Cursos SENAI & SENAC.

---

## 📂 Estrutura de Diretórios

```
portfolio-nicoly/
├── index.html              # Estrutura principal da página (SEO, seções e acessibilidade)
├── css/
│   └── styles.css          # Design System, variáveis de tema roxo, layout e responsividade
├── js/
│   └── main.js             # Lógica do menu mobile, scroll spy, animações e interações
├── images/
│   ├── favicon.svg         # Ícone em vetor SVG com monograma NS
│   ├── profile.jpg         # Foto profissional de Nicoly Silva
│   └── projects/           # Mockups vetoriais em SVG dos 4 projetos
├── .env.example            # Template de variáveis de ambiente
├── .gitignore              # Proteção contra envio de arquivos desnecessários
├── package.json            # Metadados e scripts de execução
├── push_to_github.ps1      # Script PowerShell para deploy automatizado no GitHub
├── push_to_github.bat      # Script Batch (1 clique) para deploy no GitHub
├── server.ps1              # Servidor estático local em PowerShell
└── README.md               # Documentação técnica do projeto
```

---

## 💻 Como Executar Localmente

### Opção 1: Servidor Integrado em PowerShell
Execute o comando abaixo no terminal da pasta do projeto:
```powershell
powershell -ExecutionPolicy Bypass -File .\server.ps1 -Port 8080
```
O projeto abrirá automaticamente em **`http://localhost:8080/`**.

### Opção 2: Abrir Diretamente no Navegador
Basta dar dois cliques no arquivo `index.html`.

### Opção 3: Usando Node / NPX
```bash
npx serve .
```

---

## 🚢 Como Publicar no GitHub

Para conectar este projeto ao seu repositório remoto [`https://github.com/nicolys363-stack/Portfolio-.git`](https://github.com/nicolys363-stack/Portfolio-.git):

### Método Rápido (Script Automatizado)
Basta dar dois cliques em `push_to_github.bat` ou executar no PowerShell:
```powershell
.\push_to_github.ps1
```

### Método Manual via Git CLI
```bash
# 1. Inicializar o repositório
git init
git branch -M main

# 2. Conectar ao repositório remoto
git remote add origin https://github.com/nicolys363-stack/Portfolio-.git

# 3. Adicionar os arquivos e criar o commit inicial
git add .
git commit -m "feat: initial release of professional portfolio for Nicoly Silva"

# 4. Enviar para a branch principal
git push -u origin main
```

---

## 📬 Contato & Redes

- **LinkedIn:** [linkedin.com/in/nicoly-silva-946a0a241](https://www.linkedin.com/in/nicoly-silva-946a0a241)
- **GitHub:** [github.com/nicolys363-stack](https://github.com/nicolys363-stack)
- **E-mail:** [nycolys364@gmail.com](mailto:nycolys364@gmail.com)

---

<div align="center">
  <sub>© 2026 Nicoly Silva. "Transformando aprendizado em projetos."</sub>
</div>
