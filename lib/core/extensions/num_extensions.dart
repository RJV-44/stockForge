extension NumExtensions on num {
  String get toCurrency => '\$${toStringAsFixed(2)}';
  String get toPercentage => '${toStringAsFixed(1)}%';
}
