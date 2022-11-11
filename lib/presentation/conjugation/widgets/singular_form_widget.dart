import 'package:flutter/material.dart';
import 'package:french_conjugation_learn/presentation/style/app_theme.dart';

class SingularFormWidget extends StatelessWidget {
  const SingularFormWidget({
    required this.singularForm,
    Key? key,
  }) : super(key: key);

  final MapEntry<String, String> singularForm;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomAppTheme>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          singularForm.key,
          style: theme?.style11,
        ),
        Text(
          singularForm.value,
          style: theme?.style9,
        ),
      ],
    );
  }
}
