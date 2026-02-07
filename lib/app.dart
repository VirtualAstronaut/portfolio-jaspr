import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'constants/theme.dart';
import 'pages/home.dart';
import 'pages/modern_portfolio.dart';
import 'pages/components/navigation.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  String currentRoute = 'terminal';

  void _handleRouteChange(String route) {
    setState(() {
      currentRoute = route;
    });
  }

  @override
  Component build(BuildContext context) {
    return div([
      // Global Navigation
      Navigation(
        currentRoute: currentRoute,
        onRouteChange: _handleRouteChange,
      ),
      
      // Route Content
      if (currentRoute == 'terminal')
        div(classes: 'terminal', [const Home()])
      else
        const ModernPortfolio(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Reset and base styles
    css('*').styles(
      margin: Margin.zero,
      padding: Padding.zero,
    ),
    css('html, body').styles(
      backgroundColor: terminalBg,
      color: primaryText,
      fontFamily: FontFamily.list([
        FontFamily('JetBrains Mono'),
        FontFamily('Fira Code'),
        FontFamily('SF Mono'),
        FontFamily('Consolas'),
        FontFamilies.monospace,
      ]), 
      fontSize: 14.px,
      lineHeight: 1.7.em,
      minHeight: 100.vh,
    ),
    css('.terminal').styles(
      margin: Margin.symmetric(horizontal: Unit.auto, vertical: 40.px),
      maxWidth: 900.px,
      minHeight: 100.vh,
      padding: Padding.all(20.px),
      zIndex: ZIndex(1),
      position: Position.relative(),
    ),
    // Selection styles
    css('::selection').styles(
      backgroundColor: accentBlue,
      color: terminalBg,
    ),
    // Link styles
    css('a').styles(
      color: accentBlue,
    ),
    css('a:hover').styles(
      color: accentTeal,
    ),
    // Scrollbar styling
    css('::-webkit-scrollbar').styles(
      width: 8.px,
    ),
    css('::-webkit-scrollbar-track').styles(
      backgroundColor: terminalBgLight,
    ),
    css('::-webkit-scrollbar-thumb').styles(
      backgroundColor: terminalBorder,
    ),
  ];
}
