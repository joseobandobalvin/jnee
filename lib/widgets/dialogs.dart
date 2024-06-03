import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jnee/generated/l10n.dart';

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
