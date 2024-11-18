import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/no_space_input_formatter.dart';
import '../../../core/utils/utility.dart';
import '../../../logic/bloc/forget_password_bloc/forget_password_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text_field.dart';

final _emailController = TextEditingController();

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          isShowLoader(false);
          _emailController.clear();
          Utility().showSnackBar(Strings.passwordResetLinkHasBeenSuccessfullySentToYourMailAddress);
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordFailure) {
          isShowLoader(false);
          Utility().showSnackBar(state.message!);
        }
      },
      child: CustomScaffold(
        costomScaffoldEnum:
            CustomScaffoldEnum.scaffoldWithSafeAreaWithoutAppBar,
        appBartitle: '',
        safeAreaChild: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context).pop()
                  },
                  child: const Icon(Icons.arrow_back, size: 24,)),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      child: Image.asset(
                        'images/ic_logo.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  Strings.forgetPassword,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  Strings.enterYourEmailForResetYourPassword,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                //Email or Phone Number
                CustomTextField(
                  controller: _emailController,
                  hintText: Strings.emailAddress,
                  obscureText: false,
                  maxLength: 256,
                  textInputType: TextInputType.emailAddress,
                  textInputFormatter: [NoSpaceInputFormatter()],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    title: Strings.submit,
                    isLoading: isLoading,
                    onPressed: () => {_checkForgetPassword(context)}),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _checkForgetPassword(BuildContext context) {
    if (_emailController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterEmailAddress);
    } else if (!Utility().isValidEmail(_emailController.text)) {
      Utility().showSnackBar(Strings.pleaseEnterValidEmailAddress);
    } else {
      isShowLoader(true);
    
      context
          .read<ForgetPasswordBloc>()
          .add(ForgetPasswordRequired(_emailController.text));
    }
  }

  void isShowLoader(bool isShowLoader) {
    setState(() {
      isLoading = isShowLoader;
    });
  }


}
