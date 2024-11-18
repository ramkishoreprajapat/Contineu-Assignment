import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/strings.dart';
import 'social_button.dart';

class BothSocialButton extends StatelessWidget {
  const BothSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialButton(title: Strings.facebook, icon: SvgPicture.asset('assets/icons/ic_facebook.svg'),),
        const SizedBox(width: 8,),
        SocialButton(title: Strings.google, icon: SvgPicture.asset('assets/icons/ic_google.svg'),)
      ],
    );
  }
}
