import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/firebase_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FireBaseHelper fireBaseHelper;
  LoginCubit(this.fireBaseHelper) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    emit(LoginLoadingState());
    try{
      await fireBaseHelper
          .loginUser(emailController.text.trim(), passwordController.text.trim())
          .then((value) => emit(LoginSuccessState()));
    }catch(e){
      emit(LoginErrorState());
    }
  }
}
