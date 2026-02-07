import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';

class Navigation extends StatelessComponent {
  const Navigation({
    super.key,
    required this.currentRoute,
    this.onRouteChange,
  });

  final String currentRoute;
  final void Function(String)? onRouteChange;

  @override
  Component build(BuildContext context) {
    return nav(classes: 'modern-nav', [
      div(classes: 'nav-container', [
        // Logo/Brand
        div(classes: 'nav-brand', [
          span(classes: 'brand-text', [Component.text('SA')]),
        ]),
        
        // Navigation Links
        div(classes: 'nav-links', [
          _navLink('Terminal', 'terminal', currentRoute == 'terminal'),
          _navLink('Modern', 'modern', currentRoute == 'modern'),
        ]),
        
        // Mobile Menu Toggle
        div(classes: 'nav-toggle', [
          button(
            classes: 'menu-toggle',
            attributes: {'aria-label': 'Toggle menu'},
            [
              span(classes: 'menu-line'),
              span(classes: 'menu-line'),
              span(classes: 'menu-line'),
            ],
          ),
        ]),
      ]),
    ]);
  }

  Component _navLink(String text, String route, bool isActive) {
    return button(
      classes: isActive ? 'nav-link active' : 'nav-link',
      onClick: onRouteChange != null ? (_) => onRouteChange!(route) : null,
      [Component.text(text)],
    );
  }

  @css
  static List<StyleRule> get styles => [
        // Navigation Container
        css('.modern-nav').styles(
          position: Position.fixed(),
          top: Unit.zero,
          left: Unit.zero,
          right: Unit.zero,
          zIndex: ZIndex(1000),
          backgroundColor: Color.rgba(15, 23, 42, 0.8),
          backdropFilter: BackdropFilter.blur(12.px),
          borderBottom: Border.all(color: modernBorder, width: 1.px),
          boxShadow: [
            BoxShadow(
              color: Color.rgba(0, 0, 0, 0.1),
              offsetY: 2.px,
              blurRadius: 10.px,
            ),
          ],
        ),
        
        css('.nav-container').styles(
          maxWidth: 1200.px,
          margin: Margin.symmetric(horizontal: Unit.auto),
          padding: Padding.symmetric(horizontal: 24.px, vertical: 16.px),
          display: Display.flex,
          alignItems: AlignItems.center,
          justifyContent: MainAxisAlignment.spaceBetween,
        ),
        
        // Brand
        css('.nav-brand').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
        ),
        
        css('.brand-text').styles(
          fontSize: 24.px,
          fontWeight: FontWeight.w700,
          color: modernTextPrimary,
          letterSpacing: 2.px,
          background: LinearGradient.linear(
            to: Alignment.bottomCenter,
            colors: [modernAccentPrimary, modernAccentSecondary],
          ),
          WebkitBackgroundClip: TextClip.text,
          WebkitTextFillColor: Color.transparent,
        ),
        
        // Navigation Links
        css('.nav-links').styles(
          display: Display.flex,
          gap: 8.px,
        ),
        
        css('.nav-link').styles(
          padding: Padding.symmetric(horizontal: 20.px, vertical: 10.px),
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: modernTextSecondary,
          backgroundColor: Color.transparent,
          border: Border.all(color: Color.transparent, width: 1.px),
          borderRadius: BorderRadius.circular(8.px),
          cursor: Cursor.pointer,
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        css('.nav-link:hover').styles(
          color: modernTextPrimary,
          backgroundColor: modernBgTertiary,
        ),
        
        css('.nav-link.active').styles(
          color: modernTextPrimary,
          backgroundColor: modernBgTertiary,
          borderColor: modernAccentPrimary,
        ),
        
        // Mobile Menu Toggle
        css('.nav-toggle').styles(
          display: Display.none,
        ),
        
        css('.menu-toggle').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: 5.px,
          padding: Padding.all(8.px),
          backgroundColor: Color.transparent,
          border: Border.none,
          cursor: Cursor.pointer,
        ),
        
        css('.menu-line').styles(
          width: 24.px,
          height: 2.px,
          backgroundColor: modernTextPrimary,
          borderRadius: BorderRadius.circular(2.px),
          transition: Transition.all(
            duration: Duration(milliseconds: 300),
            timingFunction: TimingFunction.ease,
          ),
        ),
        
        // Mobile Responsive
        css('@media (max-width: 768px)').style(
          css('.nav-links').styles(
            display: Display.none,
          ),
          css('.nav-toggle').styles(
            display: Display.block,
          ),
        ),
      ];
}
