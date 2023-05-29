import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/dashboard_screen_appbar_widget.dart';
import 'widgets/dashboard_screen_banner_widget.dart';
import 'widgets/dashboard_screen_category_widget.dart';
import 'widgets/dashboard_screen_search_widget.dart';
import 'widgets/dashboard_screen_top_games_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardScreenAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(dashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dashboardTitle, style: textTheme.bodyText2),
              Text(dashboardHeading, style: textTheme.headline2),
              const SizedBox(
                height: dashboardPadding,
              ),
              const DashboardScreenSearchWidget(),
              const SizedBox(
                height: dashboardPadding,
              ),
              const DashboardScreenCategoryWidget(),
              const SizedBox(
                height: dashboardPadding,
              ),
              const DashboardScreenBannerWidget(),
              const SizedBox(
                height: dashboardPadding,
              ),
              Text(
                dashboardTopGames,
                style: textTheme.headline4?.apply(fontSizeFactor: 1.2),
              ),
              const DashboardScreenTopGamesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
