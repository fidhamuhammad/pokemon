import 'package:app/modules/authentication/login/login.dart';
import 'package:app/modules/authentication/otp/bloc/bloc/resend_otp_bloc.dart';
import 'package:app/modules/authentication/passwordreset/password_reset.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:pinput/pinput.dart';
import 'bloc/email_otp_bloc.dart';

class EmailOtp extends StatefulWidget {
  final String userEmail;
  final String otp;
  final bool isSignup;

  EmailOtp({
    required this.userEmail,
    required this.isSignup,
    this.otp = '',
  });

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  TextEditingController _textOtpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _otpBloc = EmailOtpBloc();
    final _resendOtpBloc = ResendOtpBloc();

    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 245, 245).withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 145, 170),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent.withOpacity(0.01),
      //   title: const Text('OTP verification'),
      //   centerTitle: true,
      // ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _otpBloc),
          BlocProvider(create: (context) => _resendOtpBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<EmailOtpBloc, EmailOtpState>(
              listener: (context, state) {
                if (state is VerificationSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                } else if (state is VerificationFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(child: Text('Invalid Otp')),
                    ),
                  );
                }
              },
            ),
            BlocListener<ResendOtpBloc, ResendOtpState>(
              listener: (context, state) {
                if (state is ResendSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Center(child: Text('Otp Sent')),
                    ),
                  );
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(20),
            child: Container(
              height: _deviceHeight,
              width: _deviceWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pokeforest02.png'),
                ),
              ),
              child: GlassContainer(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                borderRadius: BorderRadius.circular(25.0),
                borderWidth: 1.5,
                blur: 15.0,
                frostedOpacity: 0.06,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
                    Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
                  ],
                  begin: Alignment(-0.10, -1.0),
                  end: Alignment(0.00, 1.0),
                ),
                borderGradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.70),
                    Colors.white.withOpacity(0.0),
                    Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
                    Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
                  ],
                  begin: Alignment(0.35, -1.0),
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.30, 0.31, 1.0],
                ),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                elevation: 5.0,
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Text(
                        "Email Verification",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        child: const Text(
                          "We have sent an Otp in ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Text(
                          widget.userEmail,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Pinput(
                        controller: _textOtpController,
                        validator: (value) {
                          return null;
                        },
                        length: 5,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: Colors.green),
                          ),
                        ),
                        // onChanged: (value) {
                        //   print(value);
                        // },
                        // onCompleted: (pin) => debugPrint(pin),
                        enabled: true,
                      ),
                      if (widget.isSignup) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Text('Didn\'t receive an OTP?'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: BlocBuilder<ResendOtpBloc, ResendOtpState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  print('resend clicked');
                                  context.read<ResendOtpBloc>().add(
                                        ResendOtp(
                                          mail: widget.userEmail,
                                        ),
                                      );
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Resend OTP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      hSpace(60),
                      SizedBox(
                        width: 100,
                        child: BlocBuilder<EmailOtpBloc, EmailOtpState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: widget.isSignup
                                  ? () {
                                      context.read<EmailOtpBloc>().add(
                                            SubmitOpt(
                                              email: widget.userEmail,
                                              otp: _textOtpController.text,
                                            ),
                                          );
                                    }
                                  : () {
                                      if (_textOtpController.text == widget.otp) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PasswordResetScreen(
                                              email: widget.userEmail,
                                            ),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Center(
                                                child: Text('Invalid Otp')),
                                          ),
                                        );
                                      }
                                    },
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.lightBlue[300],
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glass_kit/glass_kit.dart';
// import 'package:pinput/pinput.dart';
// import 'package:app/modules/authentication/login/login.dart';
// import 'package:app/modules/authentication/otp/bloc/bloc/resend_otp_bloc.dart';
// import 'package:app/modules/authentication/otp/bloc/email_otp_bloc.dart';
// import 'package:app/modules/authentication/passwordreset/password_reset.dart';
// import 'package:app/shared/utils/spacer.dart';

// class EmailOtp extends StatelessWidget {
//   final String userEmail;
//   final String otp;
//   final bool isSignup;

//   EmailOtp({
//     required this.userEmail,
//     required this.isSignup,
//     this.otp = '',
//   });

//   @override
//   Widget build(BuildContext context) {
//     final _otpBloc = EmailOtpBloc();
//     final _resendOtpBloc = ResendOtpBloc();
//     TextEditingController _textOtpController = TextEditingController();

//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 60,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Colors.black,
//       ),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 244, 245, 245).withOpacity(0.08),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.transparent),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 90, 145, 170),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent.withOpacity(0.01),
//         title: const Text('OTP verification'),
//         centerTitle: true,
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => _otpBloc),
//           BlocProvider(create: (context) => _resendOtpBloc),
//         ],
//         child: MultiBlocListener(
//           listeners: [
//             BlocListener<EmailOtpBloc, EmailOtpState>(
//               listener: (context, state) {
//                 if (state is VerificationSuccess) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginScreen(),
//                     ),
//                   );
//                 } else if (state is VerificationFailed) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.red,
//                       content: Center(child: Text('Invalid Otp')),
//                     ),
//                   );
//                 }
//               },
//             ),
//             BlocListener<ResendOtpBloc, ResendOtpState>(
//               listener: (context, state) {
//                 if (state is ResendSuccess) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.green,
//                       content: Center(child: Text('Otp Sent')),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: GlassContainer(
//               height: MediaQuery.of(context).size.height * 0.8,
//               width: MediaQuery.of(context).size.width,
//               borderRadius: BorderRadius.circular(25.0),
//               borderWidth: 1.5,
//               blur: 15.0,
//               frostedOpacity: 0.06,
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
//                   Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
//                 ],
//                 begin: Alignment(-0.10, -1.0),
//                 end: Alignment(0.00, 1.0),
//               ),
//               borderGradient: LinearGradient(
//                 colors: [
//                   Colors.white.withOpacity(0.70),
//                   Colors.white.withOpacity(0.0),
//                   Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
//                   Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
//                 ],
//                 begin: Alignment(0.35, -1.0),
//                 end: Alignment.bottomRight,
//                 stops: [0.0, 0.30, 0.31, 1.0],
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
//               elevation: 5.0,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 40),
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Email Verification",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 40),
//                       child: const Text(
//                         "We have sent an Otp in ",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 40),
//                       child: Text(
//                         userEmail,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     Pinput(
//                       controller: _textOtpController,
//                       length: 5,
//                       defaultPinTheme: defaultPinTheme,
//                       focusedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           border: Border.all(color: Colors.green),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         print(value);
//                       },
//                       onCompleted: (pin) => debugPrint(pin),
//                     ),
//                     isSignup
//                         ? Padding(
//                             padding: const EdgeInsets.only(top: 32.0),
//                             child: Text('Didn\'t receive an OTP?'),
//                           )
//                         : Text(''),
//                     isSignup
//                         ? Padding(
//                             padding: const EdgeInsets.only(top: 32.0),
//                             child: BlocBuilder<ResendOtpBloc, ResendOtpState>(
//                               builder: (context, state) {
//                                 return InkWell(
//                                   onTap: () {
//                                     print('resend clicked');
//                                     context.read<ResendOtpBloc>().add(
//                                           ResendOtp(
//                                             mail: userEmail,
//                                           ),
//                                         );
//                                   },
//                                   child: RichText(
//                                     text: TextSpan(
//                                       text: 'Resend OTP',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         decoration: TextDecoration.underline,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         : Text(''),
//                     hSpace(60),
//                     SizedBox(
//                       width: 100,
//                       child: BlocBuilder<EmailOtpBloc, EmailOtpState>(
//                         builder: (context, state) {
//                           return TextButton(
//                             onPressed: isSignup
//                                 ? () {
//                                     context.read<EmailOtpBloc>().add(
//                                           SubmitOpt(
//                                             email: userEmail,
//                                             otp: _textOtpController.text,
//                                           ),
//                                         );
//                                   }
//                                 : () {
//                                     if (_textOtpController.text == otp) {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               PasswordResetScreen(
//                                             email: userEmail,
//                                           ),
//                                         ),
//                                       );
//                                     } else {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           backgroundColor: Colors.red,
//                                           content: Center(
//                                               child: Text('Invalid Otp')),
//                                         ),
//                                       );
//                                     }
//                                   },
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.lightBlue[300],
//                               textStyle: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   ],
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
// import 'package:app/modules/authentication/otp/bloc/bloc/resend_otp_bloc.dart';
// import 'package:app/modules/authentication/otp/bloc/email_otp_bloc.dart';
// import 'package:app/modules/authentication/passwordreset/password_reset.dart';

// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glass_kit/glass_kit.dart';
// import 'package:pinput/pinput.dart';

// class EmailOtp extends StatelessWidget {
//   final String userEmail;
//   final String otp;
//   final bool isSignup;
//   EmailOtp({required this.userEmail, required this.isSignup, this.otp = ''});

//   @override
//   Widget build(BuildContext context) {
//     final _otpBloc = new EmailOtpBloc();
//     final _resendOtpBloc = new ResendOtpBloc();
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;
//     TextEditingController _textOtpController = TextEditingController();

//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 60,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Colors.black,
//       ),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 244, 245, 245).withOpacity(0.08),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.transparent),
//       ),
//     );
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 90, 145, 170),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent.withOpacity(0.01),
//         title: const Text('OTP verification'),
//         centerTitle: true,
//       ),
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => _otpBloc,
//             child: Container(),
//           ),
//           BlocProvider(
//             create: (context) => _resendOtpBloc,
//             child: Container(),
//           )
//         ],
//         child: MultiBlocListener(
//           listeners: [
//             BlocListener<EmailOtpBloc, EmailOtpState>(
//               listener: (context, state) {
//                 if (state is VerificationSuccess) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => LoginScreen(),
//                     ),
//                   );
//                 }
//                 if (state is VerificationFailed) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.red,
//                       content: Center(child: Text('Invalid Otp')),
//                     ),
//                   );
//                 }
//               },
//             ),
//             BlocListener<ResendOtpBloc, ResendOtpState>(
//               listener: (context, state) {
//                 if (state is ResendSuccess) {
//                   print('22222222222222222224$state');
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.green,
//                       content: Center(child: Text('Otp Sent')),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: GlassContainer(
//               height: _deviceHeight * 0.8,
//               width: _deviceWidth,
//               borderRadius: BorderRadius.circular(25.0),
//               borderWidth: 1.5,
//               blur: 15.0,
//               frostedOpacity: 0.06,
//               gradient: LinearGradient(
//                 colors: [
//                   // Colors.white.withOpacity(0.40),
//                   // Colors.white.withOpacity(0.06),
//                    Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
//                         Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
//                 ],
//                 begin: Alignment(-0.10, -1.0),
//                 end: Alignment(0.00, 1.0),
//               ),
//               borderGradient: LinearGradient(
//                 colors: [
//                   Colors.white.withOpacity(0.70),
//                   Colors.white.withOpacity(0.0),
//                   Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
//                   Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
//                 ],
//                 begin: Alignment(0.35, -1.0),
//                 end: Alignment.bottomRight,
//                 stops: [0.0, 0.30, 0.31, 1.0],
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
//               elevation: 5.0,
//               child: Container(
//                 margin: const EdgeInsets.only(top: 40),
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Email Verification",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 40),
//                       child: const Text(
//                         "We have sent an Otp in ",
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 40),
//                       child: Text(
//                         userEmail,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     Pinput(
//                       controller: _textOtpController,
//                       length: 5,
//                       defaultPinTheme: defaultPinTheme,
//                       focusedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           border: Border.all(color: Colors.green),
//                         ),
//                       ),
//                       onChanged: (value) => {
//                         print(value),
//                       },
//                       onCompleted: (pin) => debugPrint(pin),
//                     ),
//                     isSignup
//                         ? Padding(
//                             padding: const EdgeInsets.only(top: 32.0),
//                             child: Text('Didn\'t receive an OTP?'),
//                           )
//                         : Text(''),
//                     isSignup
//                         ? Padding(
//                             padding: const EdgeInsets.only(top: 32.0),
//                             child: BlocBuilder<ResendOtpBloc, ResendOtpState>(
//                               builder: (context, state) {
//                                 return InkWell(
//                                   onTap: () {
//                                     print('resend clik=cked');
//                                     context.read<ResendOtpBloc>().add(ResendOtp(
//                                           mail: userEmail,
//                                         ));
//                                   },
//                                   child: RichText(
//                                     text: TextSpan(
//                                       text: 'Resend OTP',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black,
//                                           fontSize: 18,
//                                           decoration: TextDecoration.underline),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         : Text(''),
//                     hSpace(60),
//                     SizedBox(
//                       width: 100,
//                       child: BlocBuilder<EmailOtpBloc, EmailOtpState>(
//                         builder: (context, state) {
//                           return TextButton(
//                             onPressed: isSignup
//                                 ? () {
//                                     context.read<EmailOtpBloc>().add(SubmitOpt(
//                                           email: userEmail,
//                                           otp: _textOtpController.text,
//                                         ));
//                                   }
//                                 : () {
//                                     if (_textOtpController.text == otp) {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               PasswordResetScreen(
//                                             email: userEmail,
//                                           ),
//                                         ),
//                                       );
//                                     } else {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         SnackBar(
//                                           backgroundColor: Colors.red,
//                                           content: Center(
//                                               child: Text('Invalid Otp')),
//                                         ),
//                                       );
//                                     }
//                                   },
//                             child: Text(
//                               'Submit',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.lightBlue[300],
//                               // Padding around the button text
//                               textStyle: TextStyle(
//                                 fontSize: 16, // Text size
//                                 fontWeight: FontWeight.bold, // Text font weight
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
