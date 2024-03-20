import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/firebase_helper.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FireBaseHelper fireBaseHelper;
  SignupCubit(this.fireBaseHelper) : super(SignupInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signUp() async {
    emit(SignUpLoadingState());
    try{
      await fireBaseHelper
          .Signup(emailController.text.trim(), passwordController.text.trim())
          .then((value) => emit(SignUpSuccessState()));
    }catch(e){
      emit(SignUpErrorState());
    }
  }
}
