import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_dimens.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    required this.content,
    required this.onTapped,
    required this.available,
    this.onTappedInfo,
    this.height,
    this.passed,
    Key? key,
  }) : super(key: key);

  final String content;
  final VoidCallback onTapped;
  final VoidCallback? onTappedInfo;
  final bool available;
  final double? height;
  final bool? passed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();

    return GestureDetector(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimens.s),
        child: Container(
          height: height ?? AppDimens.mainPageTileHeight,
          decoration: BoxDecoration(
            color: available ? context.primary100 : context.grey30,
            borderRadius: BorderRadius.circular(AppDimens.m),
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppDimens.m,
                    left: AppDimens.m,
                  ),
                  child: Text(
                    content,
                    style: theme?.style11,
                  ),
                ),
              ),
              if (onTappedInfo != null)
                GestureDetector(
                  onTap: onTappedInfo,
                  child: const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: AppDimens.m,
                        right: AppDimens.m,
                      ),
                      child: Icon(
                        Icons.info_outlined,
                        size: AppDimens.xl,
                      ),
                    ),
                  ),
                )
              else if (passed != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppDimens.m,
                      right: AppDimens.m,
                    ),
                    child: Icon(
                      passed! ? Icons.check : Icons.close,
                      size: AppDimens.xl,
                    ),
                  ),
                )
              else
                const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
