import 'dart:typed_data';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/models/user_model.dart';
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
      emit(InstagramProfileImagePickedSuccessState(profileImage: profileImage));
    } else {
      emit(InstagramProfileImagePickedErrorState());
    }
  }
  void _signUp(InstagramSignUpEvent event, Emitter<InstagramState> emit){
    emit(InstagramSignUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password
    ).then((value) async {
      uploadImageToStorage('pofilePics', value.user!.uid, event.profileImage, false, emit);
      // userCreate(uId: value.user!.uid, name: event.userName, email: event.email, bio: event.bio);
      userCreate(
          uId: value.user!.uid,
          name: event.userName,
          email: event.email,
          phone: event.phone,
          bio: event.bio,
          profileImageUrl: photoUrl!,
        emit: emit
      );
      // emit(InstagramSignUpSuccessState());
    }).catchError((error){
      emit(InstagramSignUpErrorState());
    });
  }
  String? photoUrl;
  void uploadImageToStorage(String childName, String uId, File file, bool isPost, Emitter<InstagramState> emit) async {
    FirebaseStorage.instance.ref()
        .child(childName).child(uId)
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        photoUrl = value;
      }).catchError((error){
        emit(InstagramSignUpErrorState());
      });
    }).catchError((error){
      emit(InstagramSignUpErrorState());
    });
  }
  void userCreate(
      {
        required String uId,
        required String name,
        required String email,
        required String phone,
        required String bio,
        required String profileImageUrl,
        required Emitter<InstagramState> emit
      }) async {
    UserModel model = UserModel(
        uId: uId,
        name: name,
        email: email,
        phone: phone,
        bio: bio,
        profileImageUrl: profileImageUrl
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      emit(InstagramSignUpSuccessState());
    }).catchError((error){
      emit(InstagramSignUpErrorState());
    });

  }





}