part of 'instagram_bloc.dart';

abstract class InstagramState extends Equatable{
  @override
  List<Object?> get props => [];
}
class InstagramInitialState extends InstagramState{}
class InstagramChangePasswordVisibilityState extends InstagramState{
  final bool isPass;
  final IconData suffix;
  InstagramChangePasswordVisibilityState({
    required this.isPass,
    required this.suffix
});

  @override
  List<Object> get props => [isPass, suffix];

}
// sign up
class InstagramProfileImagePickedSuccessState extends InstagramState{
  final dynamic profileImage;
  InstagramProfileImagePickedSuccessState({
    required this.profileImage,
  });
  @override
  List<Object> get props => [profileImage];
}
class InstagramProfileImagePickedErrorState extends InstagramState{}
class InstagramSignUpLoadingState extends InstagramState{}
class InstagramSignUpSuccessState extends InstagramState{}
class InstagramSignUpErrorState extends InstagramState{}