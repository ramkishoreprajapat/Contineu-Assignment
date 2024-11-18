import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/utils/log_in_and_sign_up_with_email_and_pass_failure.dart';
import '../../../core/utils/utility.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
       try {
          MyUser myUser = await _userRepository.signUp(event.myUser, event.password);
          await _userRepository.setUserData(myUser);
          emit(SignUpSuccess());
       } on FirebaseAuthException catch (e) {
         Utility().debug(e.code);
        emit(SignUpFailure(message: LogInAndSignUpWithEmailAndPassFailure.fromCode(e.code).message));
       } catch (e) {
        emit(const SignUpFailure());
       }
    });
  }
}
