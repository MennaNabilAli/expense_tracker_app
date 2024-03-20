import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/fonts.dart';
import '../../../../core/widgets/default_gradient_buutton.dart';
import '../../../../core/widgets/default_text_form_field.dart';

class EmailAndPassForm extends StatefulWidget {
  const EmailAndPassForm({super.key});

  @override
  State<EmailAndPassForm> createState() => _EmailAndPassFormState();
}

class _EmailAndPassFormState extends State<EmailAndPassForm> {
  bool isPassword = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back !',
            style: AppFont.font28SemiBoldWhite,
          ),
          verticalSpace(45),
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
          verticalSpace(20),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: AppFont.font18BoldWhite,
              )),
          verticalSpace(25),
          DefaultGradientButton(
              child: Text(
                'Login',
                style: AppFont.font18BoldWhite,
              ),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 1.0],
                  colors: [AppColors.orangeColor, AppColors.yellowColor]),
              onPressed: () {validateThenLogin();}),
        ],
      ),
    );
  }
  validateThenLogin(){
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().
      login();
    }
  }
}
