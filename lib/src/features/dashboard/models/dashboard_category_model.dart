import 'dart:ui';

class DashboardCategory {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategory(this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategory> list = [
    DashboardCategory('FPS', 'Shooter Games', '10 games', null),
    DashboardCategory('STR', 'Strategy Games', '10 games', null),
    DashboardCategory('PUZ', 'Puzzle Games', '10 games', null),
    DashboardCategory('ACT', 'Action Games', '10 games', null),
    DashboardCategory('RPG', 'Role Play Games', '10 games', null),
  ];
}
