import 'package:flutter/material.dart';

enum Status {
  initial,
  loading,
  success,
  error,
  empty,
}

extension StatusExtension on Status {
  bool get isInitial => this == Status.initial;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
  bool get isEmpty => this == Status.empty;
}

class StatusHandler extends StatelessWidget {
  const StatusHandler({
    super.key,
    required this.status,
    required this.onSuccess,
    this.error,
  });
  final Status status;
  final Widget onSuccess;
  final String? error;
  Widget _handleStatus() {
    switch (status) {
      case Status.initial:
        return const SizedBox.shrink();
      case Status.loading:
        return const Center(child: CircularProgressIndicator());
      case Status.success:
        return onSuccess;
      case Status.error:
        return Center(child: Text(error ?? 'Server Error'));
      case Status.empty:
        return const Center(child: Text('No Breeds Found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _handleStatus();
  }
}
