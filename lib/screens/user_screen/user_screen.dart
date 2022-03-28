
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_bloc/user_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => UserScreenState();

}

class UserScreenState extends State<UserScreen>{

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserDone) {
            // _openUsedLogin();
          }
        },
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        hintText: 'Password', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return const CircularProgressIndicator();
                      }
                      return OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<UserBloc>().add(
                                  CreateAccountEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                            }
                          },
                          child: const Text('Create User'));
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserError) {
                        return Text(state.error);
                      }
                      return const SizedBox.shrink();
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