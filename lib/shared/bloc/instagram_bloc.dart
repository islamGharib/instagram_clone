import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'instagram_events.dart';
part 'instagram_states.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState>{
  static InstagramBloc get(context) => BlocProvider.of(context);
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  InstagramBloc() : super(InstagramInitialState()){
    on<InstagramPasswordChangedVisibilityEvent>(_changePasswordVisibility);

  }

  void _changePasswordVisibility(InstagramPasswordChangedVisibilityEvent event, Emitter<InstagramState> emit){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(InstagramChangePasswordVisibilityState(
      isPass: isPassword,
      suffix: suffix
    ));
  }


}