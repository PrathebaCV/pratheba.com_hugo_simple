<h1 align="center">Pratheba's Personal Website</h1>

<p align="center">A personal portfolio website built with Hugo and Tailwind CSS, showcasing my work, projects, and professional journey.</p>

<p align="center">Built with ♥ using Hugo and modern web technologies</p>
<p align=center> If you find this project useful, please give it a ⭐ to show your support.</p>

<h2 align="center"> <a target="_blank" href="https://pratheba.com" rel="nofollow">🌐 Live Site</a> | <a target="_blank" href="#" rel="nofollow">📱 Mobile Optimized</a>
</h2>

<p align="center">
  <a href="https://github.com/gohugoio/hugo/releases/tag/v0.126.0" alt="Hugo Version">
    <img src="https://img.shields.io/static/v1?label=Hugo-version&message=0.126.0&color=f00&logo=hugo" />
  </a>
  <a href="https://github.com/PrathebaCV/pratheba.com_hugo_simple/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/PrathebaCV/pratheba.com_hugo_simple" alt="license">
  </a>
  <a href="https://github.com/PrathebaCV/pratheba.com_hugo_simple">
    <img src="https://img.shields.io/github/languages/code-size/PrathebaCV/pratheba.com_hugo_simple" alt="code size">
  </a>
</p>

## � About This Website

This is my personal portfolio website where I showcase my professional work, projects, and share my thoughts through blog posts. The site is built with modern web technologies focusing on performance, accessibility, and user experience.

### ✨ Key Features

- 🌍 Multi-language support (English & Tamil)
- 📱 Fully responsive design
- 🌑 Dark/Light mode toggle
- ⚡ Fast loading and optimized performance
- � Blog with markdown support
- 🎨 Clean and modern design
- � Search functionality
- 📧 Contact form integration
- 🏷️ Tags and categories for content organization
- � SEO optimized

### 📄 Pages & Sections

- 🏠 **Homepage** - Introduction and overview
- 👤 **About** - Professional background and personal story
- � **Portfolio** - Showcase of projects and work
- 📝 **Blog** - Technical articles and personal insights
- � **Contact** - Get in touch form and information
- � **Search** - Find content across the site
- 🏷️ **Tags & Categories** - Content organization
- 🌐 **Language Toggle** - English/Tamil content

### � Tech Stack

- **Framework:** [Hugo](https://gohugo.io/) - Static site generator
- **Styling:** [Tailwind CSS v4.0](https://tailwindcss.com/) - Utility-first CSS
- **Language:** HTML, CSS, JavaScript
- **Content:** [Markdown](https://markdownguide.org/) - Easy content management
- **Build Tools:** [AutoPrefixer](https://autoprefixer.github.io/), [Prettier](https://prettier.io/)
- **Deployment:** [Netlify](https://www.netlify.com/) / [Vercel](https://vercel.com/)
- **Version Control:** Git & GitHub

---

## 🚀 Getting Started

If you want to clone this project or use it as a template for your own site:

### ⚙️ Prerequisites

- [Hugo Extended v0.144+](https://gohugo.io/installation/)
- [Node v22+](https://nodejs.org/en/download/)
- [Go v1.24+](https://go.dev/doc/install)

### 👉 Installation

1. **Clone the repository**
```bash
git clone https://github.com/PrathebaCV/pratheba.com_hugo_simple.git
cd pratheba.com_hugo_simple
```

2. **Install dependencies**
```bash
npm install
```

3. **Start development server**
```bash
npm run dev
```

4. **Build for production**
```bash
npm run build
```

---

## 📝 Content Management

### Adding New Blog Posts

Create new markdown files in the `content/english/blog/` directory:

```bash
hugo new content/english/blog/my-new-post.md
```

### Multi-language Content

- English content: `content/english/`
- Tamil content: `content/tamil/`

### Customization

- **Site configuration:** `hugo.toml`
- **Parameters:** `config/_default/params.toml`
- **Languages:** `config/_default/languages.toml`
- **Themes & Colors:** `data/theme.json`

---

## 🚀 Deployment

The site is configured for easy deployment on multiple platforms:

- **Netlify:** Pre-configured with `netlify.toml`
- **Vercel:** Ready for Vercel deployment
- **GitHub Pages:** Can be deployed using GitHub Actions
- **Traditional hosting:** Build generates static files in `public/`

### Quick Deploy Commands

```bash
# Build for production
npm run build

# The built site will be in the 'public' directory
# Upload the contents to your hosting provider
```

---

## 📝 Customization

This template has been designed with a lot of customization options in mind. You can customize almost anything you want, including:

### 👉 Site Config

You can change the site title, base URL, language, theme, plugins, and more from the `hugo.toml` file.

### 👉 Site Params

You can customize all the parameters from the `config/_default/params.toml` file. This includes the logo, favicon, search, SEO metadata, and more.

### 👉 Colors and Fonts

You can change the colors and fonts from the `data/theme.json` file. This includes the primary color, secondary color, font family, and font size.

### 👉 Social Links

You can change the social links from the `data/social.json` file. Add your social links here, and they will automatically be displayed on the site.

---

## 🤝 Contributing

While this is a personal website, I welcome:

- � Bug reports
- 💡 Feature suggestions  
- 🔧 Performance improvements
- 📝 Content suggestions

Feel free to [open an issue](https://github.com/PrathebaCV/pratheba.com_hugo_simple/issues) or submit a pull request.

---

## � Contact

- **Website:** [pratheba.com](https://pratheba.com)
- **Email:** [contact@pratheba.com](mailto:contact@pratheba.com)
- **LinkedIn:** [Connect with me](https://linkedin.com/in/pratheba)
- **GitHub:** [@PrathebaCV](https://github.com/PrathebaCV)

---

## 🚀 Build And Deploy

After you finish your development, you can build or deploy your project almost everywhere. Let's see the process:

### 👉 Build Command

To build your project locally, you can use the following command.

```bash
npm run build
```

### 👉 Deploy Site

The site is pre-configured for multiple deployment platforms:

- [Netlify](https://www.netlify.com/)
- [Vercel](https://vercel.com/)
- [Github Actions](https://github.com/features/actions)
- [AWS Amplify](https://aws.amazon.com/amplify/)

And if you want to host on other platforms, you can build your project and get a `public` folder that you can copy and paste to your hosting platform.

> **Note:** You must change the `baseURL` in the `hugo.toml` file. Otherwise, your site will not work properly.

---

## � License

This project is open source and available under the [MIT License](LICENSE).

---

## � Acknowledgments

- Built using the [Hugoplate](https://github.com/zeon-studio/hugoplate) template
- Thanks to the Hugo and Tailwind CSS communities
- Inspired by modern web design principles

---

*Last updated: September 2025*
