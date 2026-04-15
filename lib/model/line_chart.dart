import 'package:collection/collection.dart';

class LineChartModel {
  final double x;
  final double y;

  LineChartModel({required this.x, required this.y});
// getData ozgargan ekan
  static List<LineChartModel> getData() {
    final data = <double>[2, 4, 6, 11, 3, 6, 4];

    return data
        .mapIndexed(
          (index, value) =>
              LineChartModel(x: index.toDouble(), y: value),
        )
        .toList();
  }
}