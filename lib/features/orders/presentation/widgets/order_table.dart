import 'package:flutter/material.dart';
import '../../../../shared/widgets/data_table_card.dart';
import 'order_status_badge.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataTableCard(
      columns: [
        DataColumn(
          label: Text(
            'Order ID',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text(
            'Customer',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text('Items', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(
          label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text('#ORD-1092', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataCell(Text('2026-10-06')),
            DataCell(Text('Acme Construction Co.')),
            DataCell(Text('15 items')),
            DataCell(
              Text('\$1,250.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataCell(OrderStatusBadge(status: 'Completed')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text('#ORD-1091', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataCell(Text('2026-10-05')),
            DataCell(Text('Metro Builders Inc.')),
            DataCell(Text('8 items')),
            DataCell(
              Text('\$820.50', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataCell(OrderStatusBadge(status: 'Processing')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text('#ORD-1090', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataCell(Text('2026-10-04')),
            DataCell(Text('City Hardware Center')),
            DataCell(Text('32 items')),
            DataCell(
              Text('\$3,140.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataCell(OrderStatusBadge(status: 'Completed')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text('#ORD-1089', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            DataCell(Text('2026-10-03')),
            DataCell(Text('BuildRight Contractors')),
            DataCell(Text('4 items')),
            DataCell(
              Text('\$340.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataCell(OrderStatusBadge(status: 'Cancelled')),
          ],
        ),
      ],
    );
  }
}
