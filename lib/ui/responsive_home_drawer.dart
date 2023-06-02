import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gsheets/gsheets.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/main.dart';
import 'package:owlmarket_qa_connect/ui/product_stock_page.dart';
import 'package:owlmarket_qa_connect/ui/responsive_home_page.dart';
import 'package:owlmarket_qa_connect/utils/common.dart';
import 'package:owlmarket_qa_connect/widget/responsive_scaffold.dart';
import 'package:tuple/tuple.dart';
import 'dart:html' as html;

class ResponsiveHomeDrawer extends StatefulWidget {
  final GlobalKey<ResponsiveScaffoldState> responsiveScaffold;
  const ResponsiveHomeDrawer({super.key, required this.responsiveScaffold});

  @override
  State<ResponsiveHomeDrawer> createState() => _ResponsiveHomeDrawerState();
}

class _ResponsiveHomeDrawerState extends State<ResponsiveHomeDrawer> {
  final log = Logger('ResponsiveHomeDrawer');

  ResponsiveScaffoldState? get _state => widget.responsiveScaffold.currentState;

  bool _isImporting = false;
  bool _isFetchingGA = false;
  bool _isExporting = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final Tuple2<String, String> orderTimeFromTo = Tuple2("", "");

    return ResponsiveWidget(
      builder: (context, breakpoint) {
        return Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          shadowColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight:
                  Radius.circular(breakpoint == Breakpoint.desktop ? 0 : 16),
              bottomRight:
                  Radius.circular(breakpoint == Breakpoint.desktop ? 0 : 16),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/app_logo.png',
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          l10n.appTitle,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (orderTimeFromTo.item1.isNotEmpty)
                      Text(
                        l10n.ordersFrom(orderTimeFromTo.item1),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (orderTimeFromTo.item2.isNotEmpty)
                      Text(
                        l10n.ordersTo(orderTimeFromTo.item2),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: _isImporting
                      ? null
                      : () async {
                          FilePickerResult? pickedFile =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['csv'],
                            allowMultiple: false,
                          );
                          if (pickedFile != null) {
                            setState(() {
                              _isImporting = true;
                            });

                            await Future.delayed(const Duration(seconds: 1));
                            await processCsv();

                            final PlatformFile file = pickedFile.files.first;
                            log.fine('extension: ${file.extension}');

                            String csvString =
                                utf8.decode(pickedFile.files.single.bytes!);
                            List<List<dynamic>> data =
                                const CsvToListConverter()
                                    .convert(csvString, eol: "\n");

                            // List<Order> orders = [];
                            // for (int i = 1; i < data.length; ++i) {
                            //   final row = data[i];
                            //   final orderId = row[0].toString();

                            //   if (orderId.startsWith('OD')) {
                            //     final orderTime = row[1].toString();
                            //     final vendorId = row[2].toString();
                            //     final vendorName = row[3].toString();
                            //     final customerName = row[4].toString();
                            //     final productName = row[5].toString();
                            //     final orderCount = row[6].toString();
                            //     final unitPrice = row[7].toString();
                            //     final subTotal = row[8].toString();
                            //     final shippingFee = row[9].toString();
                            //     final shippingFeeDiscount = row[10].toString();
                            //     final orderDiscount = row[11].toString();
                            //     final orderInvoiceAmount = row[12].toString();
                            //     final payDay = row[13].toString();
                            //     final paymentId = row[14].toString();
                            //     final payWay = row[15].toString();

                            //     orders.add(
                            //       Order(
                            //         orderId: orderId,
                            //         orderTime: orderTime,
                            //         vendorId: vendorId,
                            //         vendorName: vendorName,
                            //         customerName: customerName,
                            //         productName: productName,
                            //         orderCount: orderCount,
                            //         unitPrice: unitPrice,
                            //         subTotal: subTotal,
                            //         shippingFee: shippingFee,
                            //         shippingFeeDiscount: shippingFeeDiscount,
                            //         orderDiscount: orderDiscount,
                            //         orderInvoiceAmount: orderInvoiceAmount,
                            //         payDay: payDay,
                            //         paymentId: paymentId,
                            //         payWay: payWay,
                            //         category:
                            //             vendorCategories[int.parse(vendorId)]
                            //                     ?.categoryName ??
                            //                 '#N/A',
                            //       ),
                            //     );
                            //   } else if (orderId.startsWith('OS')) {
                            //     final orderTime = row[1].toString();
                            //     final vendorId = row[3].toString();
                            //     final vendorName = row[4].toString();
                            //     final customerName = row[5].toString();
                            //     final productName = row[6].toString();
                            //     final orderCount = row[7].toString();
                            //     final unitPrice = row[8].toString();
                            //     final subTotal = row[9].toString();
                            //     final shippingFee = row[10].toString();
                            //     const shippingFeeDiscount = '0';
                            //     final orderDiscount = row[11].toString();
                            //     final orderInvoiceAmount = row[12].toString();
                            //     final payDay = row[13].toString();
                            //     final paymentId = row[14].toString();
                            //     final payWay = row[15].toString();

                            //     orders.add(
                            //       Order(
                            //         orderId: orderId,
                            //         orderTime: orderTime,
                            //         vendorId: vendorId,
                            //         vendorName: vendorName,
                            //         customerName: customerName,
                            //         productName: productName,
                            //         orderCount: orderCount,
                            //         unitPrice: unitPrice,
                            //         subTotal: subTotal,
                            //         shippingFee: shippingFee,
                            //         shippingFeeDiscount: shippingFeeDiscount,
                            //         orderDiscount: orderDiscount,
                            //         orderInvoiceAmount: orderInvoiceAmount,
                            //         payDay: payDay,
                            //         paymentId: paymentId,
                            //         payWay: payWay,
                            //         category:
                            //             vendorCategories[int.parse(vendorId)]
                            //                     ?.categoryName ??
                            //                 '#N/A',
                            //       ),
                            //     );
                            //   }
                            // }
                            // ordersCubit.initialize(orders);

                            setState(() {
                              _isImporting = false;
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer),
                  child: _isImporting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : Text(l10n.menuImportOrdersFile),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //   child: ElevatedButton(
              //     onPressed: _isFetchingGA
              //         ? null
              //         : () async {
              //             setState(() {
              //               _isFetchingGA = true;
              //             });
              //             final Tuple2<String, String> orderDateFromTo =
              //                 ordersCubit.getFromToDate();

              //             if (orderDateFromTo.item1.isEmpty ||
              //                 orderDateFromTo.item2.isEmpty) {
              //               setState(() {
              //                 _isFetchingGA = false;
              //               });
              //               return;
              //             }
              //             final repo = context.read<DataRepository>();
              //             final results = await repo.runReports(
              //                 from: orderDateFromTo.item1,
              //                 to: orderDateFromTo.item2);

              //             if (results is Success) {
              //               // log.fine('results: ${(results as Success).data}');
              //               Map<String, Report> reports = {};
              //               for (var value in ((results as Success).data
              //                   as List<Report>)) {
              //                 reports[value.transactionId] = value;
              //               }

              //               ordersCubit.updateOrders(reports);
              //               // ordersCubit.fillUpData();
              //             }
              //             setState(() {
              //               _isFetchingGA = false;
              //             });
              //           },
              //     style: ElevatedButton.styleFrom(
              //         backgroundColor:
              //             Theme.of(context).colorScheme.secondaryContainer),
              //     child: _isFetchingGA
              //         ? const SizedBox(
              //             width: 20,
              //             height: 20,
              //             child: CircularProgressIndicator(
              //               strokeWidth: 3,
              //             ),
              //           )
              //         : Text(l10n.menuImportGA),
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: _isExporting
                      ? null
                      : () async {
                          setState(() {
                            _isExporting = true;
                          });

                          final gsheets = GSheets(credentials);

                          final ss =
                              await gsheets.spreadsheet(App.spreadsheedId);

                          for (var element in ss.sheets) {
                            if (element.title != l10n.ordersReport) {
                              ss.deleteWorksheet(element);
                            }
                          }

                          // get worksheet by its title
                          var ordersSheet =
                              ss.worksheetByTitle(l10n.ordersReport);
                          // create worksheet if it does not exist yet
                          ordersSheet ??=
                              await ss.addWorksheet(l10n.ordersReport);

                          await ordersSheet.clear();
                          await ordersSheet.values.insertRow(1, ordersHeaders);
                          // await ordersSheet.values.map.appendRows(
                          //     ordersCubit.generateOrdersMap(ordersCubit.state));

                          // get worksheet by its title
                          var salesRankingSheet =
                              ss.worksheetByTitle(l10n.salesFiguresRanking);
                          // create worksheet if it does not exist yet
                          salesRankingSheet ??=
                              await ss.addWorksheet(l10n.salesFiguresRanking);

                          await salesRankingSheet.clear();
                          await salesRankingSheet.values
                              .insertRow(1, salesFiguresHeaders);

                          // await salesRankingSheet.values.map.appendRows(
                          //     ordersCubit.generateSalesFiguresDataMap());

                          // get worksheet by its title
                          var categoryStatisticsSheet =
                              ss.worksheetByTitle(l10n.categoryStatistics);
                          // create worksheet if it does not exist yet
                          categoryStatisticsSheet ??=
                              await ss.addWorksheet(l10n.categoryStatistics);

                          await categoryStatisticsSheet.clear();
                          await categoryStatisticsSheet.values
                              .insertRow(1, categoryStatisticsHeaders);

                          // await categoryStatisticsSheet.values.map.appendRows(
                          //     ordersCubit.generateCategoryStatisticsDataMap());

                          // ordersCubit.ordersWithTraffic.forEach(
                          //   (key, value) async {
                          //     // get worksheet by its title
                          //     var ordersSheet = ss.worksheetByTitle(key);
                          //     // create worksheet if it does not exist yet
                          //     ordersSheet ??= await ss.addWorksheet(key);

                          //     await ordersSheet.clear();
                          //     await ordersSheet.values
                          //         .insertRow(1, ordersHeaders);
                          //     await ordersSheet.values.map.appendRows(
                          //         ordersCubit.generateOrdersMap(value));
                          //   },
                          // );

                          setState(() {
                            _isExporting = false;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer),
                  child: _isExporting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : Text(l10n.menuExportToGoogleSheet),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    html.window.open(
                        'https://docs.google.com/spreadsheets/d/1XvUmGZPaJivGzUGgQCf3tBVqczORg-QTBFULQXvZNIY/edit#gid=104351858',
                        'Google Sheet');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer),
                  icon: const Icon(Icons.description),
                  label: Text(l10n.menuGoToGoogleSheet),
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  l10n.ordersReport,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () {
                  if (breakpoint != Breakpoint.desktop) {
                    Navigator.pop(context);
                  }
                  responsiveHomeKey.currentState
                      ?.updateTitle(l10n.ordersReport);
                  _state?.pushReplacement(const ProductStockPage());
                },
              ),
              // ...ordersCubit.ordersWithTraffic.entries
              //     .map(
              //       (entry) => ListTile(
              //         title: Text(entry.key),
              //         onTap: () {
              //           if (breakpoint != Breakpoint.desktop) {
              //             Navigator.pop(context);
              //           }
              //           responsiveHomeKey.currentState?.updateTitle(entry.key);
              //           _state?.pushReplacement(
              //               OrdersWithTrafficReportPage(traffic: entry.key));
              //         },
              //       ),
              //     )
              //     .toList(),
            ],
          ),
        );
      },
    );
  }
}
