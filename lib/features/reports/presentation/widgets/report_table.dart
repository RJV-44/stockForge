import 'package:flutter/material.dart';
import '../../../../shared/widgets/data_table_card.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataTableCard(
      columns: [
        DataColumn(
          label: Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Units Sold',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Avg Price',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Gross Revenue',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Gross Margin',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(
                'Power Tools',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(Text('420 pcs')),
            DataCell(Text('\$67.85')),
            DataCell(Text('\$28,500.00')),
            DataCell(Text('32.5%')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text('Hand Tools', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataCell(Text('850 pcs')),
            DataCell(Text('\$16.70')),
            DataCell(Text('\$14,200.00')),
            DataCell(Text('24.8%')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Fasteners & Screws',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(Text('1,840 pcs')),
            DataCell(Text('\$4.20')),
            DataCell(Text('\$7,728.00')),
            DataCell(Text('41.0%')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Plumbing & Pipes',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            DataCell(Text('310 pcs')),
            DataCell(Text('\$29.50')),
            DataCell(Text('\$9,145.00')),
            DataCell(Text('27.2%')),
          ],
        ),
      ],
    );
  }
}
