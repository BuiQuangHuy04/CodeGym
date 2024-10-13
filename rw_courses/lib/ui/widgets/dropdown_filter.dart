import '/constants/index.dart';

class DropdownFilter extends StatefulWidget {
  const DropdownFilter({super.key});

  @override
  State<DropdownFilter> createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<DropdownFilter> {
  final List<String> filters = [
    Strings.iOS,
    Strings.android,
    Strings.flutter,
    Strings.unity,
    Strings.sss,
    Strings.macOS,
    Strings.archived,
    Strings.all,
  ];

  String? selectedItem = Strings.all;

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, provider, child) {
        return DropdownButton<String>(
          //
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
          ),
          elevation: 6,
          underline: const SizedBox.shrink(),
          menuWidth: MediaQuery.of(context).size.width * 0.6,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          selectedItemBuilder: (BuildContext context) {
            return filters.map((String item) {
              return const Text('');
            }).toList();
          },
          //
          items: filters.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Radio<String>(
                    value: item,
                    groupValue: selectedItem,
                    onChanged: (String? value) {
                      setState(() {
                        selectedItem = value;
                        provider.filter = value!;
                      });
                    },
                  ),
                  Text(item),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) async {
            setState(() {
              selectedItem = newValue;
              provider.updateLoading(true);
              provider.filter = newValue!;
              provider.convertFilter();
            });
            if (newValue != null) {
              await provider.saveFilter(newValue);
            }
          },
        );
      },
    );
  }
}
