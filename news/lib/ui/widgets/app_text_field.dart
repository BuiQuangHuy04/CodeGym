import '/constants/index.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final Function()? onTap;
  final TextEditingController? controller;
  final bool? readOnly;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.controller,
    this.readOnly,
    this.focusNode,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: false,
        readOnly: widget.readOnly ?? false,
        onTapOutside: (point) {
          FocusScope.of(context).unfocus();
        },
        onTap: widget.onTap,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.justify,
        maxLines: null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Style.subContent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.normal),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.normal),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
