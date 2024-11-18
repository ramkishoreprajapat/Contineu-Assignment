import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enum/custom_scaffold_enum.dart';
import '../../../logic/bloc/sign_in_bloc/bloc/sign_in_bloc.dart';
import '../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBartitle: 'Home',
        costomScaffoldEnum: CustomScaffoldEnum.scaffoldWithSafeAreaWithAppBar,
        actions: [
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(const SignOutRequired());
            },
            icon: const Icon(Icons.logout),
          )
        ],
        safeAreaChild: Container());
  }
}
