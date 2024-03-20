import 'package:expense_tracker/core/networking/firebase_helper.dart';
import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:expense_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:expense_tracker/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routs.dart';

class BuildBlocListenerSignUp extends StatelessWidget {
  const BuildBlocListenerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(

      listenWhen: (previous, current) =>
      current is SignUpSuccessState ||
          current is SignUpErrorState ||
          current is SignUpLoadingState,
      listener: (context, state) {
        if(state is SignUpLoadingState){
          showDialog(context: context, builder:  (context) =>  Center(child: CircularProgressIndicator(),),);
        }
        else if (state is SignUpErrorState){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error signning up'),
              backgroundColor: Colors.red,
            ),
          );
        }
        else{
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.home);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
