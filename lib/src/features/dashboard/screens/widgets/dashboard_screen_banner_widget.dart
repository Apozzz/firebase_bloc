import 'package:bloc_firebase/src/constants/colors.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:bloc_firebase/src/constants/sizes.dart';
import 'package:bloc_firebase/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DashboardScreenBannerWidget extends StatelessWidget {
  const DashboardScreenBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardBgColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Icon(Icons.bookmark_rounded)),
                    Flexible(child: Image(image: AssetImage(bannerImageOne))),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  dashboardBannerTitleOne,
                  style: textTheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dashboardBannerSubTitle,
                  style: textTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: dashboardCardPadding,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cardBgColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: Icon(Icons.bookmark_rounded)),
                        Flexible(
                            child: Image(image: AssetImage(bannerImageTwo))),
                      ],
                    ),
                    Text(
                      dashboardBannerTitleOne,
                      style: textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      dashboardBannerSubTitle,
                      style: textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(dashboardButton),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
