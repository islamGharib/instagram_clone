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