import 'package:app/modules/SignUp/signup_page.dart';
import 'package:app/modules/Password/forgetpassword_page.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/sizes.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(    
    
      body: Stack(

        children: [
          Image.network('https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg',
          width: _deviceWidth,
          height: _deviceHeight,
          // fit: BoxFit.cover,
          ),
           SingleChildScrollView(
          child: Container(
            height: _deviceHeight,
            width: _deviceWidth,
          //   decoration: BoxDecoration(
        
          // image: DecorationImage(image: NetworkImage(
          //   // 'https://www.colorwallpapers.com/uploads/wallpaper/cute-pokemon-phone-wallpapers/width-853/wZsPW229SgOq-cool-pokemon-phone-wallpapers-high-size.png'
          //   'https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg',           
          //   )),        
          //   ),
            
            child:  Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 60),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    
                    children: [
                      hSpace(250),
                      // Heading(text: 'Log In', size: TextSizes.headingSize, weight: FontWeight.bold, color: Colors.white),
                      // hSpace(20),
                      PokeTextField(
                        prefixIcon: Icons.email_outlined,
                      label: 'Username',
                      ),
                      hSpace(20),
                      PokeTextField(
                        isPassword: true,
                        prefixIcon: Icons.lock_outlined,
                      label: 'Password',
                      ),
                      hSpace(20),
                      PrimaryButton(label: 'Log In',width: 100,onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
                      },),
                       hSpace(20),
                       MyTextButton(
                        label: "Don't have an Account? SignUp!", width: 300, weight: FontWeight.normal,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:  (context) => SignUpPage(),));
                        },),
                        hSpace(40),
                       MyTextButton(
                        label: 'forget password?Click here', width: 300,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:  (context) => ForgetPassword(),));
                        },)
                    ],
                  ),
                ),
              ),
          ),
        ),
        ],
      ),
    );
  }
}