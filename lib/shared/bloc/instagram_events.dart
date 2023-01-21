part of 'instagram_bloc.dart';

abstract class InstagramEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class InstagramPasswordChangedVisibilityEvent extends InstagramEvent{
  final bool isPass;
  final IconData suffix;
  InstagramPasswordChangedVisibilityEvent({
    required this.isPass,
    required this.suffix
  });

  @override
  List<Object> get props => [isPass, suffix];

}

// sign up
class InstagramProfileImageGettingEvent extends InstagramEvent{
  final dynamic profileImage;
  InstagramProfileImageGettingEvent({
    required this.profileImage,
  });
  @override
  List<Object> get props => [profileImage];
}
class InstagramSignUpEvent extends InstagramEvent{
  final Uint8List profileImage;
  final String userName;
  final String email;
  final String password;
  final String bio;
  InstagramSignUpEvent({
    required this.profileImage,
    required this.userName,
    required this.email,
    required this.password,
    required this.bio,
  });

  @override
  List<Object> get props => [profileImage, userName, email, password, bio];

}
