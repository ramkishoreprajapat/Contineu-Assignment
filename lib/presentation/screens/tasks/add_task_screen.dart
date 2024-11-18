import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/first_character_no_space_input_formatter.dart';
import '../../../core/utils/utility.dart';
import '../../../logic/bloc/forget_password_bloc/forget_password_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text_field.dart';

final _titleController = TextEditingController();
final _descriptionController = TextEditingController();

class AddTaskdScreen extends StatefulWidget {
  const AddTaskdScreen({super.key});

  @override
  State<AddTaskdScreen> createState() => _AddTaskdScreenState();
}

class _AddTaskdScreenState extends State<AddTaskdScreen> {
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
          _titleController.clear();
          Utility().showSnackBar(Strings
              .passwordResetLinkHasBeenSuccessfullySentToYourMailAddress);
          Navigator.of(context).pop();
        } else if (state is ForgetPasswordFailure) {
          isShowLoader(false);
          Utility().showSnackBar(state.message!);
        }
      },
      child: CustomScaffold(
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        appBartitle: Strings.addTask,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        safeAreaChild: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [               
                // Title
                CustomTextField(
                  controller: _titleController,
                  hintText: Strings.title,
                  obscureText: false,
                  maxLength: 256,
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputFormatter: [FirstCharacterNoSpaceInputFormatter()],
                  textInputAction: TextInputAction.next,
                ),
                //Description
                const SizedBox(
                  height: 24,
                ),
                CustomTextField(
                  controller: _descriptionController,
                  hintText: Strings.description,
                  obscureText: false,
                  maxLength: 1024,
                  textInputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputFormatter: [FirstCharacterNoSpaceInputFormatter()],
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
    if (_titleController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterTitle);
    }
    if (_descriptionController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterDescription);
    } else {
      isShowLoader(true);

      context
          .read<ForgetPasswordBloc>()
          .add(ForgetPasswordRequired(_titleController.text));
    }
  }

  void isShowLoader(bool isShowLoader) {
    setState(() {
      isLoading = isShowLoader;
    });
  }
}
