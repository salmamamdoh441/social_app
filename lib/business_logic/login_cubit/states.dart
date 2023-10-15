abstract class LoginStates {}

class SocialLoginInitialState extends LoginStates {}
class SocialLoginLoadingState extends LoginStates {}
class SocialLoginSuccessState extends LoginStates {}
class ShopLoginErrorState extends LoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}