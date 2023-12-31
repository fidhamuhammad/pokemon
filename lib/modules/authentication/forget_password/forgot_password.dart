import 'package:app/modules/authentication/otp/email_otp.dart';
import 'package:app/modules/authentication/passwordreset/password_reset.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:app/shared/utils/textsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/forgot_password_bloc.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key});

  final _bloc = new ForgotPasswordBloc();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    TextEditingController _textEmailController = TextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc,
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordstate>(
          listener: (context, state) {
            if (state is OtpSentSuccesfully) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Center(child: Text('Otp has sented to your email')),
                ),
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailOtp(
                      userEmail: state.email,
                      isSignup: false,
                      otp: state.otp,
                    ),
                  ));
            }
            if (state is EmailNotFound) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                      child: Text(
                    'Email not found',
                    style: GoogleFonts.lora(
                        textStyle: TextStyle(color: Colors.amberAccent)),
                  )),
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
                  // color: Color.fromARGB(255, 12, 35, 74)
                  image: DecorationImage(
                    image: AssetImage('assets/images/pokedexbg05.png'),
                    fit: BoxFit.cover,
                  ),
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
                        // Colors.white.withOpacity(0.2),
                        // Colors.white.withOpacity(0.1)
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 139, 197, 209).withOpacity(0.2),
                        Color.fromARGB(255, 82, 159, 178).withOpacity(0.1),
                        // Color.fromARGB(255, 62, 122, 135).withOpacity(0.5),
                        // Color.fromARGB(255, 100, 158, 164).withOpacity(0.3),
                        // Colors.white.withOpacity(0.2),
                        // Colors.white.withOpacity(0.1)
                      ],
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.05),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            hSpace(_deviceHeight * 0.06),
                            Heading(
                              text: 'Forget password?',
                              size: TextSizes.subHeading,
                              weight: FontWeight.bold,
                              color: Color.fromARGB(255, 244, 240, 240),
                            ),
                            hSpace(20),
                            PokeTextFormField(
                              labelText: 'Enter Your Email',
                              prefixIcon: Icons.email_outlined,
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
                            BlocBuilder<ForgotPasswordBloc,
                                ForgotPasswordstate>(
                              builder: (context, state) {
                                return PrimaryButton(
                                  label: 'Submit',
                                  width: 100,
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context.read<ForgotPasswordBloc>().add(
                                            SubmitEmail(
                                              email: _textEmailController.text,
                                            ),
                                          );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PasswordResetScreen(
                                                    email: _textEmailController
                                                        .text),
                                          ));
                                    }
                                  },
                                );
                                
                              },
                            ),
                            // MyTextButton(onPressed: () {
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordResetScreen(email: _textEmailController.text),));
                            // }, label: 'label', width: 100)
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




// import 'package:app/shared/ui/widgets/heading.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/ui/widgets/textformfield.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:app/shared/utils/textsize.dart';
// import 'package:flutter/material.dart';

// class ForgotPassword extends StatelessWidget {
//   const ForgotPassword({super.key});

//   @override

//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;
//     TextEditingController _textEmailController = TextEditingController();
//     return Scaffold(
//       backgroundColor: Colors.lime,
//       body: SingleChildScrollView(
//         child: Container(
//           height: _deviceHeight,
//                 width: _deviceWidth,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/R.jpg'),
//                       fit: BoxFit.cover),
//                 ),
//                 child: Center(
//                   child: Container(
//                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.2),
//                     ),
//                     child: Column(
//                       children: [
//                         hSpace(_deviceHeight * 0.2),
//                         Heading(
//                          text: 'Forget password?',
//                             size: TextSizes.subHeading,
//                             weight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                           hSpace(20),
//                           PokeTextFormField(
//                             labelText: 'Enter Your Email',
//                              prefixIcon: Icons.email_outlined,
//                              ),
//                              hSpace(20),
//                              PrimaryButton(
//                               label: 'Submit', 
//                               onPressed:  () {
                                
//                               }, 
//                               width: 100,
//                               )
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }