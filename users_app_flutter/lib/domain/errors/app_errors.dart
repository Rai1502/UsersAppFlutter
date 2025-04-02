class AppError extends Error {
  AppError(this.message, [this.stackTrace]);

  final String message;
  @override
  final StackTrace? stackTrace;
}

class TimeoutError extends AppError {
  TimeoutError({String? message, StackTrace? stackTrace})
      : super(message ?? 'TimeoutError', stackTrace);
}

class NoDataError extends AppError {
  NoDataError() : super('Sin datos');
}
