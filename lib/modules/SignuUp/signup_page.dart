 import 'package:app/modules/Login/login_page.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/sizes.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
   const SignUpPage({super.key});
 
   @override
   State<SignUpPage> createState() => _SignUpPageState();
 }
 
 class _SignUpPageState extends State<SignUpPage> {
   @override
   Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
     return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          decoration: BoxDecoration(
      
        image: DecorationImage(image: NetworkImage('https://www.colorwallpapers.com/uploads/wallpaper/cute-pokemon-phone-wallpapers/width-853/wZsPW229SgOq-cool-pokemon-phone-wallpapers-high-size.png')),
         // color: Colors.red,
          ),
          
          child:  Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(
                  
                  children: [
                    hSpace(200),
                    Heading(text: 'Sign Up', size: TextSizes.headingSize, weight: FontWeight.bold, color: Colors.white),
                    hSpace(20),
                    PokeTextField(
                      prefixIcon: Icons.email_outlined,
                    label: 'Username',
                    ),
                     hSpace(20),
                    PokeTextField(
                      isPassword: true,
                      prefixIcon: Icons.lock_outlined,
                    label: 'Phone number',
                    ),
                     hSpace(20),
                    PokeTextField(
                      isPassword: true,
                      prefixIcon: Icons.lock_outlined,
                    label: 'Email_id',
                    ),
                    
                     hSpace(20),
                    PokeTextField(
                      isPassword: true,
                      prefixIcon: Icons.lock_outlined,
                    label: 'Password',
                    ),
                    hSpace(20),
                    PokeTextField(
                      isPassword: true,
                      prefixIcon: Icons.lock_outlined,
                    label: 'ConfirmPassword',
                    ),
                    hSpace(20),
                    PrimaryButton(label: 'Log In',width: 100,onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },),
                   
                  ],
                ),
              ),
            ),
        ),
      ),
     );
   }
 }