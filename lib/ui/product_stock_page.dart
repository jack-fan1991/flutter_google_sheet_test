import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsheets/gsheets.dart';
import 'package:logging/logging.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_error_cubit.dart';
import 'package:owlmarket_qa_connect/data/google_sheet_data.dart';
import 'package:owlmarket_qa_connect/utils/common.dart';
import 'package:owlmarket_qa_connect/bloc/google_sheet/google_sheet_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tuple/tuple.dart';

import '../main.dart';

class ProductStockPage extends StatefulWidget {
  const ProductStockPage({super.key});

  @override
  State<ProductStockPage> createState() => _ProductStockPageState();
}

class _ProductStockPageState extends State<ProductStockPage> {
  @override
  Widget build(BuildContext context) {
    final googleSheetCubit = context.watch<GoogleSheetCubit>();
    return googleSheetCubit.state.when(
      loading: () => const CircularProgressIndicator(),
      loaded: (googleSheetDataWrapper) =>
          ProductStockChild(googleSheetDataWrapper: googleSheetDataWrapper),
      error: (e) => Center(
        child: Text("error :$e "),
      ),
    );
  }
}

class ProductStockChild extends StatefulWidget {
  final GoogleSheetDataWrapper googleSheetDataWrapper;

  const ProductStockChild({super.key, required this.googleSheetDataWrapper});

  @override
  State<ProductStockChild> createState() => _ProductStockChildState();
}

class EditorTarget {
  final String id;
  final String columnName;
  final String defaultValue;

  EditorTarget(
      {required this.id, required this.columnName, required this.defaultValue});
}

class _ProductStockChildState extends State<ProductStockChild> {
  final log = Logger('ProductStockChild');

  int currentPage = 0;
  int maxRowsPerPage = 15;
  List<GoogleSheetData> displayData = [];
  Map<int, List<GoogleSheetData>> displayDataCache = {};
  late final List<String> displayHeaders;
  late final int totalPage;
  EditorTarget? editorTarget;

  updateCache() {
    displayDataCache[currentPage] = displayData;
  }

  @override
  void initState() {
    displayHeaders = widget.googleSheetDataWrapper.displayHeaders;
    displayData = widget.googleSheetDataWrapper.takeData(take: maxRowsPerPage);
    totalPage =
        (widget.googleSheetDataWrapper.totalDisplayData.length / maxRowsPerPage)
            .ceil();
    super.initState();
    updateCache();
  }

  bool get isModify => displayDataCache.values.any(
        (googleSheetData) => googleSheetData.any(
          (element) => widget.googleSheetDataWrapper.totalDisplayData.any(
            (e) =>
                e.id == element.id && e.price != element.price ||
                e.id == element.id && e.availability != element.availability,
          ),
        ),
      );

  void updateData() {
    setState(() {
      if (displayDataCache.containsKey(currentPage)) {
        displayData = displayDataCache[currentPage]!;
        return;
      }
      if (currentPage == 0) {
        displayData = widget.googleSheetDataWrapper
            .takeData(take: maxRowsPerPage)
            .toList();
      } else {
        displayData = widget.googleSheetDataWrapper.takeData(
          from: currentPage * maxRowsPerPage,
          take: maxRowsPerPage,
        );
      }
      updateCache();
    });
  }

  void previousPage() {
    currentPage = max(0, currentPage - 1);
    updateData();
  }

  void nextPage() {
    if (canNextPage) {
      setState(() {
        currentPage++;
        updateData();
      });
    }
  }

  bool get canNextPage => currentPage < totalPage;

  bool get canPreviousPage => currentPage > 0;

  @override
  Widget build(BuildContext context) {
    final googleSheetErrorCubit = context.watch<GoogleSheetErrorCubit>();
    return widget.googleSheetDataWrapper.totalDisplayData.isEmpty
        ? Center(
            child: Text(
              App.l10n.importOrdersFileFirst,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                if (isModify)
                  Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red),
                      Text("目前編輯未儲存")
                    ],
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        dividerThickness: 1.0, // 分隔线的厚度
                        columnSpacing: 10,
                        columns: displayHeaders
                            .map(
                              (element) => DataColumn(
                                label: Text(element),
                                onSort: (columnIndex, ascending) {
                                  // log.fine('$columnIndex $ascending');
                                  // if (columnIndex == 0) {
                                  //   setState(() {
                                  //     _currentSortColumn = columnIndex;
                                  //     _isAscending = !_isAscending;
                                  //     _sortByOrderId = true;
                                  //     _sortByPaymentId = false;
                                  //   });
                                  // } else if (columnIndex == 5) {
                                  //   setState(() {
                                  //     _currentSortColumn = columnIndex;
                                  //     _isAscending = !_isAscending;
                                  //     _sortByOrderId = false;
                                  //     _sortByPaymentId = true;
                                  //   });
                                  // }
                                },
                              ),
                            )
                            .toList(),
                        rows: displayData.map(
                          (element) {
                            return editorTarget == null
                                ? buildRow(element, googleSheetErrorCubit)
                                : buildEditorRow(
                                    element, googleSheetErrorCubit);
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: previousPage,
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: canPreviousPage ? Colors.green : Colors.grey,
                        )),
                    IconButton(
                        onPressed: nextPage,
                        icon: Icon(Icons.arrow_forward_ios_rounded,
                            color: canNextPage ? Colors.green : Colors.grey)),
                    Text(" ${currentPage + 1} / ${totalPage + 1} ")
                  ],
                )
              ],
            ),
          );
  }

  DataRow buildRow(
      GoogleSheetData element, GoogleSheetErrorCubit googleSheetErrorCubit) {
    return DataRow(
      cells: [
        DataCell(Text(element.id)),
        DataCell(Text(element.title)),
        DataCell(Text(element.description)),
        DataCell(Text(element.link)),
        DataCell(
          googleSheetErrorCubit.validator(
                      key: 'price', googleSheetData: element) ==
                  null
              ? Text(element.price)
              : Row(
                  children: [
                    Text(element.price),
                    const Text('/'),
                    Text(
                      googleSheetErrorCubit.validator(
                          key: 'price', googleSheetData: element)!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
          showEditIcon: googleSheetErrorCubit.validator(
                  key: 'price', googleSheetData: element) !=
              null,
          onTap: googleSheetErrorCubit.validator(
                      key: 'price', googleSheetData: element) ==
                  null
              ? null
              : () => {
                    setState(
                      () {
                        editorTarget = EditorTarget(
                          id: element.id,
                          columnName: 'price',
                          defaultValue:
                              '${googleSheetErrorCubit.validator(key: 'price', googleSheetData: element)!} TWD',
                        );
                      },
                    )
                  },
        ),
        DataCell(
          googleSheetErrorCubit.validator(
                      key: 'availability', googleSheetData: element) ==
                  null
              ? Text(element.availability)
              : Row(
                  children: [
                    Text(element.availability),
                    const Text('/'),
                    Text(
                      googleSheetErrorCubit.validator(
                          key: 'availability', googleSheetData: element)!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
          showEditIcon: googleSheetErrorCubit.validator(
                  key: 'availability', googleSheetData: element) !=
              null,
          onTap: googleSheetErrorCubit.validator(
                      key: 'availability', googleSheetData: element) ==
                  null
              ? null
              : () => setState(() {
                    editorTarget = EditorTarget(
                      id: element.id,
                      columnName: 'availability',
                      defaultValue: googleSheetErrorCubit.validator(
                          key: 'availability', googleSheetData: element)!,
                    );
                  }),
        ),
        DataCell(Text(element.imageLink)),
        DataCell(Text(element.identifierExists)),
        DataCell(Text(element.gtin)),
        DataCell(Text(element.mpn)),
        DataCell(Text(element.brand)),
        DataCell(Text(element.googleProductCategory)),
        DataCell(Text(element.language)),
      ],
    );
  }

  DataRow buildEditorRow(
      GoogleSheetData element, GoogleSheetErrorCubit googleSheetErrorCubit) {
    return DataRow(
      cells: [
        DataCell(Text(element.id)),
        DataCell(Text(element.title)),
        DataCell(Text(element.description)),
        DataCell(Text(element.link)),
        DataCell(
          element.id == editorTarget!.id && editorTarget!.columnName == 'price'
              ? Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: editorTarget!.defaultValue,
                        onFieldSubmitted: (val) => setState(() {
                          editorTarget = null;
                          displayData = displayData.map((e) {
                            if (e.id == element.id) {
                              return e.copyWith(price: val);
                            }
                            return e;
                          }).toList();
                          updateCache();
                        }),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        editorTarget = null;
                      }),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                )
              : Text(element.price),
        ),
        DataCell(
          element.id == editorTarget!.id &&
                  editorTarget!.columnName == 'availability'
              ? Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: editorTarget!.defaultValue,
                        onFieldSubmitted: (val) => setState(() {
                          editorTarget = null;
                          displayData = displayData.map((e) {
                            if (e.id == element.id) {
                              return e.copyWith(availability: val);
                            }
                            return e;
                          }).toList();
                          updateCache();
                        }),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        editorTarget = null;
                      }),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                )
              : Text(element.availability),
        ),
        DataCell(Text(element.imageLink)),
        DataCell(Text(element.identifierExists)),
        DataCell(Text(element.gtin)),
        DataCell(Text(element.mpn)),
        DataCell(Text(element.brand)),
        DataCell(Text(element.googleProductCategory)),
        DataCell(Text(element.language)),
      ],
    );
  }
}
