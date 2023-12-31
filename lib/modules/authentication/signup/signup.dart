import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/modules/authentication/login/login.dart';
import 'package:app/modules/authentication/otp/email_otp.dart';
import 'package:app/modules/authentication/signup/bloc/signup_bloc.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/spacer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _textNameController = TextEditingController();
  TextEditingController _textEmailController = TextEditingController();
  TextEditingController _textMobileController = TextEditingController();
  TextEditingController _textPasswordController = TextEditingController();
  TextEditingController _textConfirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _signupBloc = SignupBloc();

  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 7, 35, 58),
      backgroundColor: Color.fromARGB(255, 8, 8, 142),
      // backgroundColor: const Color.fromARGB(255, 248, 221, 123),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            // context.read<AuthStatusProvider>().setLoggedIn(true);
            // context.read<AuthStatusProvider>().setEmail(state.email );
      
      
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmailOtp(
                  userEmail: state.email,
                  isSignup: true,
                ),
              ),
            );
            setState(() {
              isSuccess = true;
            });
          } else if (state is EmailExist) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.withOpacity(0.05),
                content: Center(
                  child: Text(
                    'Email Exists',
                    style: GoogleFonts.lora(color: Colors.redAccent),
                  ),
                ),
              ),
            );
          } else {
            setState(() {
              isSuccess = false;
            });
          }
        },
        child: Stack(
          children: [
            Positioned(
                top: 130,
                left: 220,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 79, 102, 249),
                        Color.fromARGB(255, 105, 109, 222),
                        Color(0xff8da0cb)
                        // Color(0xff744ff9),
                        // Color(0xff8369de),
                        // Color(0xff8da0cb)
                      ])),
                )),
            Positioned(
                bottom: 250,
                right: 150,
                child: Transform.rotate(
                  angle: 8,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 79, 102, 249),
                          Color.fromARGB(255, 105, 109, 222),
                          Color(0xff8da0cb)
      
                          // Color(0xff744ff9),
                          // Color(0xff8369de),
                          // Color(0xff8da0cb)
                        ])),
                  ),
                )),
            Positioned(
                top: 600,
                left: 250,
                child: Transform.rotate(
                  angle: 8,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          // Color.fromARGB(255, 247, 32, 17),
                          // Color.fromARGB(255, 245, 233, 56),
                          // Color.fromARGB(255, 158, 224, 42),
      
                          Color.fromARGB(255, 79, 102, 249),
                          Color.fromARGB(255, 105, 109, 222),
                          Color(0xff8da0cb)
                        ])),
                  ),
                )),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black
                    .withOpacity(0.08), // Adjust the opacity as needed
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: _deviceHeight,
                width: _deviceWidth,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage('assets/images/pokesignbg.png'),
                    // ),
                    // gradient: LinearGradient(
                    //     colors: [
                    //       // Color(0xFFd415c),
                    //       // Color(0xFFd415c),
                    //       Color(0xFF08295e),
                    //       Color(0xFFd415c),
      
                    //       // Color(0xFF1a4e75),
                    //       // Color(0xFF1c496b),
                    //     ],
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomLeft,
                    //     stops: [0.2, 0.8])
                    ),
                child: Center(
                  child: Container(
                    height: _deviceHeight,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          hSpace(_deviceWidth * 0.05),
                          // Heading(
                          //   text: 'POKEMON',
                          //   size: 50,
                          //   weight: FontWeight.bold,
                          //    color: Colors.yellow
                          //    ),
                          AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('SignUp!',
                                  textStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.lora().fontFamily,
                                      fontSize: 30,
                                      color: Colors.yellow)),
                            ],
                            isRepeatingAnimation: true,
                            // totalRepeatCount: 5,
                          ),
      
                          hSpace(30),
                          PokeTextFormField(
                            controller: _textNameController,
                            labelText: 'Name',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your name';
                              }
                              // Regular expression to allow only alphabets and spaces.
                              RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
      
                              if (!nameRegExp.hasMatch(value)) {
                                return 'Please enter a valid name (only alphabets and spaces)';
                              }
                              return null;
                            },
                          ),
                          hSpace(20),
                          PokeTextFormField(
                            controller: _textMobileController,
                            labelText: 'Mobile',
                            prefixIcon: Icons.phone_android,
      
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
      
                              // Define a regular expression for a typical phone number pattern.
                              // This is a basic example, and you might need to adjust it based on your requirements.
                              RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');
      
                              if (!phoneRegExp.hasMatch(value)) {
                                return 'Please enter a valid 10-digit phone number';
                              }
      
                              return null;
                            },
      
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter phone number';
                            //   }
      
                            //   // Define a regular expression for a phone number with country code.
                            //   // This example assumes a country code of 1 (United States) and a total length of 11 digits.
                            //   RegExp phoneRegExp = RegExp(r'^1[0-9]{10}$');
      
                            //   if (!phoneRegExp.hasMatch(value)) {
                            //     return 'Please enter a valid phone number with country code';
                            //   }
      
                            //   return null;
                            // },
      
                            // validator: (value) {
                            //   if (value == '' || value == null) {
                            //     return 'Please enter phone number';
                            //   }
                            //   return null;
                            // },
                          ),
                          hSpace(20),
                          PokeTextFormField(
                            controller: _textEmailController,
                            labelText: 'Email',
                            prefixIcon: Icons.email,
                            // validator: (value) {
                            //   if (value == '' || value == null) {
                            //     return 'Please enter your email';
                            //   }
                            //   return null;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
      
                              // Regular expression for a simple email validation.
                              RegExp emailRegExp = RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                              );
      
                              if (!emailRegExp.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
      
                              return null;
                            },
                          ),
                          hSpace(20),
                          PokeTextFormField(
                            controller: _textPasswordController,
                            labelText: 'Password',
                            prefixIcon: Icons.password,
                            // validator: (value) {
                            //   if (value == '' || value == null) {
                            //     return 'Please enter your password';
                            //   }
                            //   return null;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
      
                              // Regular expression for a password with at least 8 characters,
                              // containing at least one uppercase letter, one lowercase letter,
                              // and one digit.
                              RegExp passwordRegExp = RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
                              );
      
                              if (!passwordRegExp.hasMatch(value)) {
                                return 'Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one digit.';
                              }
      
                              return null;
                            },
                          ),
                          hSpace(20),
                          PokeTextFormField(
                            controller: _textConfirmPasswordController,
                            labelText: 'Confirm Password',
                            prefixIcon: Icons.verified,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
      
                              // Assuming _textPasswordController.text contains the original password
                              String originalPassword =
                                  _textPasswordController.text;
      
                              if (value != originalPassword) {
                                return 'Passwords are not match';
                              }
      
                              return null;
                            },
      
                            // validator: (value) {
                            //   if (value == '' || value == null) {
                            //     return 'Please confirm your password';
                            //   }
                            //   return null;
                            // },
                          ),
                          hSpace(20),
                          BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                              return PrimaryButton(
                                label: 'Sign Up',
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    if (_textPasswordController.text ==
                                        _textConfirmPasswordController.text) {
                                      context.read<SignupBloc>().add(
                                            AddUserEvent(
                                              userName:
                                                  _textNameController.text,
                                              email:
                                                  _textEmailController.text,
                                              mobile: num.parse(
                                                  _textMobileController.text),
                                              password:
                                                  _textPasswordController
                                                      .text,
                                            ),
                                          );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.white10
                                              .withOpacity(0.05),
                                          content: Center(
                                            child: AnimatedOpacity(
                                              opacity: 1.0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              child: Text(
                                                'Passwords do not match',
                                              ),
                                            ),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          action: SnackBarAction(
                                            label: 'Close',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                width: 100,
                              );
                            },
                          ),
                          hSpace(5),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                )
                              },
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: GoogleFonts.lora(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Login',
                                    style: GoogleFonts.lora(
                                      color: Colors.yellow,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:app/modules/authentication/login/login.dart';
// import 'package:app/modules/authentication/otp/email_otp.dart';
// import 'package:app/modules/authentication/signup/bloc/signup_bloc.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/ui/widgets/textformfield.dart';
// import 'package:app/shared/utils/spacer.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _textNameController = TextEditingController();
//   TextEditingController _textEmailController = TextEditingController();
//   TextEditingController _textMobileController = TextEditingController();
//   TextEditingController _textPasswordController = TextEditingController();
//   TextEditingController _textConfirmPasswordController =
//       TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _signupBloc = new SignupBloc();

//   bool isSuccess = false;

//   @override
//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => _signupBloc,
//         child: BlocListener<SignupBloc, SignupState>(
//           listener: (context, state) {
//             if (state is SignupSuccess) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EmailOtp(
//                     userEmail: state.email,
//                     isSignup: true,
//                   ),
//                 ),
//               );
//               setState(() {
//                 isSuccess = true;
//               });
//             } else if (state is EmailExist) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   backgroundColor: Colors.red.withOpacity(0.05),
//                   content: Center(child: Text('Email Exists',
//                   style: GoogleFonts.lora(
//                     color: Colors.redAccent
//                   ),
//                   )),
//                 ),
//               );
//             } else {
//               setState(() {
//                 isSuccess = false;
//               });
//             }
//           },
//           child: SingleChildScrollView(
//             child: Container(
//               height: _deviceHeight,
//               width: _deviceWidth,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('assets/images/pokeforest02.png'),
//                 ),
//               ),
//               child: Center(
//                 child: Container(
//                   height: _deviceHeight,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.1),
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         hSpace(_deviceWidth * 0.15),
//                         PokeTextFormField(
//                           controller: _textNameController,
//                           labelText: 'name',
//                           prefixIcon: Icons.person,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textMobileController,
//                           labelText: 'mobile',
//                           prefixIcon: Icons.phone_android,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter phone number';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textEmailController,
//                           labelText: 'email',
//                           prefixIcon: Icons.email,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your email';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textPasswordController,
//                           labelText: 'password',
//                           prefixIcon: Icons.password,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textConfirmPasswordController,
//                           labelText: 'confirm password',
//                           prefixIcon: Icons.verified,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please confirm your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         BlocBuilder<SignupBloc, SignupState>(
//                           builder: (context, state) {
//                             return PrimaryButton(
//                               label: 'SignUp',
//                               onPressed: () {
//                                 if (_formKey.currentState?.validate() ??
//                                     false) {
//                                   if (_textPasswordController.text ==
//                                       _textConfirmPasswordController.text) {
//                                     // Passwords match, proceed with signup
//                                     context.read<SignupBloc>().add(
//                                           AddUserEvent(
//                                             userName: _textNameController.text,
//                                             email: _textEmailController.text,
//                                             mobile: num.parse(
//                                                 _textMobileController.text),
//                                             password:
//                                                 _textPasswordController.text,
//                                           ),
//                                         );
//                                   } else {
//                                     // Passwords do not match, show an error
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(
//                                       SnackBar(
//                                         backgroundColor:
//                                             Colors.white10.withOpacity(0.05),
//                                         content: Center(
//                                           child: AnimatedOpacity(
//                                             opacity: 1.0,
//                                             duration:
//                                                 Duration(milliseconds: 500),
//                                             child:
//                                                 Text('Passwords do not match'),
//                                           ),
//                                         ),
//                                         behavior: SnackBarBehavior.floating,
//                                         action: SnackBarAction(
//                                           label: 'Close',
//                                           onPressed: () {
//                                             ScaffoldMessenger.of(context)
//                                                 .hideCurrentSnackBar();
//                                           },
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                 }
//                               },
//                               width: 100,
//                             );
//                           },
//                         ),
//                         hSpace(5),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0),
//                           child: InkWell(
//                             onTap: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ),
//                               )
//                             },
//                             child: RichText(
//                               text: TextSpan(children: [
//                                 TextSpan(
//                                   text: 'Already have an account?',
//                                   style: GoogleFonts.lora(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.normal,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: 'Login',
//                                   style: GoogleFonts.lora(
//                                     color: Colors.yellow,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ]),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:app/modules/authentication/login/login.dart';
// import 'package:app/modules/authentication/otp/email_otp.dart';
// import 'package:app/modules/authentication/signup/bloc/signup_bloc.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/ui/widgets/textButton.dart';
// import 'package:app/shared/ui/widgets/textformfield.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _textNameController = TextEditingController();
//   TextEditingController _textEmailController = TextEditingController();
//   TextEditingController _textMobileController = TextEditingController();
//   TextEditingController _textPasswordController = TextEditingController();
//   TextEditingController _textConfirmPasswordController =
//       TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _signupBloc = new SignupBloc();

//   @override
//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => _signupBloc,
//         child: BlocListener<SignupBloc, SignupState>(
//           listener: (context, state) {
//             if (state is SignupSuccess) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EmailOtp(
//                     userEmail: state.email,
//                     isSignup: true,
//                   ),
//                 ),
//               );

//               if (state is EmailExist) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: Colors.red,
//                     content: Center(child: Text('Email Exists')),
//                   ),
//                 );
//               }
//             }
//           },
//           child: SingleChildScrollView(
//             child: Container(
//               height: _deviceHeight,
//               width: _deviceWidth,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/images/pokeforest02.png')),
//               ),
//               child: Center(
//                 child: Container(
//                   height: _deviceHeight,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.1),
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         hSpace(_deviceWidth * 0.15),
//                         PokeTextFormField(
//                           controller: _textNameController,
//                           labelText: 'name',
//                           prefixIcon: Icons.person,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your name';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textMobileController,
//                           labelText: 'mobile',
//                           prefixIcon: Icons.phone_android,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter phone number';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textEmailController,
//                           labelText: 'email',
//                           prefixIcon: Icons.email,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your email';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textPasswordController,
//                           labelText: 'password',
//                           prefixIcon: Icons.password,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         PokeTextFormField(
//                           controller: _textConfirmPasswordController,
//                           labelText: 'confirm password',
//                           prefixIcon: Icons.verified,
//                           validator: (value) {
//                             if (value == '' || value == null) {
//                               return 'Please confirm your password';
//                             }
//                             return null;
//                           },
//                         ),
//                         hSpace(20),
//                         BlocBuilder<SignupBloc, SignupState>(
//                           builder: (context, state) {
//                             return PrimaryButton(
//                               label: 'SignUp',
//                               onPressed: () {
//                                 if (_formKey.currentState?.validate() ??
//                                     false) {
//                                   if (_textPasswordController.text ==
//                                       _textConfirmPasswordController.text) {
//                                     // Passwords match, proceed with signup
//                                     context.read<SignupBloc>().add(
//                                           AddUserEvent(
//                                             userName: _textNameController.text,
//                                             email: _textEmailController.text,
//                                             mobile: num.parse(
//                                                 _textMobileController.text),
//                                             password:
//                                                 _textPasswordController.text,
//                                           ),
//                                         );
//                                   } else {
//                                     // Passwords do not match, show an error
//                                     // ScaffoldMessenger.of(context).showSnackBar(
//                                     //   SnackBar(
//                                     //     backgroundColor: Colors.red,
//                                     //     content: Center(
//                                     //         child:
//                                     //             Text('Passwords are not match')),
//                                     //   ),
//                                     // );
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         backgroundColor: Colors.white10.withOpacity(0.05),
//                                         content: Center(
//                                           child: AnimatedOpacity(
//                                             opacity: 1.0,
//                                             duration:
//                                                 Duration(milliseconds: 500),
//                                             child:
//                                                 Text('Passwords do not match'),
//                                           ),
//                                         ),
//                                         behavior: SnackBarBehavior.floating,
//                                         action: SnackBarAction(
//                                           label: 'Close',
//                                           onPressed: () {
//                                             ScaffoldMessenger.of(context)
//                                                 .hideCurrentSnackBar();
//                                           },
//                                         ),
//                                       ),
//                                     );
//                                   }
//                                 }
//                               },
//                               width: 100,
//                             );

//                             //  PrimaryButton(
//                             //   label: 'SignUp',
//                             //   onPressed: () {
//                             //     context.read<SignupBloc>().add(
//                             //       AddUserEvent(
//                             //         userName: _textNameController.text,
//                             //         email: _textEmailController.text,
//                             //         mobile: num.parse(_textMobileController.text),
//                             //         password: _textPasswordController.text,
//                             //         ),
//                             //     );
//                             //   },
//                             //   width: 100,
//                             //   );
//                           },
//                         ),
//                         hSpace(5),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20.0),
//                           child: InkWell(
//                             onTap: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ),
//                               )
//                             },
//                             child: RichText(
//                               text: TextSpan(children: [
//                                 TextSpan(
//                                     text: 'Already have an account?',
//                                     style: GoogleFonts.lora(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.normal)),
//                                 TextSpan(
//                                     text: 'Login',
//                                     style:
//                                         //  TextStyle(color: Colors.lightBlue)
//                                         GoogleFonts.lora(
//                                             color: Colors.yellow,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold)),
//                               ]),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
