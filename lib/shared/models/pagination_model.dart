class PaginationModel<T> {
  final List<T> items;
  final int page;
  final int totalPages;
  final int totalItems;

  const PaginationModel({
    required this.items,
    required this.page,
    required this.totalPages,
    required this.totalItems,
  });
}
