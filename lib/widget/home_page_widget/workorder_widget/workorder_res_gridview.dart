import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:suja_shoie_app/pages/login_page.dart';
import 'package:suja_shoie_app/widget/home_page_widget/workorder_widget/circular_progress_bar.dart';

import '../../../main.dart';
import '../../../providers/theme_providers.dart';
import '../../../responsive.dart';

import '../../../utils/font_styles.dart';
import '../../../utils/theme_styles.dart';

class WorkOrdersGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Responsive(
        mobile: ResponsiveGridCard(
          crossAxisCount: _size.width < 650 ? 2 : 4,
          childAspectRatio: _size.width < 650 ? 1.1 : 1,
        ),
        tablet: ResponsiveGridCard(
          crossAxisCount: 4,
          childAspectRatio: _size.width <= 900 ? 1.2 : 1,
        ),
        desktop: ResponsiveGridCard(
          crossAxisCount: 4,
          childAspectRatio: _size.width >= 1200 ? 1.1 : 2.7,
        ));
  }
}

class ResponsiveGridCard extends StatelessWidget {
  int crossAxisCount = 4;
  double childAspectRatio = 1;
  ResponsiveGridCard({
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final themeState = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: defaultPadding / 2,
                        mainAxisSpacing: defaultPadding / 2,
                        childAspectRatio: childAspectRatio,
                        mainAxisExtent: 130,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        // Customize content based on the container index
                        if (index == 0) {
                          return GridViewContent(
                            color: themeState.isDarkTheme
                                ? const Color(0xFF424242)
                                : Colors.white,
                            title: 'Check List',
                          );
                        } else if (index == 1) {
                          return GridViewContent(
                            color: themeState.isDarkTheme
                                ? const Color(0xFF424242)
                                : Colors.white,
                            title: 'Work Order',
                          );
                        } else if (index == 2) {
                          return GridViewContent(
                            color: themeState.isDarkTheme
                                ? const Color(0xFF424242)
                                : Colors.white,
                            title: 'Support Ticket',
                          );
                        } else if (index == 3) {
                          return GridViewContent(
                            color: themeState.isDarkTheme
                                ? const Color(0xFF424242)
                                : Colors.white,
                            title: 'Other Task',
                          );
                        } else {
                          // return Container(
                          //   decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(20)),
                          //   ),
                          //   child: Center(
                          //     child: Text('Container ${index + 1}'),
                          //   ),
                          // );
                        }
                      },
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      height: 268,
                      decoration: BoxDecoration(
                        color: themeState.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: themeState.isDarkTheme
                                ? const Color(0xFF0d0d0d)
                                : Colors.grey.shade400,
                            offset: const Offset(5.0, 5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 8, right: 0, bottom: 8),
                              child: Container(
                                color: themeState.isDarkTheme
                                    ? const Color(0xFF303030)
                                    : const Color(0xFFECF0F6),
                                child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [CompleteProgressBar()]),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 8, right: 8, bottom: 8),
                              child: Container(
                                color: themeState.isDarkTheme
                                    ? const Color(0xFF303030)
                                    : const Color(0xFFECF0F6),
                                child: Column(children: [
                                  DropdownMenuExample(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Headings(
                                    text: "Machines",
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ],
                      ), // Include DropdownMenuExample widget here
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 268,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: themeState.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      height: 268,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: themeState.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                      ),
                      child: BarChartExample(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                child: Container(
                  height: 552,
                  color: themeState.isDarkTheme
                      ? const Color(0xFF424242)
                      : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  int selectedValueIndex = 0;
  List<dynamic> numberValues = [
    0,
    2,
    5,
    0
  ]; // Corresponding number values for each option

  void _showBottomSheet(BuildContext context, int selectedValueIndex) {
    String text;
    Widget content;

    switch (selectedValueIndex) {
      case 0:
        text = 'Open';
        content = const Column(
          children: [
            Text('Content for Open'),
            // Add additional widgets specific to 'In progress' option
          ],
        );
        break;
      case 1:
        text = 'In progress';
        content = const Column(
          children: [
            Text('Content for In progress'),
            // Add additional widgets specific to 'In progress' option
          ],
        );
        break;
      case 2:
        text = 'Completed';
        content = const Column(
          children: [
            Text('Content for Completed'),
            // Add additional widgets specific to 'Completed' option
          ],
        );
        break;
      case 3:
        text = 'Overdue';
        content = const Column(
          children: [
            Text('Content for Overdue'),
            // Add additional widgets specific to 'Overdue' option
          ],
        );
        break;
      default:
        text = '';
        content = const SizedBox();
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          text: text,
          Content: content,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Center(
      child: Column(
        children: [
          DropdownButton<int>(
            underline: SizedBox(),
            value: selectedValueIndex,
            iconEnabledColor:
                themeState.isDarkTheme ? Colors.blue : Colors.blue,
            style: const TextStyle(
              fontSize: 14.0, // Adjust the font size
              fontWeight: FontWeight.w500, // Adjust the font weight
              // Adjust the text color
            ),
            dropdownColor:
                themeState.isDarkTheme ? const Color(0xFF424242) : Colors.white,
            onChanged: (newValueIndex) {
              setState(() {
                selectedValueIndex = newValueIndex!;
              });
            },
            items: <DropdownMenuItem<int>>[
              DropdownMenuItem<int>(
                value: 0,
                child: Text(
                  'Open',
                  style: TextStyle(
                    color: themeState.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: Text(
                  'In progress',
                  style: TextStyle(
                    color: themeState.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: themeState.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: Text(
                  'Overdue',
                  style: TextStyle(
                    color: themeState.isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {
              _showBottomSheet(context, selectedValueIndex);
            },
            child: Text(
              '${numberValues[selectedValueIndex]}',
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  final String text;
  final Widget Content;

  const CustomBottomSheet({
    required this.text,
    required this.Content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    // color: primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Content,
          ],
        ),
      ),
    );
  }
}

class GridViewContent extends StatelessWidget {
  final Color color;
  final String title;

  const GridViewContent({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: themeState.isDarkTheme
                ? const Color(0xFF0d0d0d)
                : Colors.grey.shade400,
            offset: const Offset(5.0, 5.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),

      child: Column(
        children: [
          DropdownMenuExample(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Headings(
              text: title,
            ),
          ),
        ],
      ), // Include DropdownMenuExample widget here
    );
  }
}

class ChartData {
  final String category;
  final int value;

  ChartData(this.category, this.value);
}

class BarChartExample extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData('Category 1', 20),
    ChartData('Category 2', 35),
    ChartData('Category 3', 10),
    ChartData('Category 4', 25),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: 'chartData',
        data: chartData,
        domainFn: (ChartData data, _) => data.category,
        measureFn: (ChartData data, _) => data.value,
      ),
    ];
    final themeState = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          themeState.isDarkTheme ? const Color(0xFF424242) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}

class CompleteProgressBar extends StatefulWidget {
  const CompleteProgressBar({
    super.key,
  });

  @override
  State<CompleteProgressBar> createState() => _CompleteProgressBarState();
}

class _CompleteProgressBarState extends State<CompleteProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        child: Column(
          children: [
            Container(
              child: const Center(
                  child: Text(
                '0/27',
                style: TextStyle(fontSize: 18),
              )),
            ),
            const Text(
              'Machines ',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        foregroundPainter: CircularProgressBar());
  }
}
