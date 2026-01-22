import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'portfolio', [
      // Header without ASCII art
      _buildHeader(),
      // Profile Info
      _buildProfileInfo(),
      // Connect Section
      _buildConnectSection(),
      // Professional Work
      _buildProfessionalWork(),
      // Freelance Work
      _buildFreelanceWork(),
      // Tech Stack
      _buildTechStack(),
      // Working Style
      _buildWorkingStyle(),
      // System Status
      _buildSystemStatus(),
      // Footer
      _buildFooter(),
    ]);
  }

  Component _buildHeader() {
    return div(classes: 'header-section', [
      h1(classes: 'main-title', [Component.text('SUJAL ABHANI')]),
      div(classes: 'subtitle', [Component.text('Flutter Architect')]),
      div(classes: 'tagline', [Component.text('Remote • Freelance • Full-time')]),
    ]);
  }

  Component _buildProfileInfo() {
    return div(classes: 'profile-section', [
      _profileLine('ROLE', 'Senior Flutter Developer | Mobile Architect'),
      _profileLine('SPECIALTY', 'Production-grade mobile apps'),
      _profileLine('DOMAINS', 'E-commerce • Workforce • Healthcare • Digital Health', valueClass: 'domains'),
      _profileLine('MODE', 'Remote / Contract / Full-time'),
    ]);
  }

  Component _profileLine(String label, String value, {String? valueClass}) {
    return div(classes: 'profile-line', [
      span(classes: 'label', [Component.text(label)]),
      span(classes: 'separator', [Component.text(':')]),
      span(classes: valueClass != null ? 'value $valueClass' : 'value', [Component.text(value)]),
    ]);
  }

  Component _buildConnectSection() {
    return div(classes: 'section', [
      _sectionHeader('CONNECT'),
      div(classes: 'connect-box', [
        div(classes: 'connect-row', [
          div(classes: 'connect-item', [
            span(classes: 'icon', [Component.text('[@]')]),
            span(classes: 'connect-label', [Component.text(' EMAIL : ')]),
            a(href: 'mailto:abhanisujal@gmail.com', [Component.text('abhanisujal@gmail.com')]),
          ]),
          div(classes: 'connect-divider', [Component.text('|')]),
          div(classes: 'connect-item', [
            span(classes: 'icon', [Component.text('[#]')]),
            span(classes: 'connect-label', [Component.text(' PHONE : ')]),
            a(href: 'tel:+919974332212', [Component.text('+91 9974332212')]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _sectionHeader(String title) {
    return div(classes: 'section-header', [
      span(classes: 'prompt', [Component.text('>')]),
      span(classes: 'section-title', [Component.text(' $title')]),
    ]);
  }

  Component _buildProfessionalWork() {
    return div(classes: 'section', [
      _sectionHeader('PROFESSIONAL WORK'),
      _buildProject(
        title: 'TicketBy',
        location: 'Middle East',
        description: 'Event discovery & ticketing marketplace',
        features: [
          'Live event browsing by city & category',
          'Ticket purchase and user account flows',
          'Organizer listings and backend integrations',
        ],
        url: 'https://app.ticketby.com.sa/en',
      ),
      _buildProject(
        title: 'Tubo.ph',
        location: null,
        description: 'Mobile workforce attendance & leave platform',
        features: [
          'Geo-tagged clock-in / clock-out',
          'Attendance, overtime, and leave workflows',
          'Employer dashboards and approvals',
        ],
        url: 'http://tubo.ph/',
      ),
      _buildProject(
        title: 'Synapp',
        location: null,
        description: 'Secure clinical communication platform (GDPR)',
        features: [
          'Encrypted real-time messaging',
          'Care-team coordination workflows',
          'Privacy-first mobile architecture',
        ],
        url: 'https://www.synapp.eu/',
      ),
    ]);
  }

  Component _buildFreelanceWork() {
    return div(classes: 'section', [
      _sectionHeader('FREELANCE WORK'),
      _buildProject(
        title: 'ThyForLife',
        location: null,
        description: 'Thyroid health tracking & support community',
        features: [
          'Symptom, medication, and lab tracking',
          'Reminders and long-term health insights',
          'Community engagement and education',
        ],
        url: 'https://www.thyforlife.com/',
      ),
    ]);
  }

  Component _buildProject({
    required String title,
    String? location,
    required String description,
    required List<String> features,
    required String url,
  }) {
    return div(classes: 'project', [
      div(classes: 'project-header', [
        span(classes: 'project-marker', [Component.text('::')]),
        span(classes: 'project-title', [Component.text(' $title')]),
        if (location != null) span(classes: 'project-location', [Component.text(' ($location)')]),
      ]),
      div(classes: 'project-description', [Component.text(description)]),
      div(classes: 'project-features', [
        for (final feature in features)
          div(classes: 'feature', [
            span(classes: 'feature-marker', [Component.text('—')]),
            span([Component.text(' $feature')]),
          ]),
      ]),
      div(classes: 'project-url', [
        a(href: url, target: Target.blank, [Component.text(url)]),
      ]),
    ]);
  }

  Component _buildTechStack() {
    return div(classes: 'section', [
      _sectionHeader('TECH STACK'),
      div(classes: 'tech-content', [
        div(classes: 'tech-line', [Component.text('Flutter • Dart • Mobile Architecture')]),
        div(classes: 'tech-line', [Component.text('REST APIs • Secure Data Handling')]),
        div(classes: 'tech-line', [Component.text('Performance Optimization • CI/CD')]),
        div(classes: 'tech-line', [Component.text('App Store & Play Store Deployment')]),
      ]),
    ]);
  }

  Component _buildWorkingStyle() {
    return div(classes: 'section', [
      _sectionHeader('WORKING STYLE'),
      div(classes: 'working-content', [
        _workingItem('Ownership from feature design to release'),
        _workingItem('Strong focus on maintainability and scalability'),
        _workingItem('Comfortable in regulated and high-reliability domains'),
        _workingItem('Experience in both company and freelance environments'),
      ]),
    ]);
  }

  Component _workingItem(String content) {
    return div(classes: 'working-item', [
      span(classes: 'working-marker', [Component.text('—')]),
      span([Component.text(' $content')]),
    ]);
  }

  Component _buildSystemStatus() {
    return div(classes: 'section system-status', [
      _sectionHeader('STATUS'),
      div(classes: 'status-content', [
        span(classes: 'status-indicator', [Component.text('●')]),
        span(classes: 'status-text', [Component.text(' Available for Senior Mobile & Freelance Roles')]),
      ]),
    ]);
  }

  Component _buildFooter() {
    return div(classes: 'footer', [
      div(classes: 'cursor-blink', [Component.text('█')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Portfolio container
    css('.portfolio').styles(
      padding: Padding.symmetric(vertical: 20.px),
    ),

    // Header Section
    css('.header-section').styles(
      margin: Margin.only(bottom: 40.px),
      padding: Padding.only(left: 20.px),
    ),
    css('.main-title').styles(
      color: primaryText,
      fontSize: 32.px,
      fontWeight: FontWeight.w600,
      letterSpacing: 4.px,
      margin: Margin.only(bottom: 8.px),
    ),
    css('.subtitle').styles(
      color: accentTeal,
      fontSize: 18.px,
      fontWeight: FontWeight.w500,
      margin: Margin.only(bottom: 6.px),
    ),
    css('.tagline').styles(
      color: secondaryText,
      fontSize: 14.px,
    ),

    // Profile Section
    css('.profile-section').styles(
      margin: Margin.only(bottom: 30.px),
      padding: Padding.only(left: 20.px),
    ),
    css('.profile-line').styles(
      display: Display.flex,
      margin: Margin.only(bottom: 8.px),
    ),
    css('.label').styles(
      color: secondaryText,
      display: Display.inlineBlock,
      minWidth: 100.px,
    ),
    css('.separator').styles(
      color: dimText,
      margin: Margin.only(right: 10.px),
    ),
    css('.value').styles(
      color: primaryText,
    ),
    css('.value.domains').styles(
      color: accentTeal,
    ),

    // Sections
    css('.section').styles(
      margin: Margin.only(bottom: 30.px),
    ),
    css('.section-header').styles(
      fontSize: 15.px,
      margin: Margin.only(bottom: 15.px),
    ),
    css('.prompt').styles(
      color: accentGreen,
      fontWeight: FontWeight.w500,
    ),
    css('.section-title').styles(
      color: accentGold,
      fontWeight: FontWeight.w500,
    ),

    // Connect Box
    css('.connect-box').styles(
      border: Border.all(color: terminalBorder, width: 1.px),
      display: Display.inlineBlock,
      margin: Margin.only(left: 20.px),
      padding: Padding.symmetric(horizontal: 15.px, vertical: 12.px),
    ),
    css('.connect-row').styles(
      display: Display.flex,
    ),
    css('.connect-item').styles(
      display: Display.flex,
    ),
    css('.icon').styles(
      color: accentGold,
      fontWeight: FontWeight.w500,
    ),
    css('.connect-label').styles(
      color: secondaryText,
    ),
    css('.connect-divider').styles(
      color: terminalBorder,
      margin: Margin.symmetric(horizontal: 10.px),
    ),

    // Projects
    css('.project').styles(
      margin: Margin.only(bottom: 25.px, left: 20.px),
      padding: Padding.only(left: 15.px),
    ),
    css('.project-header').styles(
      margin: Margin.only(bottom: 5.px),
    ),
    css('.project-marker').styles(
      color: accentPurple,
      fontWeight: FontWeight.w500,
    ),
    css('.project-title').styles(
      color: accentGreen,
      fontWeight: FontWeight.w500,
    ),
    css('.project-location').styles(
      color: secondaryText,
    ),
    css('.project-description').styles(
      color: accentTeal,
      margin: Margin.only(bottom: 8.px),
    ),
    css('.project-features').styles(
      margin: Margin.only(bottom: 8.px),
    ),
    css('.feature').styles(
      color: primaryText,
      margin: Margin.only(bottom: 3.px),
    ),
    css('.feature-marker').styles(
      color: dimText,
    ),
    css('.project-url').styles(
      margin: Margin.only(top: 5.px),
    ),
    css('.project-url a').styles(
      color: accentBlue,
      fontSize: 12.px,
    ),

    // Tech Stack
    css('.tech-content').styles(
      margin: Margin.only(left: 20.px),
      padding: Padding.only(left: 15.px),
    ),
    css('.tech-line').styles(
      color: primaryText,
      margin: Margin.only(bottom: 5.px),
    ),

    // Working Style
    css('.working-content').styles(
      margin: Margin.only(left: 20.px),
      padding: Padding.only(left: 15.px),
    ),
    css('.working-item').styles(
      color: primaryText,
      margin: Margin.only(bottom: 5.px),
    ),
    css('.working-marker').styles(
      color: dimText,
    ),

    // System Status
    css('.system-status').styles(
      margin: Margin.only(top: 40.px),
    ),
    css('.status-content').styles(
      margin: Margin.only(left: 20.px),
      padding: Padding.only(left: 15.px),
    ),
    css('.status-indicator').styles(
      color: accentGreen,
    ),
    css('.status-text').styles(
      color: accentGreen,
      fontWeight: FontWeight.w500,
    ),

    // Footer with blinking cursor
    css('.footer').styles(
      margin: Margin.only(top: 40.px),
      padding: Padding.only(left: 20.px),
    ),
    css('.cursor-blink').styles(
      color: secondaryText,
    ),
  ];
}
