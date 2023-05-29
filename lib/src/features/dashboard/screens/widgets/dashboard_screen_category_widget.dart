import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/features/dashboard/models/dashboard_category_model.dart';
import 'package:flutter/material.dart';

class DashboardScreenCategoryWidget extends StatelessWidget {
  const DashboardScreenCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final gameList = DashboardCategory.list;

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: gameList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: gameList[index].onPress,
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkColor,
                  ),
                  child: Center(
                    child: Text(gameList[index].title,
                        style: textTheme.headline6?.apply(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gameList[index].heading,
                      style: textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      gameList[index].subHeading,
                      style: textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}