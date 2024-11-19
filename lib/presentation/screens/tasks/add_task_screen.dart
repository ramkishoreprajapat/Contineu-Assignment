import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import '../../../core/constants/strings.dart';
import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../core/utils/first_character_no_space_input_formatter.dart';
import '../../../core/utils/utility.dart';
import '../../../logic/bloc/add_task_bloc/add_task_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text_field.dart';

final _titleController = TextEditingController();
final _descriptionController = TextEditingController();

class AddTaskScreen extends StatefulWidget {
  final String id;
  final String title;
  final String description;

  const AddTaskScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.description});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isUpdate = false;
  @override
  void initState() {
    super.initState();

    _titleController.clear();
    _descriptionController.clear();
    
    if (widget.id.isNotEmpty) {
      isUpdate = true;
      _titleController.text = widget.title;
      _descriptionController.text = widget.description;
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskBloc, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          isShowLoader(false);
          _titleController.clear();
          _descriptionController.clear();
          Utility().showSnackBar(isUpdate
              ? Strings.taskUpdatedSuccessfully
              : Strings.taskAddedSuccessfully);
          Navigator.pop(context, "isRefresh");
        } else if (state is AddTaskFailure) {
          isShowLoader(false);
          Utility().showSnackBar(state.message!);
        }
      },
      child: CustomScaffold(
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        appBartitle: isUpdate ? Strings.updateTask : Strings.addTask,
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
                  textInputType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.words,
                  textInputFormatter: [FirstCharacterNoSpaceInputFormatter()],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 40,
                ),

                CustomButton(
                    title: isUpdate ? Strings.update : Strings.add,
                    isLoading: isLoading,
                    onPressed: () => {_checkAddTask(context)}),
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

  void _checkAddTask(BuildContext context) {
    if (_titleController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterTitle);
    } else if (_descriptionController.text.isEmpty) {
      Utility().showSnackBar(Strings.pleaseEnterDescription);
    } else {
      isShowLoader(true);

      Task task = Task.empty;
      task = task.copyWith(
          id: widget.id,
          title: _titleController.text,
          description: _descriptionController.text);

      context.read<AddTaskBloc>().add(AddTaskRequired(task));
    }
  }

  void isShowLoader(bool isShowLoader) {
    setState(() {
      isLoading = isShowLoader;
    });
  }
}
