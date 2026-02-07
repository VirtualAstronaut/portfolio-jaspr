# Portfolio Website - Sujal Abhani

A modern, terminal-styled portfolio website built with [Jaspr](https://jaspr.dev/), showcasing the professional work and skills of Sujal Abhani - Senior Flutter Developer & Mobile Architect.

![Project Status](https://img.shields.io/badge/status-active-success)
![Jaspr](https://img.shields.io/badge/Jaspr-0.22.1-blue)
![Dart](https://img.shields.io/badge/Dart-3.9.0+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## 🌟 Overview

This portfolio website features a sophisticated terminal-inspired design with a subtle Matrix rain animation background. It presents professional experience, freelance projects, technical skills, and contact information in a clean, developer-focused aesthetic.

### Key Features

- **Terminal-Style Design**: Elegant dark theme inspired by GitHub's color palette
- **Matrix Rain Animation**: Subtle, non-intrusive background animation using HTML5 Canvas
- **Responsive Layout**: Fully responsive design optimized for mobile, tablet, and desktop
- **Static Site Generation**: Built with Jaspr in static mode for optimal performance
- **Server-Side Rendering**: Pre-rendered content for fast initial page loads
- **Client-Side Hydration**: Interactive components with smooth transitions
- **Accessibility**: Semantic HTML and keyboard navigation support
- **Modern Typography**: JetBrains Mono font for authentic terminal feel

## 🚀 Quick Start

### Prerequisites

- **Dart SDK**: `^3.9.0`
- **Flutter**: `3.38.5` (managed via FVM)
- **Jaspr CLI**: Install via `dart pub global activate jaspr`

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd portfolio-jaspr
   ```

2. **Install dependencies**
   ```bash
   dart pub get
   ```

3. **Run the development server**
   ```bash
   jaspr serve
   ```
   
   The development server will be available at `http://localhost:8080`

4. **Build for production**
   ```bash
   jaspr build
   ```
   
   The static build output will be located in the `build/jaspr/` directory.

## 📁 Project Structure

```
portfolio-jaspr/
├── lib/
│   ├── app.dart                 # Root client component with global styles
│   ├── main.client.dart         # Client-side entry point
│   ├── main.server.dart         # Server-side entry point (SSR)
│   ├── constants/
│   │   └── theme.dart           # Color scheme and theme constants
│   └── pages/
│       └── home.dart            # Main portfolio page component
├── web/
│   ├── styles.css               # Custom CSS for styling and animations
│   ├── matrix-rain.js           # Matrix rain background animation
│   ├── favicon.ico              # Site favicon
│   └── images/
│       └── logo.svg             # Logo asset
├── .fvmrc                       # Flutter version configuration
├── .gitignore                   # Git ignore rules
├── analysis_options.yaml        # Dart analyzer configuration
├── pubspec.yaml                 # Project dependencies
└── README.md                    # This file
```

## 🛠️ Technology Stack

### Core Framework

| Technology | Version | Purpose |
|------------|---------|---------|
| **Jaspr** | `^0.22.1` | Modern web framework for Dart |
| **Dart** | `^3.9.0` | Programming language |
| **Flutter** | `3.38.5` | Dart SDK version (via FVM) |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `build_runner` | `^2.10.0` | Code generation tool |
| `build_web_compilers` | `^4.4.7` | Dart-to-JavaScript compilers |
| `jaspr_builder` | `^0.22.1` | Jaspr code generation |
| `lints` | `^5.0.0` | Recommended Dart lints |

### Frontend Technologies

- **HTML5**: Semantic markup structure
- **CSS3**: Custom styling with animations and responsive design
- **JavaScript (ES6+)**: Matrix rain canvas animation
- **Google Fonts**: JetBrains Mono typography

## 🎨 Design System

### Color Palette

The theme uses a professional, muted color scheme inspired by GitHub's dark mode:

| Color Name | Hex Code | Usage |
|------------|----------|-------|
| `primaryText` | `#c9d1d9` | Main text content |
| `secondaryText` | `#8b949e` | Labels and secondary text |
| `dimText` | `#6e7681` | Separators and dimmed elements |
| `accentBlue` | `#58a6ff` | Links and interactive elements |
| `accentTeal` | `#56d4dd` | Highlights and hover states |
| `accentGold` | `#d29922` | Section titles |
| `accentGreen` | `#7ee787` | Status indicators |
| `accentPurple` | `#bc8cff` | Markers and bullets |
| `accentOrange` | `#f0883e` | Feature bullets |
| `terminalBg` | `#0d1117` | Background color |
| `terminalBgLight` | `#161b22` | Lighter background elements |
| `terminalBorder` | `#30363d` | Borders and dividers |

### Typography

- **Primary Font**: JetBrains Mono (with fallbacks to Fira Code, SF Mono, Consolas, and system monospace)
- **Font Size**: 14px base
- **Line Height**: 1.7em for readability

## 📄 Page Sections

### 1. Header
- Main title: "SUJAL ABHANI"
- Subtitle: "Flutter Architect"
- Tagline: "Remote • Freelance • Full-time"

### 2. Profile Information
- Role: Senior Flutter Developer | Mobile Architect
- Specialty: Production-grade mobile apps
- Domains: E-commerce • Workforce • Healthcare • Digital Health
- Mode: Remote / Contract / Full-time

### 3. Connect Section
- Email: abhanisujal@gmail.com
- Phone: +91 9974332212

### 4. Professional Work
Featured projects include:
- **TicketBy** (Middle East) - Event discovery & ticketing marketplace
- **Tubo.ph** - Mobile workforce attendance & leave platform
- **Synapp** - Secure clinical communication platform (GDPR compliant)

### 5. Freelance Work
- **ThyForLife** - Thyroid health tracking & support community

### 6. Tech Stack
- Flutter • Dart • Mobile Architecture
- REST APIs • Secure Data Handling
- Performance Optimization • CI/CD
- App Store & Play Store Deployment

### 7. Working Style
- Ownership from feature design to release
- Strong focus on maintainability and scalability
- Comfortable in regulated and high-reliability domains
- Experience in both company and freelance environments

### 8. System Status
- Status indicator with pulse animation

### 9. Footer
- Copyright and additional links

## 🎬 Matrix Rain Animation

The background features a subtle Matrix rain animation implemented in JavaScript using HTML5 Canvas:

- **Characters**: Japanese katakana and numeric digits
- **Colors**: Varied opacity with occasional bright highlights (green, blue, teal)
- **Performance**: Optimized with `requestAnimationFrame`
- **Responsiveness**: Automatically adjusts to window resize
- **Z-Index**: Positioned behind content (`z-index: -1`)

## 🔧 Configuration

### Jaspr Configuration (`pubspec.yaml`)

```yaml
jaspr:
  mode: static  # Static site generation mode
```

### Analyzer Configuration (`analysis_options.yaml`)

- **Formatter**: 120 character line width
- **Trailing Commas**: Preserve
- **Lints**: Recommended set from `package:lints`
- **Jaspr Lints**: Enabled with custom diagnostics

## 📱 Responsive Design

The site is fully responsive with breakpoints for:

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

Mobile-specific features:
- Safe area padding for notched devices
- Touch-friendly link targets
- Flexible wrapping for long content
- Optimized viewport scaling

## 🌐 Deployment

### Build Process

```bash
# Build the static site
jaspr build

# Output location
build/jaspr/
```

### Deployment Options

The static build can be deployed to any static hosting service:

- **GitHub Pages**: Push `build/jaspr/` contents to `gh-pages` branch
- **Netlify**: Connect repository and set publish directory to `build/jaspr/`
- **Vercel**: Import repository and configure output directory
- **Cloudflare Pages**: Deploy via Git integration
- **AWS S3 + CloudFront**: Upload contents to S3 bucket

### Environment Variables

No environment variables are required for this static site.

## 🤝 Contributing

This is a personal portfolio website. However, suggestions and improvements are welcome:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 👤 Author

**Sujal Abhani**
- **Role**: Senior Flutter Developer & Mobile Architect
- **Email**: abhanisujal@gmail.com
- **Phone**: +91 9974332212
- **Work Mode**: Remote • Freelance • Full-time

## 🔗 Links

- [Jaspr Documentation](https://jaspr.dev/docs)
- [Dart Language](https://dart.dev/)
- [Flutter](https://flutter.dev/)
- [JetBrains Mono Font](https://fonts.google.com/specimen/JetBrains+Mono)

## 📊 Project Metrics

| Metric | Value |
|--------|-------|
| Project Type | Static Portfolio Website |
| Framework | Jaspr 0.22.1 |
| Language | Dart 3.9.0+ |
| Build Mode | Static Site Generation |
| Rendering | Server-Side + Client Hydration |
| Animation | Canvas-based Matrix Rain |

---

**Built with ❤️ using Jaspr**
