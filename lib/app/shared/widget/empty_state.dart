import 'package:flutter/material.dart';
import 'package:vocly/app/shared/theme/vocly_typography.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_outlined, size: 30),
          SizedBox(width: 5),
          Text('Empty', style: VoclyTypography.titleMedium),
        ],
      ),
    );
  }
}
