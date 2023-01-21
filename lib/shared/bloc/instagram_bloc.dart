import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'instagram_events.dart';
part 'instagram_states.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState>{
  static InstagramBloc get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  InstagramBloc() : super(InstagramInitialState()){
    on<InstagramPasswordChangedVisibilityEvent>(_changePasswordVisibility);
    on<InstagramProfileImageGettingEvent>(_getProfileImage);
    on<InstagramSignUpEvent>(_signUp);

  }

  void _changePasswordVisibility(InstagramPasswordChangedVisibilityEvent event, Emitter<InstagramState> emit){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(InstagramChangePasswordVisibilityState(
      isPass: isPassword,
      suffix: suffix
    ));
  }


  File? profileImage;
  Future<void> _getProfileImage(InstagramProfileImageGettingEvent event, Emitter<InstagramState> emit) async {
    // Pick an image
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState(profileImage: profileImage));
    } else {
      emit(SocialProfileImagePickedErrorState());
    }
  }
  void _signUp(InstagramSignUpEvent event, Emitter<InstagramState> emit){
    emit(SocialSignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      // userCreate(uId: value.user!.uid, name: event.userName, email: event.email, bio: event.bio);
      //emit(SocialRegisterSuccessState());
    }).catchError((error){
      print(error.code);
      emit(SocialSignUpErrorState());
    });
  }




}