/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';
import 'constants/theme.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: 'Sujal Abhani | Flutter Architect',
    meta: {
      'description': 'Senior Flutter Developer & Mobile Architect. Production-grade mobile apps for E-commerce, Workforce, Healthcare, and Digital Health.',
      'keywords': 'Flutter, Dart, Mobile Developer, Mobile Architect, Senior Developer, Remote, Freelance',
      'author': 'Sujal Abhani',
      'viewport': 'width=device-width, initial-scale=1.0, maximum-scale=5.0, viewport-fit=cover',
      'theme-color': '#0d1117',
      'mobile-web-app-capable': 'yes',
      'apple-mobile-web-app-capable': 'yes',
      'apple-mobile-web-app-status-bar-style': 'black-translucent',
    },
    head: [
      // Link to external CSS
      link(rel: 'stylesheet', href: 'styles.css'),
      // Matrix rain script
      script(src: 'matrix-rain.js'),
    ],
    styles: [
      // Import JetBrains Mono font
      css.import('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap'),
      // Global styles
      css('html, body').styles(
        backgroundColor: terminalBg,
        fontFamily: FontFamily.list([
          FontFamily('JetBrains Mono'),
          FontFamilies.monospace,
        ]),
        margin: Margin.zero,
        minHeight: 100.vh,
        padding: Padding.zero,
        width: 100.percent,
      ),
    ],
    body: const App(),
  ));
}
