import 'package:app/modules/Login/login_page.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/sizes.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
   Widget build(BuildContext context) {
         final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
       body: SingleChildScrollView(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
         
         color: Color.fromARGB(255, 174, 232, 48),

          
          child:  Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Column(
                  
                  children: [
                    hSpace(250),
                    Heading(text: 'Create new password!', size: TextSizes.headingSize, weight: FontWeight.bold, color: Colors.white),
                    hSpace(20),
                    PokeTextField(
                      prefixIcon: Icons.password_outlined,
                    label: 'new password',
                    ),  
                    hSpace(20),
                    PokeTextField(
                      prefixIcon: Icons.remove_red_eye,
                    label: 'confirm password',
                    ),
                    hSpace(20),
                    PrimaryButton(
                      label: 'Confirm',
                       onPressed:  () {
                         Navigator.push(context,MaterialPageRoute(builder:  (context) => LoginScreen(),));
                       },
                        width:100)
                   
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}