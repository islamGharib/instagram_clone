import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/modules/login/login_screen.dart';
import 'package:instagram_flutter/shared/component/components.dart';
import 'package:instagram_flutter/shared/styles/colors.dart';
import '../../shared/bloc/instagram_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passControler = TextEditingController();
  final TextEditingController _bioControler = TextEditingController();
  final TextEditingController _usernameControler = TextEditingController();

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
                // Flexible(child: Container(), flex: 2,),
                SizedBox(height: 0.125 * MediaQuery.of(context).size.height,),
                //  svg image
                SvgPicture.asset(
                  'assets/images/ic_instagram.svg',
                  color: primaryColor,
                  height: 64,
                ),
                const SizedBox(height: 64,),
                // circular widget to accept and show our selected file
                BlocBuilder<InstagramBloc, InstagramState>(
                    builder: (context, state){
                      InstagramBloc instagramBloc = InstagramBloc.get(context);
                      var profileImage = instagramBloc.profileImage;
                      return Stack(
                        children: [
                          profileImage != null ?
                            CircleAvatar(
                            radius: 64,
                              backgroundImage: FileImage(profileImage),
                              backgroundColor: Colors.red,
                            )
                              : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'),
                              backgroundColor: Colors.red,
                            ),
                          Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: (){
                                instagramBloc.add(InstagramProfileImageGettingEvent(profileImage: instagramBloc.profileImage));
                              },
                              icon: const Icon(Icons.add_a_photo),
                            ),
                          )
                        ],
                      );
                    },
                ),
                const SizedBox(height: 24,),
                // textformfield for username
                DefaultTextFormField(
                    controller: _usernameControler,
                    type: TextInputType.text,
                    validate: (value){},
                    label: 'Enter your username',
                    prefix: Icons.person
                ),
                const SizedBox(height: 24,),
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
                // textformfield for bio
                DefaultTextFormField(
                    controller: _usernameControler,
                    type: TextInputType.text,
                    validate: (value){},
                    label: 'Enter your bio',
                    prefix: Icons.description
                ),
                const SizedBox(height: 24,),
                //  login button
                InkWell(
                  onTap: (){},
                  child: Container(
                    child: const Text('Sign up'),
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
                // Flexible(child: Container(), flex: 2,),
                // //  transitioning to signing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Already have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: (){navigateAndFinish(context, LoginScreen());},
                      child: Container(
                        child: const Text(
                          'Login.',
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
