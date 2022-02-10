import 'package:flutter/material.dart';
import 'package:flutter_layouts/widgets/layoutselector.dart';

class RowColumnGrid extends StatefulWidget {
  final String title;
  const RowColumnGrid({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<RowColumnGrid> createState() => _RowColumnGridState();
}

class _RowColumnGridState extends State<RowColumnGrid> {
  bool rowLayout = true;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.min;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;

  void setLayout(int index) {
    setState(() {
      rowLayout = index == 0;
    });
  }

  MainAxisAlignment getMainAxisAlignment(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.start;
    }
  }

  void setMainAxisAlignment(int index) {
    setState(() {
      mainAxisAlignment = getMainAxisAlignment(index);
    });
  }

  MainAxisSize getMainAxisSize(int index) {
    switch (index) {
      case 0:
        return MainAxisSize.min;
      case 1:
        return MainAxisSize.max;
      default:
        return MainAxisSize.min;
    }
  }

  void setMainAxisSize(int index) {
    setState(() {
      mainAxisSize = getMainAxisSize(index);
    });
  }

  CrossAxisAlignment getCrossAxisAlignment(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
      case 5:
        return CrossAxisAlignment.start;
      default:
        return CrossAxisAlignment.start;
    }
  }

  void setCrossAxisAlignment(int index) {
    setState(() {
      crossAxisAlignment = getCrossAxisAlignment(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: const Size(0.0, 160.0),
          child: buildSelectors(context),
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final children = [
      const FlutterLogo(size: 50),
      const FlutterLogo(size: 100),
      const FlutterLogo(size: 50),
    ];

    if (rowLayout) {
      return Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
        ),
      );
    } else {
      return Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
        ),
      );
    }
  }

  Column buildSelectors(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Divider(thickness: 3, color: Theme.of(context).dividerColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LayoutSelector(
              title: "Layout",
              values: const ["Row", "Column"],
              onChanged: setLayout,
            ),
            LayoutSelector(
              title: "Main Axis Alignment",
              values: const [
                "Start",
                "End",
                "Center",
                "Space Between",
                "Space Around",
                "Space Evenly"
              ],
              onChanged: setMainAxisAlignment,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Divider(thickness: 3, color: Theme.of(context).dividerColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LayoutSelector(
              title: "Main Axis Size",
              values: const ["Min", "Max"],
              onChanged: setMainAxisSize,
            ),
            LayoutSelector(
              title: "Cross Axis Alignment",
              values: const ["Start", "End", "Center", "Stretch"],
              onChanged: setCrossAxisAlignment,
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
