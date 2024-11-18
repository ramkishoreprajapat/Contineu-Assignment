import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final UserRepository _userRepository;

  ForgetPasswordBloc({required UserRepository userRepository}) 
  : _userRepository = userRepository, 
  super(ForgetPasswordInitial()) {
    on<ForgetPasswordRequired>((event, emit) async {
      emit(ForgetPasswordProcess());
      try {
          await _userRepository.forgetPassword(event.email);
          emit(ForgetPasswordSuccess());
      } catch(e) {
        emit(const ForgetPasswordFailure());
      }
    });
  }
}
