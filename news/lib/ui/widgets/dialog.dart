import '/constants/index.dart';

void showConfirmationDialog(
  BuildContext context, {
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          title: const Text(
            'Confirm Delete!',
            style: Style.titleConfirmDialog,
          ),
          backgroundColor: Colors.green,
          content: const Text(
            'Are you sure you want to proceed?',
            style: Style.contentConfirmDialog,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close_rounded),
            ),
            IconButton(
              onPressed: () {
                if (onConfirm != null) {
                  onConfirm();
                }
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check_rounded),
            ),
          ],
        ),
      );
    },
  );
}
