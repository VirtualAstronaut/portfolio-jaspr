import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import 'components/navigation.dart';

class ModernPortfolio extends StatelessComponent {
  const ModernPortfolio({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'modern-portfolio', [
      const Navigation(
        currentRoute: 'modern',
        onRouteChange: null,
      ),
      const HeroSection(),
      const AboutSection(),
      const ProjectsSection(),
      const SkillsSection(),
      const ContactSection(),
      const Footer(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        // Base styles
        css('.modern-portfolio').styles(
          backgroundColor: modernBgPrimary,
          color: modernTextPrimary,
          fontFamily: FontFamily.list([
            FontFamily('Inter'),
            FontFamily('system-ui'),
            FontFamilies.sansSerif,
          ]),
          lineHeight: 1.6,
          minHeight: 100.vh,
          paddingTop: 80.px, // Account for fixed nav
        ),
        
        // Section common styles
        css('section').styles(
          padding: Padding.symmetric(vertical: 100.px),
          maxWidth: 1200.px,
          margin: Margin.symmetric(horizontal: Unit.auto),
        ),
        
        // Section heading
        css('.section-heading').styles(
          textAlign: TextAlign.center,
          marginBottom: 60.px,
        ),
        
        css('.section-title').styles(
          fontSize: 36.px,
          fontWeight: FontWeight.w700,
          marginBottom: 16.px,
          background: LinearGradient.linear(
            to: Alignment.bottomCenter,
            colors: [modernTextPrimary, modernTextSecondary],
          ),
          WebkitBackgroundClip: TextClip.text,
          WebkitTextFillColor: Color.transparent,
        ),
        
        css('.section-subtitle').styles(
          fontSize: 18.px,
          color: modernTextSecondary,
          maxWidth: 600.px,
          margin: Margin.symmetric(horizontal: Unit.auto),
        ),
        
        // Container
        css('.container').styles(
          maxWidth: 1200.px,
          margin: Margin.symmetric(horizontal: Unit.auto),
          padding: Padding.symmetric(horizontal: 24.px),
        ),
        
        // Button styles
        css('.btn').styles(
          display: Display.inlineFlex,
          alignItems: AlignItems.center,
          justifyContent: MainAxisAlignment.center,
          padding: Padding.symmetric(horizontal: 32.px, vertical: 14.px),
          fontSize: 16.px,
          fontWeight: FontWeight.w600,
          borderRadius: BorderRadius.circular(12.px),
          cursor: Cursor.pointer,
          border: Border.none,
          textDecoration: TextDecoration.none,
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.btn-primary').styles(
          background: LinearGradient.linear(
            to: Alignment.bottomRight,
            colors: [modernAccentPrimary, modernAccentSecondary],
          ),
          color: Color.white,
          boxShadow: [
            BoxShadow(
              color: Color.rgba(99, 102, 241, 0.4),
              offsetY: 4.px,
              blurRadius: 20.px,
            ),
          ],
        ),
        
        css('.btn-primary:hover').styles(
          transform: Transform.translateY(-2.px),
          boxShadow: [
            BoxShadow(
              color: Color.rgba(99, 102, 241, 0.6),
              offsetY: 8.px,
              blurRadius: 30.px,
            ),
          ],
        ),
        
        css('.btn-secondary').styles(
          backgroundColor: modernBgSecondary,
          color: modernTextPrimary,
          border: Border.all(color: modernBorder, width: 1.px),
        ),
        
        css('.btn-secondary:hover').styles(
          backgroundColor: modernBgTertiary,
          borderColor: modernAccentPrimary,
        ),
        
        // Responsive
        css('@media (max-width: 768px)').style(
          css('section').styles(
            padding: Padding.symmetric(vertical: 60.px),
          ),
          css('.section-title').styles(
            fontSize: 28.px,
          ),
          css('.section-subtitle').styles(
            fontSize: 16.px,
          ),
        ),
      ];
}

// ============================================================================
// HERO SECTION
// ============================================================================

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero-section', [
      div(classes: 'container hero-content', [
        div(classes: 'hero-text', [
          div(classes: 'hero-badge', [
            span(classes: 'badge-dot'),
            Component.text('Available for opportunities'),
          ]),
          h1(classes: 'hero-title', [
            Component.text('Sujal Abhani'),
          ]),
          p(classes: 'hero-subtitle', [
            Component.text('Flutter Architect • Senior Mobile Developer'),
          ]),
          p(classes: 'hero-description', [
            Component.text(
              'Building production-grade mobile applications with focus on '
              'scalability, performance, and exceptional user experience.',
            ),
          ]),
          div(classes: 'hero-actions', [
            a(
              classes: 'btn btn-primary',
              href: '#contact',
              [Component.text('Get in Touch')],
            ),
            a(
              classes: 'btn btn-secondary',
              href: '#projects',
              [Component.text('View Projects')],
            ),
          ]),
        ]),
        div(classes: 'hero-stats', [
          _statCard('5+', 'Years Experience'),
          _statCard('20+', 'Projects Delivered'),
          _statCard('100%', 'Client Satisfaction'),
        ]),
      ]),
    ]);
  }

  Component _statCard(String value, String label) {
    return div(classes: 'stat-card', [
      div(classes: 'stat-value', [Component.text(value)]),
      div(classes: 'stat-label', [Component.text(label)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.hero-section').styles(
          minHeight: 100.vh,
          display: Display.flex,
          alignItems: AlignItems.center,
          paddingTop: 80.px,
        ),
        
        css('.hero-content').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr],
          gap: 60.px,
          alignItems: AlignItems.center,
        ),
        
        css('.hero-text').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 24.px,
        ),
        
        css('.hero-badge').styles(
          display: Display.inlineFlex,
          alignItems: AlignItems.center,
          gap: 8.px,
          padding: Padding.symmetric(horizontal: 16.px, vertical: 8.px),
          backgroundColor: Color.rgba(16, 185, 129, 0.1),
          borderRadius: BorderRadius.circular(100.px),
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: modernSuccess,
          width: Unit.fitContent,
        ),
        
        css('.badge-dot').styles(
          width: 8.px,
          height: 8.px,
          backgroundColor: modernSuccess,
          borderRadius: BorderRadius.circular(50.percent),
          animation: Animation.named('pulse', duration: Duration(seconds: 2), iterationCount: IterationCount.infinite),
        ),
        
        css('@keyframes pulse').style(
          css('0%, 100%').styles(
            opacity: 1,
          ),
          css('50%').styles(
            opacity: 0.5,
          ),
        ),
        
        css('.hero-title').styles(
          fontSize: 64.px,
          fontWeight: FontWeight.w800,
          lineHeight: 1.1,
          letterSpacing: -2.px,
          margin: Margin.zero,
          background: LinearGradient.linear(
            to: Alignment.bottomCenter,
            colors: [modernTextPrimary, modernTextSecondary],
          ),
          WebkitBackgroundClip: TextClip.text,
          WebkitTextFillColor: Color.transparent,
        ),
        
        css('.hero-subtitle').styles(
          fontSize: 24.px,
          fontWeight: FontWeight.w500,
          color: modernAccentPrimary,
          margin: Margin.zero,
        ),
        
        css('.hero-description').styles(
          fontSize: 18.px,
          color: modernTextSecondary,
          lineHeight: 1.7,
          margin: Margin.zero,
        ),
        
        css('.hero-actions').styles(
          display: Display.flex,
          gap: 16.px,
          flexWrap: FlexWrap.wrap,
        ),
        
        css('.hero-stats').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr],
          gap: 20.px,
        ),
        
        css('.stat-card').styles(
          padding: Padding.all(24.px),
          backgroundColor: modernBgSecondary,
          borderRadius: BorderRadius.circular(16.px),
          border: Border.all(color: modernBorder, width: 1.px),
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.stat-card:hover').styles(
          transform: Transform.translateY(-4.px),
          borderColor: modernAccentPrimary,
          boxShadow: [
            BoxShadow(
              color: Color.rgba(99, 102, 241, 0.1),
              offsetY: 8.px,
              blurRadius: 30.px,
            ),
          ],
        ),
        
        css('.stat-value').styles(
          fontSize: 36.px,
          fontWeight: FontWeight.w700,
          color: modernAccentPrimary,
          marginBottom: 4.px,
        ),
        
        css('.stat-label').styles(
          fontSize: 14.px,
          color: modernTextSecondary,
        ),
        
        // Responsive
        css('@media (max-width: 1024px)').style(
          css('.hero-content').styles(
            gridTemplateColumns: [1.fr],
            textAlign: TextAlign.center,
          ),
          css('.hero-actions').styles(
            justifyContent: MainAxisAlignment.center,
          ),
          css('.hero-stats').styles(
            gridTemplateColumns: [1.fr, 1.fr, 1.fr],
          ),
        ),
        
        css('@media (max-width: 768px)').style(
          css('.hero-title').styles(
            fontSize: 42.px,
          ),
          css('.hero-subtitle').styles(
            fontSize: 20.px,
          ),
          css('.hero-description').styles(
            fontSize: 16.px,
          ),
          css('.hero-stats').styles(
            gridTemplateColumns: [1.fr],
          ),
          css('.hero-actions').styles(
            flexDirection: FlexDirection.column,
          ),
          css('.btn').styles(
            width: Unit.percent(100),
          ),
        ),
      ];
}

// ============================================================================
// ABOUT SECTION
// ============================================================================

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'about-section', [
      div(classes: 'section-heading', [
        h2(classes: 'section-title', [Component.text('About Me')]),
        p(classes: 'section-subtitle', [
          Component.text(
            'Passionate about creating exceptional mobile experiences '
            'that make a real impact.',
          ),
        ]),
      ]),
      div(classes: 'container about-content', [
        div(classes: 'about-grid', [
          div(classes: 'about-text', [
            p([
              Component.text(
                'I\'m a Senior Flutter Developer and Mobile Architect with over 5 years of '
                'experience building production-grade mobile applications. I specialize in '
                'creating scalable, maintainable, and performant apps that deliver exceptional '
                'user experiences.',
              ),
            ]),
            p([
              Component.text(
                'My expertise spans across various domains including e-commerce, workforce '
                'management, healthcare, and digital health. I\'ve worked with both startups '
                'and established companies, helping them bring their mobile visions to life.',
              ),
            ]),
            div(classes: 'about-highlights', [
              _highlightItem('🎯 Feature ownership from design to release'),
              _highlightItem('⚡ Focus on maintainability & scalability'),
              _highlightItem('🔒 Experience in regulated domains'),
              _highlightItem('🌍 Remote-first work experience'),
            ]),
          ]),
          div(classes: 'about-card', [
            div(classes: 'card-header', [
              span(classes: 'card-icon', [Component.text('💼')]),
              h3([Component.text('Current Focus')]),
            ]),
            div(classes: 'card-body', [
              p([
                Component.text(
                  'Available for senior mobile roles and freelance projects. '
                  'Looking for opportunities to work on challenging projects '
                  'that push the boundaries of mobile development.',
                ),
              ]),
              div(classes: 'card-tags', [
                _tag('Flutter'),
                _tag('Dart'),
                _tag('Mobile Architecture'),
                _tag('Clean Code'),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _highlightItem(String text) {
    return div(classes: 'highlight-item', [
      span(classes: 'highlight-icon', [Component.text('✓')]),
      span([Component.text(text)]),
    ]);
  }

  Component _tag(String text) {
    return span(classes: 'tag', [Component.text(text)]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.about-content').styles(
          backgroundColor: modernBgSecondary,
          padding: Padding.all(40.px),
          borderRadius: BorderRadius.circular(24.px),
        ),
        
        css('.about-grid').styles(
          display: Display.grid,
          gridTemplateColumns: [1.2.fr, 0.8.fr],
          gap: 40.px,
        ),
        
        css('.about-text').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 24.px,
        ),
        
        css('.about-text p').styles(
          fontSize: 16.px,
          color: modernTextSecondary,
          lineHeight: 1.8,
          margin: Margin.zero,
        ),
        
        css('.about-highlights').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr],
          gap: 16.px,
        ),
        
        css('.highlight-item').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: 12.px,
          fontSize: 15.px,
          color: modernTextPrimary,
        ),
        
        css('.highlight-icon').styles(
          color: modernAccentPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 18.px,
        ),
        
        css('.about-card').styles(
          backgroundColor: modernBgPrimary,
          padding: Padding.all(32.px),
          borderRadius: BorderRadius.circular(16.px),
          border: Border.all(color: modernBorder, width: 1.px),
        ),
        
        css('.card-header').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: 16.px,
          marginBottom: 24.px,
        ),
        
        css('.card-icon').styles(
          fontSize: 32.px,
        ),
        
        css('.card-header h3').styles(
          fontSize: 20.px,
          fontWeight: FontWeight.w600,
          margin: Margin.zero,
        ),
        
        css('.card-body p').styles(
          fontSize: 15.px,
          color: modernTextSecondary,
          lineHeight: 1.7,
          marginBottom: 20.px,
        ),
        
        css('.card-tags').styles(
          display: Display.flex,
          flexWrap: FlexWrap.wrap,
          gap: 8.px,
        ),
        
        css('.tag').styles(
          padding: Padding.symmetric(horizontal: 12.px, vertical: 6.px),
          backgroundColor: modernBgTertiary,
          borderRadius: BorderRadius.circular(6.px),
          fontSize: 13.px,
          color: modernAccentPrimary,
          fontWeight: FontWeight.w500,
        ),
        
        // Responsive
        css('@media (max-width: 1024px)').style(
          css('.about-grid').styles(
            gridTemplateColumns: [1.fr],
          ),
          css('.about-highlights').styles(
            gridTemplateColumns: [1.fr],
          ),
        ),
      ];
}

// ============================================================================
// PROJECTS SECTION
// ============================================================================

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  final List<ProjectData> projects = const [
    ProjectData(
      title: 'TicketBy',
      description: 'Event discovery & ticketing marketplace for Middle East',
      features: [
        'Live event browsing by city & category',
        'Ticket purchase and user account flows',
        'Organizer listings and backend integrations',
      ],
      url: 'https://app.ticketby.com.sa/en',
      tags: ['Flutter', 'E-commerce', 'Events'],
    ),
    ProjectData(
      title: 'Tubo.ph',
      description: 'Mobile workforce attendance & leave platform',
      features: [
        'Geo-tagged clock-in / clock-out',
        'Attendance, overtime, and leave workflows',
        'Employer dashboards and approvals',
      ],
      url: 'http://tubo.ph/',
      tags: ['Flutter', 'Workforce', 'Geolocation'],
    ),
    ProjectData(
      title: 'Synapp',
      description: 'Secure clinical communication platform (GDPR compliant)',
      features: [
        'Encrypted real-time messaging',
        'Care-team coordination workflows',
        'Privacy-first mobile architecture',
      ],
      url: 'https://www.synapp.eu/',
      tags: ['Flutter', 'Healthcare', 'Security'],
    ),
    ProjectData(
      title: 'ThyForLife',
      description: 'Thyroid health tracking & support community',
      features: [
        'Symptom, medication, and lab tracking',
        'Reminders and long-term health insights',
        'Community engagement and education',
      ],
      url: 'https://www.thyforlife.com/',
      tags: ['Flutter', 'Health', 'Community'],
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'projects-section', [
      div(classes: 'section-heading', [
        h2(classes: 'section-title', [Component.text('Featured Projects')]),
        p(classes: 'section-subtitle', [
          Component.text(
            'A selection of projects showcasing my expertise in mobile development.',
          ),
        ]),
      ]),
      div(classes: 'container projects-grid', [
        for (final project in projects) _projectCard(project),
      ]),
    ]);
  }

  Component _projectCard(ProjectData project) {
    return div(classes: 'project-card', [
      div(classes: 'project-header', [
        h3(classes: 'project-title', [Component.text(project.title)]),
        div(classes: 'project-tags', [
          for (final tag in project.tags) _projectTag(tag),
        ]),
      ]),
      p(classes: 'project-description', [Component.text(project.description)]),
      div(classes: 'project-features', [
        for (final feature in project.features)
          div(classes: 'feature-item', [
            span(classes: 'feature-bullet'),
            span([Component.text(feature)]),
          ]),
      ]),
      a(
        classes: 'project-link',
        href: project.url,
        target: Target.blank,
        [
          Component.text('View Project'),
          span(classes: 'link-arrow', [Component.text('→')]),
        ],
      ),
    ]);
  }

  Component _projectTag(String text) {
    return span(classes: 'project-tag', [Component.text(text)]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.projects-grid').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr],
          gap: 32.px,
        ),
        
        css('.project-card').styles(
          backgroundColor: modernBgSecondary,
          borderRadius: BorderRadius.circular(20.px),
          padding: Padding.all(32.px),
          border: Border.all(color: modernBorder, width: 1.px),
          transition: Transition.all(
            duration: Duration(milliseconds: 400),
            timingFunction: TimingFunction.ease,
          ),
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 20.px,
        ),
        
        css('.project-card:hover').styles(
          transform: Transform.translateY(-8.px),
          borderColor: modernAccentPrimary,
          boxShadow: [
            BoxShadow(
              color: Color.rgba(99, 102, 241, 0.15),
              offsetY: 20.px,
              blurRadius: 40.px,
            ),
          ],
        ),
        
        css('.project-header').styles(
          display: Display.flex,
          justifyContent: MainAxisAlignment.spaceBetween,
          alignItems: AlignItems.flexStart,
          gap: 16.px,
          flexWrap: FlexWrap.wrap,
        ),
        
        css('.project-title').styles(
          fontSize: 24.px,
          fontWeight: FontWeight.w700,
          margin: Margin.zero,
          flex: Flex.grow(1),
        ),
        
        css('.project-tags').styles(
          display: Display.flex,
          flexWrap: FlexWrap.wrap,
          gap: 8.px,
        ),
        
        css('.project-tag').styles(
          padding: Padding.symmetric(horizontal: 10.px, vertical: 4.px),
          backgroundColor: modernBgTertiary,
          borderRadius: BorderRadius.circular(6.px),
          fontSize: 12.px,
          color: modernAccentPrimary,
          fontWeight: FontWeight.w500,
        ),
        
        css('.project-description').styles(
          fontSize: 16.px,
          color: modernTextSecondary,
          lineHeight: 1.6,
          margin: Margin.zero,
        ),
        
        css('.project-features').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 12.px,
        ),
        
        css('.feature-item').styles(
          display: Display.flex,
          alignItems: AlignItems.flexStart,
          gap: 12.px,
          fontSize: 14.px,
          color: modernTextPrimary,
        ),
        
        css('.feature-bullet').styles(
          width: 6.px,
          height: 6.px,
          backgroundColor: modernAccentSecondary,
          borderRadius: BorderRadius.circular(50.percent),
          marginTop: 6.px,
          flexShrink: 0,
        ),
        
        css('.project-link').styles(
          display: Display.inlineFlex,
          alignItems: AlignItems.center,
          gap: 8.px,
          color: modernAccentPrimary,
          fontSize: 15.px,
          fontWeight: FontWeight.w600,
          textDecoration: TextDecoration.none,
          marginTop: Unit.auto,
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.project-link:hover').styles(
          gap: 12.px,
        ),
        
        css('.link-arrow').styles(
          transition: Transition.transform(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        // Responsive
        css('@media (max-width: 1024px)').style(
          css('.projects-grid').styles(
            gridTemplateColumns: [1.fr],
          ),
        ),
      ];
}

class ProjectData {
  final String title;
  final String description;
  final List<String> features;
  final String url;
  final List<String> tags;

  const ProjectData({
    required this.title,
    required this.description,
    required this.features,
    required this.url,
    required this.tags,
  });
}

// ============================================================================
// SKILLS SECTION
// ============================================================================

class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  final List<SkillCategory> skillCategories = const [
    SkillCategory(
      title: 'Core Technologies',
      skills: [
        Skill(name: 'Flutter', level: 95),
        Skill(name: 'Dart', level: 92),
        Skill(name: 'Mobile Architecture', level: 90),
      ],
    ),
    SkillCategory(
      title: 'Backend & APIs',
      skills: [
        Skill(name: 'REST APIs', level: 88),
        Skill(name: 'Firebase', level: 85),
        Skill(name: 'Node.js', level: 75),
      ],
    ),
    SkillCategory(
      title: 'Tools & Practices',
      skills: [
        Skill(name: 'Git & CI/CD', level: 90),
        Skill(name: 'Clean Architecture', level: 88),
        Skill(name: 'Testing', level: 82),
      ],
    ),
  ];

  final List<String> techStack = const [
    'Flutter', 'Dart', 'Firebase', 'REST APIs', 'Git',
    'CI/CD', 'Clean Architecture', 'State Management',
    'Riverpod', 'Bloc', 'Provider', 'Unit Testing',
    'Integration Testing', 'App Store', 'Play Store',
  ];

  @override
  Component build(BuildContext context) {
    return section(classes: 'skills-section', [
      div(classes: 'section-heading', [
        h2(classes: 'section-title', [Component.text('Skills & Expertise')]),
        p(classes: 'section-subtitle', [
          Component.text(
            'Technologies and tools I use to build exceptional mobile experiences.',
          ),
        ]),
      ]),
      div(classes: 'container skills-content', [
        div(classes: 'skills-grid', [
          for (final category in skillCategories) _skillCategory(category),
        ]),
        div(classes: 'tech-stack-section', [
          h3(classes: 'tech-stack-title', [Component.text('Technology Stack')]),
          div(classes: 'tech-stack-cloud', [
            for (final tech in techStack) _techTag(tech),
          ]),
        ]),
      ]),
    ]);
  }

  Component _skillCategory(SkillCategory category) {
    return div(classes: 'skill-category', [
      h4(classes: 'category-title', [Component.text(category.title)]),
      div(classes: 'skills-list', [
        for (final skill in category.skills) _skillBar(skill),
      ]),
    ]);
  }

  Component _skillBar(Skill skill) {
    return div(classes: 'skill-item', [
      div(classes: 'skill-header', [
        span(classes: 'skill-name', [Component.text(skill.name)]),
        span(classes: 'skill-level', [Component.text('${skill.level}%')]),
      ]),
      div(classes: 'skill-bar-bg', [
        div(
          classes: 'skill-bar-fill',
          style: Style(width: '${skill.level}%'),
          [],
        ),
      ]),
    ]);
  }

  Component _techTag(String tech) {
    return span(classes: 'tech-tag', [Component.text(tech)]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.skills-content').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 60.px,
        ),
        
        css('.skills-grid').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr, 1.fr],
          gap: 32.px,
        ),
        
        css('.skill-category').styles(
          backgroundColor: modernBgSecondary,
          padding: Padding.all(28.px),
          borderRadius: BorderRadius.circular(16.px),
          border: Border.all(color: modernBorder, width: 1.px),
        ),
        
        css('.category-title').styles(
          fontSize: 18.px,
          fontWeight: FontWeight.w600,
          marginBottom: 24.px,
          margin: Margin.only(bottom: 24.px),
        ),
        
        css('.skills-list').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 20.px,
        ),
        
        css('.skill-item').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 8.px,
        ),
        
        css('.skill-header').styles(
          display: Display.flex,
          justifyContent: MainAxisAlignment.spaceBetween,
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
        ),
        
        css('.skill-name').styles(
          color: modernTextPrimary,
        ),
        
        css('.skill-level').styles(
          color: modernAccentPrimary,
        ),
        
        css('.skill-bar-bg').styles(
          height: 6.px,
          backgroundColor: modernBgTertiary,
          borderRadius: BorderRadius.circular(3.px),
          overflow: Overflow.hidden,
        ),
        
        css('.skill-bar-fill').styles(
          height: Unit.percent(100),
          background: LinearGradient.linear(
            to: Alignment.right,
            colors: [modernAccentPrimary, modernAccentSecondary],
          ),
          borderRadius: BorderRadius.circular(3.px),
          transition: Transition.width(
            duration: Duration(milliseconds: 1000),
            timingFunction: TimingFunction.easeOut,
          ),
        ),
        
        css('.tech-stack-section').styles(
          textAlign: TextAlign.center,
        ),
        
        css('.tech-stack-title').styles(
          fontSize: 24.px,
          fontWeight: FontWeight.w600,
          marginBottom: 32.px,
          margin: Margin.only(bottom: 32.px),
        ),
        
        css('.tech-stack-cloud').styles(
          display: Display.flex,
          flexWrap: FlexWrap.wrap,
          gap: 12.px,
          justifyContent: MainAxisAlignment.center,
        ),
        
        css('.tech-tag').styles(
          padding: Padding.symmetric(horizontal: 16.px, vertical: 10.px),
          backgroundColor: modernBgSecondary,
          borderRadius: BorderRadius.circular(8.px),
          fontSize: 14.px,
          color: modernTextPrimary,
          border: Border.all(color: modernBorder, width: 1.px),
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.tech-tag:hover').styles(
          backgroundColor: modernAccentPrimary,
          borderColor: modernAccentPrimary,
          color: Color.white,
          transform: Transform.translateY(-2.px),
        ),
        
        // Responsive
        css('@media (max-width: 1024px)').style(
          css('.skills-grid').styles(
            gridTemplateColumns: [1.fr],
          ),
        ),
      ];
}

class SkillCategory {
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

class Skill {
  final String name;
  final int level;

  const Skill({
    required this.name,
    required this.level,
  });
}

// ============================================================================
// CONTACT SECTION
// ============================================================================

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'contact-section', [
      div(classes: 'section-heading', [
        h2(classes: 'section-title', [Component.text('Get in Touch')]),
        p(classes: 'section-subtitle', [
          Component.text(
            'Have a project in mind? Let\'s discuss how we can work together.',
          ),
        ]),
      ]),
      div(classes: 'container contact-content', [
        div(classes: 'contact-grid', [
          div(classes: 'contact-info', [
            div(classes: 'contact-card', [
              div(classes: 'contact-icon', [Component.text('📧')]),
              div(classes: 'contact-details', [
                h4([Component.text('Email')]),
                a(
                  href: 'mailto:abhanisujal@gmail.com',
                  classes: 'contact-link',
                  [Component.text('abhanisujal@gmail.com')],
                ),
              ]),
            ]),
            div(classes: 'contact-card', [
              div(classes: 'contact-icon', [Component.text('📱')]),
              div(classes: 'contact-details', [
                h4([Component.text('Phone')]),
                a(
                  href: 'tel:+919974332212',
                  classes: 'contact-link',
                  [Component.text('+91 9974332212')],
                ),
              ]),
            ]),
            div(classes: 'contact-card', [
              div(classes: 'contact-icon', [Component.text('🌍')]),
              div(classes: 'contact-details', [
                h4([Component.text('Location')]),
                p([Component.text('Remote / Worldwide')]),
              ]),
            ]),
            div(classes: 'contact-card', [
              div(classes: 'contact-icon', [Component.text('💼')]),
              div(classes: 'contact-details', [
                h4([Component.text('Availability')]),
                p([Component.text('Open to opportunities')]),
              ]),
            ]),
          ]),
          div(classes: 'contact-cta', [
            div(classes: 'cta-card', [
              h3([Component.text('Ready to Start a Project?')]),
              p([
                Component.text(
                  'I\'m currently available for senior mobile roles and freelance projects. '
                  'Let\'s create something amazing together.',
                ),
              ]),
              div(classes: 'cta-actions', [
                a(
                  classes: 'btn btn-primary',
                  href: 'mailto:abhanisujal@gmail.com',
                  [Component.text('Send Email')],
                ),
                a(
                  classes: 'btn btn-secondary',
                  href: 'https://linkedin.com',
                  target: Target.blank,
                  [Component.text('LinkedIn')],
                ),
              ]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.contact-content').styles(
          backgroundColor: modernBgSecondary,
          padding: Padding.all(48.px),
          borderRadius: BorderRadius.circular(24.px),
        ),
        
        css('.contact-grid').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr],
          gap: 48.px,
        ),
        
        css('.contact-info').styles(
          display: Display.grid,
          gridTemplateColumns: [1.fr, 1.fr],
          gap: 20.px,
        ),
        
        css('.contact-card').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: 16.px,
          padding: Padding.all(20.px),
          backgroundColor: modernBgPrimary,
          borderRadius: BorderRadius.circular(12.px),
          border: Border.all(color: modernBorder, width: 1.px),
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.contact-card:hover').styles(
          borderColor: modernAccentPrimary,
          transform: Transform.translateY(-2.px),
        ),
        
        css('.contact-icon').styles(
          fontSize: 28.px,
        ),
        
        css('.contact-details h4').styles(
          fontSize: 14.px,
          color: modernTextSecondary,
          fontWeight: FontWeight.w500,
          margin: Margin.only(bottom: 4.px),
        ),
        
        css('.contact-details p').styles(
          fontSize: 16.px,
          color: modernTextPrimary,
          fontWeight: FontWeight.w600,
          margin: Margin.zero,
        ),
        
        css('.contact-link').styles(
          fontSize: 16.px,
          color: modernAccentPrimary,
          fontWeight: FontWeight.w600,
          textDecoration: TextDecoration.none,
        ),
        
        css('.contact-link:hover').styles(
          textDecoration: TextDecoration.underline,
        ),
        
        css('.contact-cta').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
        ),
        
        css('.cta-card').styles(
          padding: Padding.all(40.px),
          background: LinearGradient.linear(
            to: Alignment.bottomRight,
            colors: [Color.rgba(99, 102, 241, 0.1), Color.rgba(139, 92, 246, 0.1)],
          ),
          borderRadius: BorderRadius.circular(20.px),
          border: Border.all(color: Color.rgba(99, 102, 241, 0.2), width: 1.px),
          textAlign: TextAlign.center,
        ),
        
        css('.cta-card h3').styles(
          fontSize: 28.px,
          fontWeight: FontWeight.w700,
          marginBottom: 16.px,
          margin: Margin.only(bottom: 16.px),
        ),
        
        css('.cta-card p').styles(
          fontSize: 16.px,
          color: modernTextSecondary,
          lineHeight: 1.7,
          marginBottom: 32.px,
          margin: Margin.only(bottom: 32.px),
        ),
        
        css('.cta-actions').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 12.px,
        ),
        
        // Responsive
        css('@media (max-width: 1024px)').style(
          css('.contact-grid').styles(
            gridTemplateColumns: [1.fr],
          ),
          css('.contact-info').styles(
            gridTemplateColumns: [1.fr],
          ),
          css('.cta-card').styles(
            padding: Padding.all(32.px),
          ),
        ),
      ];
}

// ============================================================================
// FOOTER
// ============================================================================

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'modern-footer', [
      div(classes: 'container footer-content', [
        div(classes: 'footer-brand', [
          span(classes: 'footer-logo', [Component.text('SA')]),
          p(classes: 'footer-tagline', [
            Component.text('Building exceptional mobile experiences'),
          ]),
        ]),
        div(classes: 'footer-links', [
          a(
            href: '#hero',
            classes: 'footer-link',
            [Component.text('Home')],
          ),
          a(
            href: '#about',
            classes: 'footer-link',
            [Component.text('About')],
          ),
          a(
            href: '#projects',
            classes: 'footer-link',
            [Component.text('Projects')],
          ),
          a(
            href: '#contact',
            classes: 'footer-link',
            [Component.text('Contact')],
          ),
        ]),
        div(classes: 'footer-bottom', [
          p([Component.text('© 2024 Sujal Abhani. All rights reserved.')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
        css('.modern-footer').styles(
          backgroundColor: modernBgPrimary,
          borderTop: Border.all(color: modernBorder, width: 1.px),
          padding: Padding.symmetric(vertical: 48.px),
        ),
        
        css('.footer-content').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          alignItems: AlignItems.center,
          gap: 32.px,
          textAlign: TextAlign.center,
        ),
        
        css('.footer-brand').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          alignItems: AlignItems.center,
          gap: 12.px,
        ),
        
        css('.footer-logo').styles(
          fontSize: 32.px,
          fontWeight: FontWeight.w800,
          background: LinearGradient.linear(
            to: Alignment.bottomCenter,
            colors: [modernAccentPrimary, modernAccentSecondary],
          ),
          WebkitBackgroundClip: TextClip.text,
          WebkitTextFillColor: Color.transparent,
        ),
        
        css('.footer-tagline').styles(
          fontSize: 14.px,
          color: modernTextSecondary,
          margin: Margin.zero,
        ),
        
        css('.footer-links').styles(
          display: Display.flex,
          gap: 32.px,
          flexWrap: FlexWrap.wrap,
          justifyContent: MainAxisAlignment.center,
        ),
        
        css('.footer-link').styles(
          color: modernTextSecondary,
          textDecoration: TextDecoration.none,
          fontSize: 15.px,
          transition: Transition.color(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.footer-link:hover').styles(
          color: modernAccentPrimary,
        ),
        
        css('.footer-bottom').styles(
          paddingTop: 24.px,
          borderTop: Border.all(color: modernBorder, width: 1.px),
          width: Unit.percent(100),
          textAlign: TextAlign.center,
        ),
        
        css('.footer-bottom p').styles(
          fontSize: 13.px,
          color: modernTextMuted,
          margin: Margin.zero,
        ),
      ];
}
