import 'package:flutter/material.dart';
import '../../core/widgets/app_card.dart';

class DataTableCard extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const DataTableCard({super.key, required this.columns, required this.rows});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: columns, rows: rows),
      ),
    );
  }
}
