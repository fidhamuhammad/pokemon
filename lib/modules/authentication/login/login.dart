import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/modules/authentication/forget_password/forgot_password.dart';
import 'package:app/modules/authentication/otp/email_otp.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/modules/authentication/login/bloc/login_bloc.dart';
import 'package:app/modules/authentication/signup/signup.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textEmailController = TextEditingController();
  final _textPasswordController = TextEditingController();
  final _loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEmailController.dispose();
    _textPasswordController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 61, 165),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<AuthStatusProvider>().setLoggedIn(true);
            context.read<AuthStatusProvider>().setEmail(state.email);
            print(state);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage(isLoggedIn: true,)));
            // Show a success SnackBar
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: Colors.green,
            //     content: Text('Login successful!'),
            //   ),
            // );
      
            Fluttertoast.showToast(
              msg: "Login successful!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color.fromARGB(255, 196, 231, 197).withOpacity(0.05),
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (state is EmailNotVerified) {
            print('here');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmailOtp(
                  userEmail: state.email,
                  isSignup: true,
                ),
              ),
            );
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.withOpacity(0.08),
                content: Center(child: Text('Invalid username or password',
                style: GoogleFonts.lora(
                  textStyle: TextStyle(
                    color: Colors.redAccent
                  )
                ),
                )),
              ),
            );
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
                        // Color.fromARGB(255, 247, 32, 17),
                        // Color.fromARGB(255, 112, 243, 212),
                        // // Color.fromARGB(255, 245, 233, 56),
                        // Color.fromARGB(255, 158, 224, 42),
                        Color(0xff744ff9),
                        Color(0xff8369de),
                        Color(0xff8da0cb)
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
                          // Color.fromARGB(255, 247, 32, 17),
                          // Color.fromARGB(255, 245, 233, 56),
                          // Color.fromARGB(255, 158, 224, 42),
      
                          Color(0xff744ff9),
                          Color(0xff8369de),
                          Color(0xff8da0cb)
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
      
                          Color(0xff744ff9),
                          Color(0xff8369de),
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
              // Container(
              //   height: _deviceHeight,
              //   width: _deviceWidth,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/pokedexbg06.png'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Center(
                child: SingleChildScrollView(
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
                        children: [
                          hSpace(_deviceHeight * 0.25),
                           AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('Login!',
                              textStyle: TextStyle(
                                fontFamily: GoogleFonts.lora().fontFamily,
                                fontSize: 30,
                                color: Colors.yellow
                              )
                              ),
                            ],
                            isRepeatingAnimation: true,
                            // totalRepeatCount: 5,
                          ),
                          hSpace(10),
                          PokeTextFormField(
                            controller: _textEmailController,
                            labelText: 'username',
                            prefixIcon: Icons.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          hSpace(20),
                          PokeTextFormField(
                            controller: _textPasswordController,
                            labelText: 'password',
                            prefixIcon: Icons.password_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          hSpace(30),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return PrimaryButton(
                                label: 'Login',
                                onPressed: () {

                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    final email = _textEmailController.text;
                                    final password =
                                        _textPasswordController.text;
                              
                                    // Dispatch the UserLogin event with the entered credentials
                                   BlocProvider.of<LoginBloc>(context).add(UserLogin(
                                        email: email, password: password));
                                  }
                                },
                                width: 100,
                              );
                            },
                          ),
                              
                          // BlocBuilder<LoginBloc, LoginState>(
                          //   builder: (context, state) {
                          //     return PrimaryButton(
                          //       label: 'Login',
                          //       onPressed: () {
                          //         if (_formKey.currentState?.validate() ?? false) {
                          //           final email = _textEmailController.text;
                          //           final password = _textPasswordController.text;
                              
                          //           // Check your login logic here
                          //           // context.read<LoginBloc>().add(UserLogin(email: email, password: password));
                              
                          //           // For now, simulate a successful login
                          //           context.read<LoginBloc>().add(LoginSuccess());
                          //         }
                          //       },
                          //       width: 100,
                          //     );
                          //   },
                          // ),
                          hSpace(20),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen())),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '',
                                  ),
                                  TextSpan(
                                    text: 'Signup! ',
                                    style: TextStyle(
                                      color: Colors.lime,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          hSpace(5),
                          MyTextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassword()));
                            },
                            label: 'forgot password?',
                            width: 300,
                          ),
                        ],
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











// import 'package:app/modules/authentication/forget_password/forgot_password.dart';
// import 'package:app/modules/authentication/login/bloc/login_bloc.dart';
// // import 'package:app/modules/authentication/otp/email_otp.dart';
// import 'package:app/modules/authentication/signup/signup.dart';
// import 'package:app/modules/home/home_page.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/ui/widgets/textButton.dart';
// import 'package:app/shared/ui/widgets/textformfield.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;
//     TextEditingController _textEmailController = TextEditingController();
//     TextEditingController _textPasswordController = TextEditingController();
//     final _loginBloc = new LoginBloc();
//     final _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body:  BlocProvider(
//         create: (context) => _loginBloc,
//         child: BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             // TODO: implement listener
//             if (state is LoginSuccess) {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
//             }
//             if (state is EmailNotVerified) {
//               print('here');
//               // Navigator.push(context, MaterialPageRoute(builder: (context) => EmailOtp(
//               //   userEmail: state.email,
//               //   isSignup: true,
//               // ),));
              
//             }
//             if (state is LoginFailed) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   backgroundColor: Colors.red,
//                 content: Center(child: Text('invalid username or password'),)));
//             }
//           },
//           builder: (context, state) {
//             return SingleChildScrollView(
//         child: Stack(
//             children: [
//               Container(
//             height: _deviceHeight,
//             width: _deviceWidth,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/pokedexbg06.png'),
//                   fit: BoxFit.cover),
//             ),
//             child: Center(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.2),
//                 ),
                
//                 child: Form(
//                   // key: _formKey,
//                   child: Column(
//                     children: [
//                       hSpace(_deviceHeight * 0.35),
//                       PokeTextFormField(
//                         controller: _textEmailController,
//                         labelText: 'username',
//                         prefixIcon: Icons.person,
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return 'Please enter email';
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                       hSpace(20),
//                       PokeTextFormField(
//                         controller: _textPasswordController,
//                         labelText: 'password',
//                         prefixIcon: Icons.password_outlined,
//                         // validator: (value) {
//                         //   if (value!.isEmpty) {
//                         //     return 'Please enter your password';
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                       hSpace(30),
//                       BlocBuilder<LoginBloc, LoginState>(
//                         builder: (context, state) {
//                           return PrimaryButton(
//                             label: 'Login', 
//                             onPressed: () {
//                               context.read<LoginBloc>().add(
//                                 UserLogin(
//                                   email: _textEmailController.text, 
//                                   password:  _textPasswordController.text,
//                                   ),
//                               );
//                             }, 
//                             width: 100,
//                             );
//                         },
//                         ),
//                       // PrimaryButton(
//                       //   label: 'Login', 
//                       //   onPressed: () {
//                       //      if (_formKey.currentState!.validate()) {
//                       //       _textEmailController.text;
//                       //       _textPasswordController.text;
//                       //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
//                       //      }
//                       //   }, 
//                       //   width: 100,
//                       //   ),
//                         hSpace(20),
//                         // MyTextButton(
//                         //   onPressed: () {
                            
//                         //   }, 
//                         //   label: 'SignUp!',
//                         //    width: 200
//                         //    ),
//                         Padding(
//                             padding: const EdgeInsets.only(top: 20.0),
//                             child: InkWell(
//                               onTap: () => {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SignUpScreen(),
//                                   ),
//                                 )
//                               },
//                               child: RichText(
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                     text: '',
//                                   ),
//                                   TextSpan(
//                                       text: 'Signup! ',
//                                       // style: TextStyle(color: Colors.lightBlue)
//                                       style: GoogleFonts.lora(
//                                         color: Colors.lime,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.normal
//                                       )
//                                       ),
//                                 ]),
//                               ),
//                             ),
//                           ),
//                         hSpace(5),
//                         MyTextButton(
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
//                           }, 
//                           label: 'forgot password?',
//                            width: 300,
//                            )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
          
//             ],
//         ),
//       );
//           },
//         ),
//         ),
//     );
//   }
// }
 








// import 'package:app/modules/authentication/forget_password/forgot_password.dart';
// import 'package:app/modules/authentication/login/bloc/login_bloc.dart';
// import 'package:app/modules/authentication/otp/email_otp.dart';
// import 'package:app/modules/authentication/signup/signup.dart';
// import 'package:app/modules/home/home_page.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/ui/widgets/textButton.dart';
// import 'package:app/shared/ui/widgets/textformfield.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;
//     TextEditingController _textEmailController = TextEditingController();
//     TextEditingController _textPasswordController = TextEditingController();
//     final _loginBloc = new LoginBloc();
//     final _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body:  BlocProvider(
//         create: (context) => _loginBloc,
//         child: BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             // TODO: implement listener
//             if (state is LoginSuccess) {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
//             }
//             if (state is EmailNotVerified) {
//               print('here');
//               Navigator.push(context, MaterialPageRoute(builder: (context) => EmailOtp(
//                 userEmail: state.email,
//                 isSignup: true,
//               ),));
              
//             }
//             if (state is LoginFailed) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   backgroundColor: Colors.red,
//                 content: Center(child: Text('invalid username or password'),)));
//             }
//           },
//           builder: (context, state) {
//             return SingleChildScrollView(
//         child: Container(
//           height: _deviceHeight,
//           width: _deviceWidth,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/pokebg.png'),
//                 fit: BoxFit.cover),
//           ),
//           child: Center(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.2),
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     hSpace(_deviceHeight * 0.30),
//                     PokeTextFormField(
//                       controller: _textEmailController,
//                       labelText: 'username',
//                       prefixIcon: Icons.person,
//                       // validator: (value) {
//                       //   if (value!.isEmpty) {
//                       //     return 'Please enter email';
//                       //   }
//                       //   return null;
//                       // },
//                     ),
//                     hSpace(20),
//                     PokeTextFormField(
//                       controller: _textPasswordController,
//                       labelText: 'password',
//                       prefixIcon: Icons.person,
//                       // validator: (value) {
//                       //   if (value!.isEmpty) {
//                       //     return 'Please enter your password';
//                       //   }
//                       //   return null;
//                       // },
//                     ),
//                     hSpace(30),
//                     BlocBuilder<LoginBloc, LoginState>(
//                       builder: (context, state) {
//                         return PrimaryButton(
//                           label: 'Login', 
//                           onPressed: () {
//                             context.read<LoginBloc>().add(
//                               UserLogin(
//                                 email: _textEmailController.text, 
//                                 password:  _textPasswordController.text,
//                                 ),
//                             );
//                           }, 
//                           width: 100,
//                           );
//                       },
//                       ),
//                     // PrimaryButton(
//                     //   label: 'Login', 
//                     //   onPressed: () {
//                     //      if (_formKey.currentState!.validate()) {
//                     //       _textEmailController.text;
//                     //       _textPasswordController.text;
//                     //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
//                     //      }
//                     //   }, 
//                     //   width: 100,
//                     //   ),
//                       hSpace(30),
//                       Padding(
//                           padding: const EdgeInsets.only(top: 20.0),
//                           child: InkWell(
//                             onTap: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignUpScreen(),
//                                 ),
//                               )
//                             },
//                             child: RichText(
//                               text: TextSpan(children: [
//                                 TextSpan(
//                                   text: 'New to pokedex?',
//                                 ),
//                                 TextSpan(
//                                     text: 'Signup Now! ',
//                                     style: TextStyle(color: Colors.blue)),
//                               ]),
//                             ),
//                           ),
//                         ),
//                       hSpace(30),
//                       MyTextButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
//                         }, 
//                         label: 'forget password?',
//                          width: 300,
//                          )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//           },
//         ),
//         ),
//     );
//   }
// }
 


