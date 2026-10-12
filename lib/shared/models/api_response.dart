class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  const ApiResponse({required this.success, this.message, this.data});

  factory ApiResponse.success(T data, [String? message]) {
    return ApiResponse(success: true, data: data, message: message);
  }

  factory ApiResponse.error(String message) {
    return ApiResponse(success: false, message: message);
  }
}
