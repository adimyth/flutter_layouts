import 'package:flutter/material.dart';
import 'package:flutter_layouts/theme/shrineTheme.dart';

class LayoutSelector extends StatefulWidget {
  final String title;
  final List<String> values;
  final Function(int) onChanged;
  const LayoutSelector(
      {Key? key,
      required this.title,
      required this.values,
      required this.onChanged})
      : super(key: key);

  @override
  _LayoutSelectorState createState() => _LayoutSelectorState();
}

class _LayoutSelectorState extends State<LayoutSelector> {
  int index = 0;

  void next() {
    setState(() {
      index = (index + 1) % widget.values.length;
      widget.onChanged(index);
    });
  }

  void previous() {
    setState(() {
      index = (index - 1) % widget.values.length;
      widget.onChanged(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: previous,
              icon: Icon(
                Icons.navigate_before,
                color: Theme.of(context).buttonTheme.colorScheme!.onSurface,
              ),
            ),
            Text(widget.values[index],
                style: Theme.of(context).textTheme.bodyText1),
            IconButton(
              onPressed: next,
              icon: Icon(
                Icons.navigate_next,
                color: Theme.of(context).buttonTheme.colorScheme!.onSurface,
              ),
            )
          ],
        )
      ],
    );
  }
}
