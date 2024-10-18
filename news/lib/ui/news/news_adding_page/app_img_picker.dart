import '/constants/index.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker({super.key});

  @override
  State<AppImagePicker> createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  File? _imageFile;
  String localImagePath = '';
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _getImagePath().then((value) {
          if (kDebugMode) {
            print('path: ${value ?? ''}');
          }
        });
        _saveImageToAppDirectory(pickedFile.name);
        if (kDebugMode) {
          print('name: ${pickedFile.name}');
        }
      });
    }
  }

  Future<String?> _getImagePath() async {
    if (_imageFile != null) {
      return _imageFile!.path;
    }
    return null;
  }

  Future<void> _saveImageToAppDirectory(String name) async {
    final directory = await getApplicationDocumentsDirectory();
    localImagePath = '${directory.path}/$name';
    File savedImage = await File(_imageFile!.path).copy(localImagePath);

    if (kDebugMode) {
      print('Image saved at: ${savedImage.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build AppImagePicker');
    }
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _imageFile == null
                      ? const Text('No image selected.')
                      : Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.extra,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.file(_imageFile!),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _pickImage,
                tooltip: _imageFile == null ? 'Pick Image' : 'Change Image',
                child: Icon(_imageFile == null
                    ? Icons.add_photo_alternate_outlined
                    : Icons.change_circle_outlined),
              ),
              _imageFile != null
                  ? const SizedBox(
                      height: AppPadding.big,
                    )
                  : Container(),
              _imageFile != null
                  ? FloatingActionButton(
                      onPressed: () {
                        provider.updateThumbPath(localImagePath);
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      tooltip: 'Save',
                      child: const Icon(Icons.save_outlined),
                    )
                  : Container(),
              const SizedBox(
                height: AppPadding.big,
              ),
              FloatingActionButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                tooltip: 'Cancel',
                child: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
