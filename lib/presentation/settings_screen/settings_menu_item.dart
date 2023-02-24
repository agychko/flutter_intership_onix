import 'package:first/util/callbacks.dart';
import 'package:flutter/material.dart';

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem(
      {Key? key,
      required this.nameMenuItem,
      required this.dropdownValue,
      required this.dropdownItem,
      required this.onChanged})
      : super(key: key);

  final String nameMenuItem;
  final int? dropdownValue;
  final List<DropdownMenuItem> dropdownItem;
  final ValueCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [
          BoxShadow(color: Colors.grey, blurRadius: 1, offset: Offset(-1, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(nameMenuItem,
                  style: Theme.of(context).textTheme.titleLarge)),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.grey, width: 0.5)),
              ),
              child: DropdownButton(
                value: dropdownValue,
                underline: Container(),
                alignment: AlignmentDirectional.center,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
                items: dropdownItem,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
