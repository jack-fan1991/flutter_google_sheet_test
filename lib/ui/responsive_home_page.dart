import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owlmarket_qa_connect/bloc/owl_service/owl_item_service_cubit.dart';
import 'package:owlmarket_qa_connect/bloc/url_parse_cubit/url_parse_cubit.dart';
import 'package:owlmarket_qa_connect/main.dart';
import 'package:owlmarket_qa_connect/ui/product_stock_page.dart';
import 'package:owlmarket_qa_connect/ui/responsive_home_drawer.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_cubit.dart';
import 'package:owlmarket_qa_connect/utils/stream_disposable.dart';
import 'package:owlmarket_qa_connect/utils/theme_cubit.dart';
import 'package:owlmarket_qa_connect/widget/responsive_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final responsiveHomeKey = GlobalKey<ResponsiveHomeViewState>();

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveHomeView(key: responsiveHomeKey);
  }
}

class ResponsiveHomeView extends StatefulWidget {
  const ResponsiveHomeView({super.key});

  @override
  State<ResponsiveHomeView> createState() => ResponsiveHomeViewState();
}

class ResponsiveHomeViewState extends State<ResponsiveHomeView>
    with StreamDisposable {
  final _responsiveScaffoldKey = GlobalKey<ResponsiveScaffoldState>();
  ResponsiveScaffoldState? get responsiveScaffold =>
      _responsiveScaffoldKey.currentState;
  late final GoogleSheetCubit googleSheetCubit;
  String title = '訂單報表';

  @override
  void initState() {
    super.initState();

    googleSheetCubit = context.read<GoogleSheetCubit>();
    googleSheetCubit.fetchData();
    final urlParseCubit = context.read<UrlParseCubit>();
    final owlItemServiceCubit = context.read<OwlItemServiceCubit>();
    addSubscription(
      subscription: googleSheetCubit.stream.listen((state) {
        googleSheetCubit.doIfLoaded(
          (googleSheetDataWrapper) {
            final itemIds = googleSheetDataWrapper.totalDisplayData
                .map((e) => int.parse(e.id))
                .toList();
            urlParseCubit.doIfRequiresValidation(
              (_) => owlItemServiceCubit.fetchItems(itemIds),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    cancelSubscriptions();
    super.dispose();
  }

  void updateTitle(String title) {
    setState(() {
      this.title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    App.l10n = AppLocalizations.of(context)!;
    final themeCubit = context.watch<ThemeCubit>();
    return ResponsiveWidget(
      builder: (context, breakpoint) {
        return ResponsiveScaffold(
          key: _responsiveScaffoldKey,
          appBar: AppBar(
            title: Text(title),
            leading: breakpoint != Breakpoint.desktop
                ? IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      responsiveScaffold?.openDrawer();
                    },
                  )
                : null,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: ThemeCubit.isLight
                      ? const Icon(Icons.mode_night)
                      : const Icon(Icons.light_mode),
                  onPressed: () {
                    themeCubit.updateTheme(ThemeCubit.isLight
                        ? ThemeSetting.dark
                        : ThemeSetting.light);
                  },
                ),
              ),
            ],
          ),
          drawer: ResponsiveHomeDrawer(
            responsiveScaffold: _responsiveScaffoldKey,
          ),
          body: const ProductStockPage(),
        );
      },
    );
  }
}
