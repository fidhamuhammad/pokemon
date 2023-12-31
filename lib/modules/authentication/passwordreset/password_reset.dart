import 'package:app/modules/authentication/login/bloc/login_bloc.dart';
import 'package:app/modules/authentication/passwordreset/bloc/password_reset_bloc.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../login/login.dart';

class PasswordResetScreen extends StatelessWidget {
  PasswordResetScreen({required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    TextEditingController _textPasswordController = TextEditingController();
    TextEditingController _textConfirmPasswordController =
        TextEditingController();
    final _resetBloc = new PasswordResetBloc();
  final _formKey = GlobalKey<FormState>();


    return Scaffold(
      body: BlocProvider(
        create: (context) => _resetBloc,
        child: BlocConsumer<PasswordResetBloc, PasswordResetState>(
          listener: (context, state) {
            if (state is PasswordChanged) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(child: Text('Password reset succesful'))));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
            if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content:
                      Center(child: Text('Username or password incorrect')),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: _deviceHeight,
                width: _deviceWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/pokedexbg05.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: GlassmorphicContainer(
                    width: _deviceWidth * 0.8,
                    height: _deviceHeight * 0.5,
                    borderRadius: 10,
                    blur: 5,
                    alignment: Alignment.center,
                    border: 0.1,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
                        Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 62, 122, 135).withOpacity(0.5),
                        Color.fromARGB(255, 100, 158, 164).withOpacity(0.3),
                      ],
                    ),
                    child: Container(
                      
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            hSpace(_deviceHeight * 0.01),
                            Heading(
                              text: 'Reset password',
                              size: 25,
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            hSpace(20),
                            PokeTextFormField(
                              labelText: 'New password',
                              prefixIcon: Icons.verified,
                              controller: _textPasswordController,
                              obscureText: true, // Passwords should be obscured
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new password';
                                }
                                // Add more password validation logic here if needed
                                return null;
                              },
                            ),
                            hSpace(20),
                            PokeTextFormField(
                              labelText: 'Confirm password',
                              prefixIcon: Icons.verified_outlined,
                              controller: _textConfirmPasswordController,
                              obscureText: true, // Passwords should be obscured
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value !=
                                    _textPasswordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            hSpace(20),
                            BlocBuilder<PasswordResetBloc, PasswordResetState>(
                              builder: (context, state) {
                                return PrimaryButton(
                                  label: 'Reset',
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<PasswordResetBloc>()
                                          .add(SubmitPasswordEvent(
                                            email: email,
                                            newPassword:
                                                _textPasswordController.text,
                                          ));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    }
                                  },
                                  width: 100,
                                );                             
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
