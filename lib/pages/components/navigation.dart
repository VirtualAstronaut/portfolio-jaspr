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
        div(classes: 'nav-brand', [
          span(classes: 'brand-text', [Component.text('SA')]),
        ]),
        div(classes: 'nav-links', [
          _navLink('Terminal', 'terminal', currentRoute == 'terminal'),
          _navLink('Modern', 'modern', currentRoute == 'modern'),
        ]),
        div(classes: 'nav-toggle', [
          button(
            classes: 'menu-toggle',
            attributes: {'aria-label': 'Toggle menu'},
            [
              span(classes: 'menu-line', []),
              span(classes: 'menu-line', []),
              span(classes: 'menu-line', []),
            ],
          ),
        ]),
      ]),
    ]);
  }

  Component _navLink(String text, String route, bool isActive) {
    return button(
      classes: isActive ? 'nav-link active' : 'nav-link',
      onClick: onRouteChange != null ? () => onRouteChange!(route) : null,
      [Component.text(text)],
    );
  }

  @css
  static List<StyleRule> get styles => [
        css('.modern-nav').styles(
          position: Position.fixed(),
          left: Unit.zero,
          right: Unit.zero,
          zIndex: ZIndex(1000),
          backgroundColor: Color.rgba(15, 23, 42, 0.8),
          borderBottom: Border.all(color: modernBorder, width: 1.px),
          boxShadow: [
            BoxShadow(
              offsetX: Unit.zero,
              offsetY: 2.px,
              blur: 10.px,
              color: Color.rgba(0, 0, 0, 0.1),
            ),
          ],
        ),
        css('.nav-container').styles(
          maxWidth: 1200.px,
          margin: Margin.symmetric(horizontal: Unit.auto),
          padding: Padding.symmetric(horizontal: 24.px, vertical: 16.px),
          display: Display.flex,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.spaceBetween,
        ),
        css('.nav-brand').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
        ),
        css('.brand-text').styles(
          fontSize: 24.px,
          fontWeight: FontWeight.w700,
          color: modernTextPrimary,
          letterSpacing: 2.px,
        ),
        css('.nav-links').styles(
          display: Display.flex,
          gap: Gap.of(8.px),
        ),
        css('.nav-link').styles(
          padding: Padding.symmetric(horizontal: 20.px, vertical: 10.px),
          fontSize: 14.px,
          fontWeight: FontWeight.w500,
          color: modernTextSecondary,
          backgroundColor: Color.rgba(255, 255, 255, 0),
          border: Border.all(color: Color.rgba(255, 255, 255, 0), width: 1.px),
          borderRadius: BorderRadius.all(8.px),
          cursor: Cursor.pointer,
          transition: Transition(
            property: TransitionProperty.all,
            duration: Duration(milliseconds: 300),
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
        css('.nav-toggle').styles(
          display: Display.none,
        ),
        css('.menu-toggle').styles(
          display: Display.flex,
          flexDirection: FlexDirection.column,
          gap: Gap.of(5.px),
          padding: Padding.all(8.px),
          backgroundColor: Color.rgba(255, 255, 255, 0),
          border: Border.none,
          cursor: Cursor.pointer,
        ),
        css('.menu-line').styles(
          width: 24.px,
          height: 2.px,
          backgroundColor: modernTextPrimary,
          borderRadius: BorderRadius.all(2.px),
          transition: Transition(
            property: TransitionProperty.all,
            duration: Duration(milliseconds: 300),
          ),
        ),
      ];
}