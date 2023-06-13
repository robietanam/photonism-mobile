import 'package:flutter/material.dart';

void myAlertError({
  required BuildContext context,
  String text = "Data kosong harap isi data terlebih dahulu",
  VoidCallback? fun,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SizedBox(
            height: MediaQuery.of(context).size.width / 2.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed:
                        (fun != null) ? fun : () => Navigator.pop(context),
                    child: const Text("Oke"))
              ],
            ),
          ),
        );
      });
}

void myAlertSuccess({
  required BuildContext context,
  String text = "Data berhasil ditambahkan",
  VoidCallback? fun,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SizedBox(
            height: MediaQuery.of(context).size.width / 2.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed:
                        (fun != null) ? fun : () => Navigator.pop(context),
                    child: const Text("Oke"))
              ],
            ),
          ),
        );
      });
}

Future<dynamic> myLoadingPopup({
  required BuildContext context,
  String text = "Loading",
  VoidCallback? fun,
}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SizedBox(
            height: MediaQuery.of(context).size.width / 2.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      });
}
