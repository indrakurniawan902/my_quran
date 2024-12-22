import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/usecase/auth/auth_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit({required this.authUsecase}) : super(AuthInitial());

  void signinWithGoogle() async {
    emit(AuthLoading());
    final result = await authUsecase.call();
    result.fold((failure) {
      emit(AuthError(message: failure.message));
    }, (data) {
      emit(const AuthSuccess(message: "Success Login"));
    });
  }
}
