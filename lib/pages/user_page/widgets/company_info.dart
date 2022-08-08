import 'package:flutter/material.dart';
import '../../../constants/ui_text.dart';
import '../../../extensions/context_extension.dart';
import '../../../themes/app_colors.dart';

class CompanyInfo extends StatelessWidget {
  final String companyName;
  final String catchPhrase;
  final String bs;

  const CompanyInfo({
    Key? key,
    required this.companyName,
    required this.catchPhrase,
    required this.bs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.grayRegular,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            color: AppColors.charcoal.withOpacity(.5),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UiText.company,
              style: context.theme.headline6.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              companyName,
              style: context.theme.bodyText2.copyWith(
                color: AppColors.gray,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              catchPhrase,
              style: context.theme.bodyText2.copyWith(
                color: AppColors.gray,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              bs,
              style: context.theme.bodyText2.copyWith(
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
