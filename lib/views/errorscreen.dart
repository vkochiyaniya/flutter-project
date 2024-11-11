import 'package:flutter/material.dart';

class ErrorScereen extends StatelessWidget {
  final Object e;
  final StackTrace? trace;
  const ErrorScereen({required this.e, this.trace, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(e.toString()),
          Text(trace.toString()),
        ],
      ),
    );
  }
}
