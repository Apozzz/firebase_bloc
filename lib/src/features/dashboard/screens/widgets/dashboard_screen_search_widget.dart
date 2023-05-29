import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashboardScreenSearchWidget extends StatelessWidget {
  const DashboardScreenSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 4),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dashboardSearch,
            style:
                textTheme.headline2?.apply(color: Colors.grey.withOpacity(0.5)),
          ),
          const Icon(Icons.mic, size: 25),
        ],
      ),
    );
  }
}
