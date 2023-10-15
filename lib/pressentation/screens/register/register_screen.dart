import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/business_logic/login_cubit/cubit.dart';
import 'package:social_app/pressentation/screens/login/login_screen.dart';


import '../../../business_logic/login_cubit/states.dart';
import '../../widget/default_button.dart';
import '../../widget/default_form_field.dart';
import '../../widget/default_text_button.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  
  Widget build(BuildContext context) {
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
                        Text('REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: Colors.black)),
                        Text('register now to browse our hot offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey)),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                            },
                            prefix: Icons.person,
                            label: 'User Name'),
                        const SizedBox(
                          height: 19,
                        ),
                        DefaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email address';
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
                          height: 19,
                        ),
                        DefaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone';
                              }
                            },
                            prefix: Icons.phone,
                            label: 'Phone Number'),
                        const SizedBox(
                          height: 40,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) => DefaultButton(
                            function: () {
                              // if (formKey.currentState!.validate()) {
                              //   AppCubit.get(context).userLogin(
                              //       email: emailController.text,
                              //       password: passwordController.text);
                              // }
                            },
                            text: 'register',
                            isUpperCase: true,
                            width: 400,
                            background: Colors.blue,
                          ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        ),

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
