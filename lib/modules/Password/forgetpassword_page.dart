import 'package:app/modules/Password/newpassword_page.dart';
import 'package:app/shared/ui/widgets/frostedglassbox.dart';
import 'package:app/shared/ui/widgets/heading.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/ui/widgets/textformfield.dart';
import 'package:app/shared/utils/sizes.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
      final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            // 'https://lh3.googleusercontent.com/LxQBOujV9WD4TG0Qs-GYtayZJdH0IM0d3iwQEYU0o9W-hhiqnlXTnpeXPWddfCnLKoO9wKU9WT2v4qtzCfx4NAaQAICubAm6caOFCuunrmb_B7w=e365-pa-nu-w824-rw',
            // 'https://images.pexels.com/photos/6897769/pexels-photo-6897769.jpeg?auto=compress&cs=tinysrgb&w=600',
            // 'https://images.pexels.com/photos/7234384/pexels-photo-7234384.jpeg?auto=compress&cs=tinysrgb&w=600',
            'https://images.pexels.com/photos/4719340/pexels-photo-4719340.jpeg?auto=compress&cs=tinysrgb&w=600',
          width: _deviceWidth,
          height: _deviceHeight,
          fit: BoxFit.cover,
          ),
          
           SingleChildScrollView(
          child: Container(
            height: _deviceHeight,
            width: _deviceWidth,
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 61, 67, 75).withOpacity(0.7),
            // image: DecorationImage(
            //   image: NetworkImage('https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg'),
            //   fit: BoxFit.cover,
            //   )   
            ),
            
           child: Center(
             child: FrostedGlassBox(
              theChild: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Column(
                  children: [
                      hSpace(150),
                      Heading(text: 'Forget password?', size: TextSizes.headingSize, weight: FontWeight.bold, color: Colors.white, ),
                      hSpace(20),
                      PokeTextField(
                        prefixIcon: Icons.email_outlined,
                      label: 'Enter your email',
                      ),  
                       hSpace(20),
                    PrimaryButton(
                        label: 'Next', 
                        onPressed:  () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>NewPassword() ,));
                        }, 
                        width: 100),
                  ],
                ),
              ), 
              theHeight: 500, 
              theWidth: 350),
           ),
          ),
        ),
        ],
       
      ),
    );
  }
}