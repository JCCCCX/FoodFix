import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/function/main/main_tab_page.dart';

class SettingStatisticsPage extends StatelessWidget {
  const SettingStatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("Bread", style: h1),
                margin: const EdgeInsets.only(left: 10),
              ),
              const SizedBox(height: 12),
              const ChartPage(),
            ],
          ),
        ),
        Positioned(
          bottom: 48,
          left: 0,
          right: 0,
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () => {},
            child: Container(
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Theme.of(context).primaryColor,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: const Text(
                "Logout",
                style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BarData {
  final Color color;
  final double value;
  final double shadowValue;

  const _BarData(this.color, this.value, this.shadowValue);
}

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  static const shadowColor = Color(0xFFCCCCCC);
  static const dataList = [
    _BarData(Color(0xFFe1781c), 500, 300),
    _BarData(Color(0xFFe1781c), 900, 700),
    _BarData(Color(0xFFe1781c), 700, 500),
    _BarData(Color(0xFFe1781c), 200, 400),
    // _BarData(Color(0xFF295ab5), 2, 2.5),
    // _BarData(Color(0xFFea0107), 2, 2),
  ];

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final month = ["May", "Jun", "Jul", "Aug"];

  // final values = [100, 200, "Jul", "Aug"];

  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: Color(0xFF4674c8),
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: ChartPage.shadowColor,
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.4,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      borderData: FlBorderData(
                        show: false,
                        border: const Border.symmetric(
                          horizontal: BorderSide(
                            color: Color(0xFFececec),
                          ),
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          drawBehindEverything: true,
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFF606060),
                                ),
                                textAlign: TextAlign.left,
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (double a, b) =>
                                Text(month[a.toInt()]),
                          ),
                        ),
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: const Color(0xFFececec),
                          dashArray: null,
                          strokeWidth: 1,
                        ),
                      ),
                      barGroups: ChartPage.dataList.asMap().entries.map((e) {
                        final index = e.key;
                        final data = e.value;
                        return generateBarGroup(
                            index, data.color, data.value, data.shadowValue);
                      }).toList(),
                      maxY: 1000,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildBoxTag("Grain", const Color(0xFF4674c8)),
                    buildBoxTag("Italian", const Color(0xFFe97c1e)),
                    buildBoxTag("ABC", const Color(0xFFa5a5a5)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildBoxTag(String desc, Color color) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          desc,
          style: h1.copyWith(color: const Color(0xFFa5a5a5), fontSize: 13),
        )
      ],
    );
  }
}
