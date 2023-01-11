
import 'package:equatable/equatable.dart';

abstract class InstagramState extends Equatable{
  @override
  List<Object?> get props => [];
}
class InstagramInitialState extends InstagramState{}
class InstagramChangePasswordVisibilityState extends InstagramState{}