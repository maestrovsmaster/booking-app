import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/di/di_container.dart';
import 'package:frontend/data/models/app_user.dart';
import 'package:frontend/presentation/block/user_register/register_block.dart';
import 'package:frontend/presentation/block/user_register/register_event.dart';
import 'package:frontend/presentation/block/user_register/register_state.dart';
import 'package:frontend/presentation/navigation/app_router.dart';
import 'package:go_router/go_router.dart';



class RegisterScreen extends StatelessWidget {


  RegisterScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: 'Test User');
    final emailController = TextEditingController(text: 'test@test.com');
    final passwordController = TextEditingController(text:  'asdf123');

    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Register User")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
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
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                      if (state is RegisterSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration successful!")),
                        );
                        context.pushReplacement(AppRoutes.main);
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


                            final name = nameController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            if (name.isEmpty || email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill in all fields")),
                              );
                              return;
                            }

                            context.read<RegisterBloc>().add(FetchRegister(name: name, email: email, password: password));
                          },
                          child: Text("Register"),
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

