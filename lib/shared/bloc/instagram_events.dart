import 'package:equatable/equatable.dart';

abstract class InstagramEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class InstagramPasswordChangedVisibilityEvent extends InstagramEvent{}