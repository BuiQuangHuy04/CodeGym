import '../../constants/index.dart';

class LoadingImg extends StatelessWidget {
  const LoadingImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Image.asset(
        'assets/images/flutter_icon.png',
        width: MediaQuery.sizeOf(context).width * 0.25,
        fit: BoxFit.contain,
      ),
    );
  }
}
