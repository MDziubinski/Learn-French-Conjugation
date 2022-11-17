import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';

class CustomAnimatedButton extends HookWidget {
  CustomAnimatedButton({
    required this.inactiveColors,
    required this.activeColors,
    required this.builder,
    required this.isActive,
    this.onTap,
    this.activitySwitchDuration = AppDimens.duration150ms,
    super.key,
  }) : assert(
          inactiveColors.length == activeColors.length &&
              inactiveColors.isNotEmpty,
        );

  final Duration activitySwitchDuration;
  final List<Color> inactiveColors;
  final List<Color> activeColors;
  final Widget Function(List<Color> colors) builder;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: activitySwitchDuration);

    final List<Color> animations = List.generate(
      activeColors.length,
      (index) =>
          useAnimation(
            ColorTween(
              begin: inactiveColors[index],
              end: activeColors[index],
            ).animate(animationController),
          ) ??
          Colors.transparent,
    );

    useEffect(() {
      if (isActive) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }, [isActive]);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: builder(
        animations.map((animation) => animation).toList(),
      ),
    );
  }
}
