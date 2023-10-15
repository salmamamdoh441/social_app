import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/business_logic/login_cubit/cubit.dart';

import '../../../business_logic/login_cubit/states.dart';
import '../../widget/default_button.dart';
import '../../widget/default_form_field.dart';
import '../../widget/default_text_button.dart';
import '../register/register_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();

    return  BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},


        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: Colors.black)),
                        Text('login now to browse our hot offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey)),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter  email address';
                              }
                            },
                            prefix: Icons.email,
                            label: 'Email Address'),
                        const SizedBox(
                          height: 19,
                        ),
                        DefaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password is too short';
                              }
                            },
                            prefix: Icons.lock,
                            suffixIcon: const Icon(Icons.remove_red_eye),
                            label: 'Password'),
                        const SizedBox(
                          height: 40,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) => DefaultButton(
                            function: () {
                              // if (formKey.currentState!.validate()) {
                              //   LoginCubit.get(context).userLogin(
                              //       email: emailController.text,
                              //       password: passwordController.text);
                              // }
                            },
                            text: 'login',
                            isUpperCase: true,
                            width: 400,
                            background: Colors.blue,
                          ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            DefaultTextButton(
                                text: 'Register Now',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             RegisterScreen(),
                                      ));
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
