import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:expense_tracker/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/default_gradient_buutton.dart';
import '../../../../core/widgets/default_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _EmailAndPassFormState();
}

class _EmailAndPassFormState extends State<SignupForm> {
  bool isPassword = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController passwordConfirmController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<SignupCubit>().emailController;
    passwordController = context.read<SignupCubit>().passwordController;
    nameController = context.read<SignupCubit>().nameController;
    passwordConfirmController = context.read<SignupCubit>().passwordConfirmController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to mahfaz!',
            style: AppFont.font28SemiBoldWhite,
          ),
          verticalSpace(45),
          Text(
            'Name',
            style: AppFont.font18BoldWhite,
          ),
          verticalSpace(10),
          DefaultTextFormField(
            hintText: 'Enter you name',
            isPassword: false,
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
            },
          ),
          verticalSpace(15),
          Text(
            'Email',
            style: AppFont.font18BoldWhite,
          ),
          verticalSpace(10),
          DefaultTextFormField(
            hintText: 'Enter you email',
            isPassword: false,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
            },
          ),
          verticalSpace(15),
          Text(
            'Password',
            style: AppFont.font18BoldWhite,
          ),
          verticalSpace(10),
          DefaultTextFormField(
            controller: passwordController,
            hintText: 'Enter you password',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: isPassword
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
            isPassword: isPassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
            },
          ),
          verticalSpace(15),
          Text(
            'Password Confirmation',
            style: AppFont.font18BoldWhite,
          ),
          verticalSpace(10),
          DefaultTextFormField(
            controller: passwordConfirmController,
            hintText: 'Enter you password confirmation',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: isPassword
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
            isPassword: isPassword,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              else if(passwordConfirmController.text.trim() != passwordController.text.trim() ){
                return 'Passwords doesn\'t match';
              }
    },
          ),
          verticalSpace(25),
          Align(
            alignment: Alignment.center,
            child: Text(
              'By continuing, you agree to our Terms \n of use and privacy policy',
              style: AppFont.font13GreyW300,
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpace(20),
          DefaultGradientButton(
              child: Text(
                'SignUp',
                style: AppFont.font18BoldWhite,
              ),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 1.0],
                  colors: [AppColors.orangeColor, AppColors.yellowColor]),
              onPressed: () {validateThenSignup();}),
        ],
      ),
    );
  }
  validateThenSignup(){
    if(context.read<SignupCubit>().formKey.currentState!.validate()){
      context.read<SignupCubit>().signUp();
    }
  }
}
