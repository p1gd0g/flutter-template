import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final theme = const <TargetPlatform>{
    TargetPlatform.android,
    TargetPlatform.iOS,
    TargetPlatform.fuchsia,
  }.contains(defaultTargetPlatform)
      ? FThemes.neutral.light.touch
      : FThemes.neutral.light.desktop;

  runApp(
    ProviderScope(
      child: MaterialApp(
        supportedLocales: FLocalizations.supportedLocales,
        localizationsDelegates: const [...FLocalizations.localizationsDelegates],
        theme: theme.toApproximateMaterialTheme(),
        builder: (_, child) => FTheme(
          data: theme,
          child: FToaster(child: FTooltipGroup(child: child!)),
        ),
        home: const FScaffold(child: Placeholder()),
      ),
    ),
  );
}
