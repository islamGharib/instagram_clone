import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/modules/signup/signup_screen.dart';
import 'package:instagram_flutter/shared/bloc/instagram_bloc.dart';
import 'package:instagram_flutter/shared/component/components.dart';
import 'package:instagram_flutter/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailControler = TextEditingController();

  final TextEditingController _passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 0.125 * MediaQuery.of(context).size.height,),
                //  svg image
                SvgPicture.asset(
                  'assets/images/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(height: 64,),
                // textformfield for email
                DefaultTextFormField(
                    controller: _emailControler,
                    type: TextInputType.emailAddress,
                    validate: (value){},
                    label: 'Enter your email',
                    prefix: Icons.email
                ),
                const SizedBox(height: 24,),
                // textformfield for pass
                BlocBuilder<InstagramBloc, InstagramState>(
                  builder: (context, state){
                    InstagramBloc instagramBloc = InstagramBloc.get(context);
                    return DefaultTextFormField(
                        controller: _passControler,
                        type: TextInputType.text,
                        validate: (value){},
                        label: 'Enter your pass',
                        prefix: Icons.lock,
                        isPassword: instagramBloc.isPassword,
                        suffix: instagramBloc.suffix,
                        suffixPressed: (){
                          instagramBloc.add(InstagramPasswordChangedVisibilityEvent(
                            isPass: instagramBloc.isPassword,
                            suffix: instagramBloc.suffix
                          ));
                        }
                    );
                  },
                ),
                const SizedBox(height: 24,),
                //  login button
                InkWell(
                  child: Container(
                    child: const Text('Login'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                      color: blueColor,
                    ),

                  ),
                ),
                SizedBox(height: 0.125 * MediaQuery.of(context).size.height,),
                //  transitioning to signing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Don\'t have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateAndFinish(context, SignUpScreen());
                      },
                      child: Container(
                        child: const Text(
                          'Sign up.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
