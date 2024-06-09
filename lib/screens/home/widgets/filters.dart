import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/generated/l10n.dart';

final RxInt displayLength = 10.obs;
final RxInt tmpDisplayLength = 0.obs;

final RxString sortDirection = "desc".obs;
final RxString tmpSortDirection = "".obs;

abstract class HomeFilters {
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
        title: title != null
            ? Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                S.current.txtDefaultTitle,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
        content: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 84,
                  child: Text("Ordenar por"),
                ),
                const SizedBox(
                  width: 10,
                ),
                showFiltersByYear(sorDirection!),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(
                  width: 84,
                  child: Text("Registros por página"),
                ),
                const SizedBox(
                  width: 10,
                ),
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
      width: 130.0,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        constraints: BoxConstraints.tight(const Size.fromHeight(30)),
      ),
      initialSelection: iniSelection,
      onSelected: (Map<String, String>? value) {
        sortDirection.value = value!["value"]!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<Map<String, String>>>(
          (Map<String, String> value) {
        return DropdownMenuEntry<Map<String, String>>(
          value: value,
          label: value["label"]!,
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            visualDensity: const VisualDensity(
              horizontal: 0,
              vertical: -2,
            ),
          ),
        );
      }).toList(),
    );
  }

  static Widget showFiltersByLength(int dl) {
    tmpDisplayLength.value = dl;
    displayLength.value = dl;
    const list = <int>[10, 20, 30, 40, 50];
    var iniSelection = list.where((element) => element == dl).first;

    return DropdownMenu<int>(
      width: 130.0,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: InputBorder.none,
        isCollapsed: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        constraints: BoxConstraints.tight(const Size.fromHeight(30)),
      ),
      initialSelection: iniSelection,
      onSelected: (int? value) {
        displayLength.value = value!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<int>>((int value) {
        return DropdownMenuEntry<int>(
          value: value,
          label: value.toString(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            visualDensity: const VisualDensity(
              horizontal: 0,
              vertical: -2,
            ),
          ),
        );
      }).toList(),
    );
  }
}
