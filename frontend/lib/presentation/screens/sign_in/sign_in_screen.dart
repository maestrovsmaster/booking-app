import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/data/models/app_user.dart';
import 'package:frontend/presentation/block/user_register/register_block.dart';
import 'package:frontend/presentation/block/user_register/register_event.dart';
import 'package:frontend/presentation/block/user_register/register_state.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_block.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_event.dart';
import 'package:frontend/presentation/block/user_sign_in/sign_in_state.dart';
import 'package:frontend/presentation/navigation/app_router.dart';
import 'package:go_router/go_router.dart';



class SignInScreen extends StatelessWidget {


  SignInScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: 'test@test.com');
    final passwordController = TextEditingController(text:  'asdf123');

    return BlocProvider(
      create: (context) => sl<SignInBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Sign In")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: "Password"),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<SignInBloc, SignInState>(
                    listener: (context, state) {
                      if (state is SignInFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                      if (state is SignInSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login successful!")),
                        );
                        //context.pop(); //
                        context.pushReplacement(AppRoutes.welcome);
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {


                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill in all fields")),
                              );
                              return;
                            }

                            context.read<SignInBloc>().add(FetchSignIn(email: email, password: password));
                          },
                          child: Text("Sign In"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

