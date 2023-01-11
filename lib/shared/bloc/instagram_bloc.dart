import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_flutter/shared/bloc/instagram_events.dart';
import 'package:instagram_flutter/shared/bloc/instagram_states.dart';

class InstagramBloc extends Bloc<InstagramEvent, InstagramState>{
  static InstagramBloc get(context) => BlocProvider.of(context);
  InstagramBloc() : super(InstagramInitialState()){
    on<InstagramPasswordChangedVisibilityEvent>(_changePasswordVisibility);

  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void _changePasswordVisibility(InstagramPasswordChangedVisibilityEvent event, Emitter<InstagramState> emit){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(InstagramChangePasswordVisibilityState());
  }

}