import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/first_character_no_space_input_formatter.dart';
import '../../../core/utils/no_space_input_formatter.dart';
import '../../../core/utils/utility.dart';
import '../../../logic/bloc/sign_up_bloc/sign_up_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text_field.dart';
import 'widgets/both_social_button.dart';
import 'widgets/or_continue_with.dart';
import 'widgets/password_text_field.dart';
import 'widgets/text_with_text_link.dart';

final _fullNameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          isShowLoader(false);
          _fullNameController.clear();
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
          /* Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.home, (Route<dynamic> route) => false); */

          // Navigator.of(context).pushReplacementNamed(AppRouter.home);
          Navigator.of(context).pop();
        } else if (state is SignUpFailure) {
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
                  Strings.heyHello,
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
                  Strings.enterYourCredentialsAccessYourAccount,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                const BothSocialButton(),
                const OrContinueWith(),
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  controller: _fullNameController,
                  hintText: Strings.fullName,
                  obscureText: false,
                  maxLength: 256,
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputFormatter: [FirstCharacterNoSpaceInputFormatter()],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 30,
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
                  height: 30,
                ),
                //Password
                PasswordTextField(
                    controller: _passwordController,
                    hintText: Strings.password,
                    textInputAction: TextInputAction.next),
                const SizedBox(
                  height: 30,
                ),
                //Confirm Passowrd
                PasswordTextField(
                  controller: _confirmPasswordController,
                  hintText: Strings.confirmPassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    title: Strings.createAnAccount,
                    isLoading: isLoading,
                    onPressed: () => {_checkSignUp(context)}),
                const SizedBox(
                  height: 40,
                ),
                TextWithTextLink(
                  text: Strings.dontHaveAnAccount,
                  linkText: Strings.signIn,
                  callBack: _loginScreen,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _checkSignUp(BuildContext context) {
    if (_fullNameController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterFullName);
    } else if (_emailController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterEmailAddress);
    } else if (!Utility().isValidEmail(_emailController.text)) {
      Utility().showSnackBar(Strings.pleaseEnterValidEmailAddress);
    } else if (_passwordController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterPassword);
    } else if (_passwordController.text.length < 8) {
      Utility().showSnackBar(Strings.passwordMustBe8To32CharactersLong);
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Utility().showSnackBar(Strings.passwordAndConfirmPasswordMustBeMatch);
    } else {
      isShowLoader(true);
      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
          name: _fullNameController.text,
          email: _emailController.text.toLowerCase());

      context
          .read<SignUpBloc>()
          .add(SignUpRequired(myUser, _passwordController.text));
    }
  }

  void _loginScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void isShowLoader(bool isShowLoader) {
    setState(() {
      isLoading = isShowLoader;
    });
  }


}
