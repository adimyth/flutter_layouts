import 'package:flutter/material.dart';
import 'package:flutter_layouts/widgets/layoutselector.dart';

class ContainerLayout extends StatefulWidget {
  final String title;
  const ContainerLayout({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ContainerLayout> createState() => _ContainerLayoutState();
}

class _ContainerLayoutState extends State<ContainerLayout> {
  List<String> paddingValues = ["0", "10", "20", "30", "40", "50"];
  List<String> marginValues = ["0", "10", "20", "30", "40", "50"];
  double padding = 0;
  double margin = 0;

  double getPadding(int index) {
    return double.parse(paddingValues[index]);
  }

  void setPadding(int index) {
    setState(() {
      padding = getPadding(index);
      print("Padding: {$padding}");
    });
  }

  double getMargin(int index) {
    return double.parse(marginValues[index]);
  }

  void setMargin(int index) {
    setState(() {
      margin = getMargin(index);
      print("Margin: {$margin}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.pink.shade100,
              width: double.infinity,
              child: Text(
                "Top Widget",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              padding: EdgeInsets.all(padding),
              margin: EdgeInsets.all(margin),
              child: Text(
                "Middle Widget",
                style: Theme.of(context).textTheme.headline5,
              ),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primary,
            ),
            Container(
              color: Colors.pink.shade100,
              width: double.infinity,
              child: Text(
                "Bottom Widget",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
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
              title: "Padding",
              values: paddingValues,
              onChanged: setPadding,
            ),
            LayoutSelector(
              title: "Margin",
              values: const ["0", "10", "20", "30", "40", "50"],
              onChanged: setMargin,
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
