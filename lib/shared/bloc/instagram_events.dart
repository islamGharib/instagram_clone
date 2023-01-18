part of 'instagram_bloc.dart';

abstract class InstagramEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class InstagramPasswordChangedVisibilityOnEvent extends InstagramEvent{}
class InstagramPasswordChangedVisibilityOffEvent extends InstagramEvent{}
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