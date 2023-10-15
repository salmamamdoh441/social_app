import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/business_logic/login_cubit/states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(SocialLoginLoadingState());

  static LoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());

  }
}