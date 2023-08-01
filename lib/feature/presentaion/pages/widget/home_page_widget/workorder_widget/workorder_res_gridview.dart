import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:suja_shoie_app/feature/presentaion/pages/widget/home_page_widget/workorder_widget/circular_progress_bar.dart';
import 'package:suja_shoie_app/feature/presentaion/pages/widget/home_page_widget/workorder_widget/dropdown_button.dart';
import 'package:suja_shoie_app/models/checklist_staatus_model.dart';

import '../../../../providers/checklist_status_provider.dart';
import '../../../../providers/theme_providers.dart';

import '../../../../../../core/utils/font_styles.dart';
import '../../../../../../core/utils/theme_styles.dart';
import 'dropdown_circularbar.dart';

class WorkOrdersGridView extends StatelessWidget {
  int crossAxisCount = 4;
  double childAspectRatio = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final themeState = Provider.of<ThemeProvider>(context);
    return Column(
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
                        return const GridViewContent(
                          title: 'Checklists',
                        );
                      } else if (index == 1) {
                        return const GridViewContent(
                          title: 'Work Orders',
                        );
                      } else if (index == 2) {
                        return const GridViewContent(
                          title: 'Support Tickets',
                        );
                      } else if (index == 3) {
                        return const GridViewContent(
                          title: 'Other Tasks',
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
                    height: defaultPadding / 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: themeState.isDarkTheme
                          ? const Color(0xFF424242)
                          : Colors.white,
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
                    height: 268,

                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: Container(
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              child: const Column(children: [
                                DropdownMenuCircular(
                                  option: Text('Option Widget'),
                                  inProgress: Text('In Progress Widget'),
                                  complete: Text('Complete Widget'),
                                  overdue: Text('Overdue Widget'),
                                  widgetOptions: [
                                    CompleteProgressBar(),
                                    Text('Overdue Widget'),
                                    CompleteProgressBar(),
                                    Text('Overdue Widget'),
                                  ],
                                ),
                              ]),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ), // Include DropdownMenuExample widget here
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
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
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Container(
                      height: 268,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: themeState.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                      ),
                      child: Container()),
                ],
              ),
            ),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
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
                    child: Container(),
                  ),
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Container(
                      height: 268,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: themeState.isDarkTheme
                            ? const Color(0xFF424242)
                            : Colors.white,
                      ),
                      child: Container()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GridViewContent extends StatelessWidget {
  final String title;

  const GridViewContent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: themeState.isDarkTheme ? const Color(0xFF424242) : Colors.white,
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
          DropdownMenuExample(
            Open: Column(
              children: [
                Text('Content for Option'),

                // Add additional widgets specific to the 'option' option
              ],
            ),
            inProgress: Column(
              children: [
                Text('Content for In Progress'),
                // Add additional widgets specific to the 'inProgress' option
              ],
            ),
            complete: Column(
              children: [
                Text('Content for Complete'),
                // Add additional widgets specific to the 'complete' option
              ],
            ),
            overdue: Column(
              children: [
                Text('Content for Overdue'),
                // Add additional widgets specific to the 'overdue' option
              ],
            ),
            widgetList: [10, 5, 6, 9],
          ),
          SizedBox(
            height: 10,
          ),
          Headings(
            text: title,
          ),
        ],
      ),
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
        foregroundPainter: CircularProgressBar(),
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
        ));
  }
}
