import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/usecase/auth/check_login_google_usecase.dart';
import 'package:my_quran/domain/usecase/auth/login_google_usecase.dart';
import 'package:my_quran/domain/usecase/auth/logout_google_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final CheckLoginGoogleUsecase _authUsecase;
  final LoginGoogleUseCase _loginGoogleUseCase;
  final LogoutGoogleUseCase _logoutGoogleUseCase;

  AuthCubit(
      this._authUsecase, this._loginGoogleUseCase, this._logoutGoogleUseCase)
      : super(AuthInitial());

  void isLogginWithGoogle() async {
    emit(AuthLoading());
    final result = await _authUsecase.call();
    result.fold((failure) {
      emit(AuthError(message: failure.message));
    }, (data) {
      emit(AuthSuccess(data: data));
    });
  }

  void logginWithGoogle() async {
    emit(LoginLoading());
    final result = await _loginGoogleUseCase.call();
    result.fold((failure) {
      emit(LoginFailed(error: failure.message));
    }, (data) {
      emit(LoginSuccess(message: data));
    });
  }

  Future<void> logoutWithGoogle() async {
    emit(LogoutLoading());
    final result = await _logoutGoogleUseCase.call();
    result.fold((failure) {
      emit(LogoutFailed(error: failure.message));
    }, (data) {
      emit(const LogoutSuccess(message: 'success'));
    });
  }
}
