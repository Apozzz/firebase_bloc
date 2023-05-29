import 'dart:ui';

import 'package:bloc_firebase/src/constants/image_strings.dart';

class DashboardTopGames {
  final String title;
  final String image;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardTopGames(
    this.title,
    this.image,
    this.heading,
    this.subHeading,
    this.onPress,
  );

  static List<DashboardTopGames> topGamesList = [
    DashboardTopGames('Clash of Clans', topCourseImageOne, 'Strategy', '4.5 stars', null),
    DashboardTopGames('Survivor.io', topCourseImageOne, 'Adventure', '4.6 stars', null),
    DashboardTopGames('Viking Rise', topCourseImageOne, 'Strategy', '4.6 stars', null),
    DashboardTopGames('Clash Royale', topCourseImageOne, 'Strategy & Tactic', '4.3 stars', null),
    DashboardTopGames('Coin Master', topCourseImageOne, 'Casino', '4.6 stars', null),
  ];
}
