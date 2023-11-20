import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../export.dart';
import '../../feature/common/widget/app_scroll_behavior.dart';
import '../l10n/util/l10n_manager.dart';
import '../router/app_router.dart';

Future<void> bootStrap() async {
  await _initSupabase();
  await registerSingletons();
  _registerErrorHandler();
  runApp(const BootStrapApp());
}

Future<void> _initSupabase() async {
  await Supabase.initialize(
    url: 'https://klmyvmaoisfzvfozgvfu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtsbXl2bWFvaXNmenZmb3pndmZ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAyMTg2NTMsImV4cCI6MjAxNTc5NDY1M30.eIGLRQZ_zLD5Pkfr9lSglSR07Iy9MgzAEPlOb8K4FmU',
    realtimeClientOptions: const RealtimeClientOptions(eventsPerSecond: 40),
  );
}

void _registerErrorHandler() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.e('flutter Error Occurred', error: details.exception, stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    log.e('Platform Error Occurred', error: exception, stackTrace: stackTrace);
    return true;
  };
}

class BootStrapApp extends StatelessWidget with WatchItMixin {
  const BootStrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = watchPropertyValue((L10NManager settings) => settings.locale);

    return MaterialApp.router(
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.instance.createTheme(Brightness.dark),
      darkTheme: AppTheme.instance.createTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      // scrollBehavior: const AppScrollBehavior(),
    );
  }
}
