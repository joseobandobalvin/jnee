import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jnee/generated/l10n.dart';

final RxInt displayLength = 10.obs;
final RxInt tmpDisplayLength = 0.obs;

final RxString sortDirection = "desc".obs;
final RxString tmpSortDirection = "".obs;

abstract class Dialogs {
  static Future<void> alert(BuildContext context,
      {String? title,
      String? description,
      String okText = "OK",
      bool dismissible = true}) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => PopScope(
        //onWillPop: () async => dismissible,

        child: CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: description != null ? Text(description) : null,
          actions: [
            CupertinoDialogAction(
              child: Text(okText),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

  static Future<bool> confirm(
    BuildContext context, {
    String? title,
    String? description,
  }) async {
    final result = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (_) => PopScope(
        child: CupertinoActionSheet(
          title: title != null ? Text(title) : Text(S.current.txtDefaultTitle),
          message: description != null
              ? Text(description)
              : Text(S.current.txtDefaultDescription),
          actions: [
            CupertinoActionSheetAction(
              child: Text(S.current.txtOk),
              onPressed: () {
                Navigator.pop(_, true);
              },
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(_, false);
              },
              isDestructiveAction: true,
              child: Text(S.current.txtCancel),
            )
          ],
        ),
      ),
    );
    return result ?? false;
  }

  static Future<bool> confirmAndroid(
    BuildContext context, {
    String? title,
    String? description,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: title != null ? Text(title) : Text(S.current.txtDefaultTitle),
        content: description != null
            ? Text(description)
            : Text(S.current.txtDefaultDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(S.current.txtCancel),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              S.current.txtDelete,
              style: const TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
    return result ?? false;
  }

  static Future<bool> confirmModalBottomSheet(
    BuildContext context, {
    String? title,
    String? description,
  }) async {
    final result = await showModalBottomSheet<bool>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      context: context,
      builder: (_) => PopScope(
        child: Wrap(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  title != null
                      ? Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text(S.current.txtDefaultTitle),
                  description != null
                      ? Text(
                          description,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text(S.current.txtDefaultDescription),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 3,
              color: Colors.black45,
            ),
            ListTile(
              leading: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text(
                S.current.txtDelete,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(_, true);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: Text(S.current.txtCancel),
              onTap: () {
                Navigator.pop(_, false);
              },
            ),
          ],
        ),
      ),
    );

    return result ?? false;
  }

  static Future<Map<String, dynamic>> dropDownFilters(
    BuildContext context, {
    String? title,
    String? description,
    String? sorDirection,
    int? disLength,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(2),
            bottom: Radius.circular(4),
          ),
        ),
        title: title != null ? Text(title) : Text(S.current.txtDefaultTitle),
        content: Column(
          children: [
            Row(
              children: [
                const Text("Ordenar por:"),
                showFiltersByYear(sorDirection!),
              ],
            ),
            Row(
              children: [
                const Text("# por página"),
                showFiltersByLength(disLength!),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(S.current.txtCancel),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              S.current.txtApply,
              style: const TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
    bool b = result ?? false;
    if (b) {
      return {
        "boolean": b,
        "sortDirection": sortDirection.value,
        "displayLength": displayLength.value
      };
    } else {
      return {
        "boolean": b,
        "sortDirection": tmpSortDirection.value,
        "displayLength": tmpDisplayLength.value
      };
    }
  }

  static Widget showFiltersByYear(String sd) {
    const List<Map<String, String>> list = [
      {"label": "Nuevos", "value": "desc"},
      {"label": "Antiguos", "value": "asc"}
    ];
    tmpSortDirection.value = sd;
    sortDirection.value = sd;
    var iniSelection = list.where((element) => element['value'] == sd).first;

    return DropdownMenu<Map<String, String>>(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: BoxConstraints.tight(const Size.fromHeight(30)),
      ),
      initialSelection: iniSelection,
      onSelected: (Map<String, String>? value) {
        sortDirection.value = value!["value"]!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<Map<String, String>>>(
          (Map<String, String> value) {
        return DropdownMenuEntry<Map<String, String>>(
            value: value, label: value["label"]!);
      }).toList(),
    );
  }

  static Widget showFiltersByLength(int dl) {
    tmpDisplayLength.value = dl;
    displayLength.value = dl;
    const list = <int>[10, 20, 30];
    var iniSelection = list.where((element) => element == dl).first;

    return DropdownMenu<int>(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: BoxConstraints.tight(const Size.fromHeight(30)),
      ),
      initialSelection: iniSelection,
      onSelected: (int? value) {
        displayLength.value = value!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(value: value, label: value.toString());
      }).toList(),
    );
  }
}

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showCupertinoModalPopup(
      context: context,
      builder: (_) => PopScope(
        onPopInvoked: (bool didPop) {
          if (kDebugMode) {
            print("$didPop");
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Colors.white30,
          child: const CupertinoActivityIndicator(
            radius: 15,
          ),
        ),
      ),
    );
  }

  static Widget loadingCircularSliverToBoxAdapter({Color? color}) {
    Color c = Colors.white;
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(
            color: color ?? c,
          ),
        ),
      ),
    );
  }
}

class SnackBars {
  static void show(BuildContext context, {required Object error}) {
    final snackBar = SnackBar(
      content: Text(error.toString()),
      action: SnackBarAction(
        label: 'Deshacer',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// class OOFilters {
//   static Widget show() {
//     const List<String> list = <String>['Nuevos', 'Antiguos'];
//     return DropdownMenu<String>(
//       inputDecorationTheme: InputDecorationTheme(
//         focusedBorder: InputBorder.none,
//         isCollapsed: true,
//         isDense: true,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//         constraints: BoxConstraints.tight(const Size.fromHeight(30)),
//       ),
//       initialSelection: list.first,
//       onSelected: (String? value) {
//         print(value);
//       },
//       dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }
