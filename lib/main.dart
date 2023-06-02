import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_error_cubit.dart';
import 'package:owlmarket_qa_connect/bloc/owl_service/owl_item_service_cubit.dart';
import 'package:owlmarket_qa_connect/data/source/data_repository.dart';
import 'package:owlmarket_qa_connect/data/source/default_data_repository.dart';
import 'package:owlmarket_qa_connect/data/source/local/local_data_source.dart';
import 'package:owlmarket_qa_connect/data/source/remote/api_helper.dart';

import 'package:owlmarket_qa_connect/utils/color_logger.dart';
import 'package:owlmarket_qa_connect/utils/common.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:owlmarket_qa_connect/utils/firebase_functions_helper.dart';
import 'package:owlmarket_qa_connect/utils/go_router.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_cubit.dart';
import 'package:owlmarket_qa_connect/utils/hive_helper.dart';
import 'package:owlmarket_qa_connect/utils/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:owlmarket_qa_connect/widget/responsive_scaffold.dart';
import 'bloc/url_parse_cubit/url_parse_cubit.dart';
import 'data/source/remote/remote_data_source.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  Responsive.initialize(
      options: const ResponsiveOptions(
    desktopBreakpoint: 1024,
    tabletBreakpoint: 600,
    drawerWidth: 320,
  ));
  Logger.root.level = isDebug() ? Level.ALL : Level.OFF;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    ColorLoggerFormatter.output(record);
    // print(
    //     '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });
  await Firebase.initializeApp(
    name: 'qa-connect',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final hive = HiveHelper();
  await hive.init();
  usePathUrlStrategy();
  runApp(App(hive: hive));
}

class App extends StatelessWidget {
  final HiveHelper hive;
  static bool kDebug = true;
  static String get spreadsheedId => App.kDebug
      ? '1nbv2tFC3U8ckaiR10tlJnTE8_-MQgDH6Ac56ur1eHlI'
      : '1o4ypLafnZSf1kzlonrKnR3ay_yejuH-mDIlT1lgva14';

  static late AppLocalizations l10n;
  const App({super.key, required this.hive});

  @override
  Widget build(BuildContext context) {
    final remote = RemoteDataSource(apiHelper: ApiHelper());
    final local = LocalDataSource();
    final repo = DefaultDataRepository(local: local, remote: remote);
    final googleSheetCubit = GoogleSheetCubit();
    final firebaseFunctionsHelper =
        FirebaseFunctionsHelper(isDebug: App.kDebug);
    final googleSheetErrorCubit =
        GoogleSheetErrorCubit(firebaseFunctionsHelper);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DataRepository>(create: (_) => repo),
        RepositoryProvider<FirebaseFunctionsHelper>(
          create: (_) => FirebaseFunctionsHelper(isDebug: App.kDebug),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(
              hive: hive,
              brightnessProvider: () {
                return SchedulerBinding.instance.window.platformBrightness;
              },
            )..initialize(),
          ),
          BlocProvider(
            create: (_) => googleSheetCubit,
          ),
          BlocProvider(
            create: (_) => UrlParseCubit(),
          ),
          BlocProvider(
            create: (_) => OwlItemServiceCubit(
              repo,
              googleSheetCubit,
              googleSheetErrorCubit,
            ),
          ),
          BlocProvider(
            create: (_) => googleSheetErrorCubit,
          ),
        ],
        child: const MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    context.read<UrlParseCubit>().open();
    return MaterialApp.router(
      restorationScopeId: 'app',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      onGenerateTitle: (BuildContext context) {
        App.l10n = AppLocalizations.of(context)!;
        return App.l10n.appTitle;
      },
      theme: theme,
      routerConfig: router,
      title: 'OwlMarket Order Statistic',
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
