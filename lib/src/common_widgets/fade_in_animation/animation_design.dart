import 'package:bloc_firebase/src/common_widgets/fade_in_animation/bloc/fade_in_animation_bloc.dart';
import 'package:bloc_firebase/src/common_widgets/fade_in_animation/models/fade_in_animation_model.dart';
import 'package:bloc_firebase/src/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    super.key,
    required this.animation,
    required this.durationMs,
    this.animatePosition,
    required this.child,
  });

  final bool animation;
  final AnimatePosition? animatePosition;
  final int durationMs;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: durationMs),
      top: animation ? animatePosition!.topAfter : animatePosition!.topBefore,
      left:
          animation ? animatePosition!.leftAfter : animatePosition!.leftBefore,
      bottom: animation
          ? animatePosition!.bottomAfter
          : animatePosition!.bottomBefore,
      right: animation
          ? animatePosition!.rightAfter
          : animatePosition!.rightBefore,
      child: AnimatedOpacity(
        opacity: animation ? 1 : 0,
        duration: Duration(milliseconds: durationMs),
        child: child,
      ),
    );
  }
}
