import 'package:bloc/bloc.dart';
import 'package:contineu_assignment/core/utils/shared_preference_singleton.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    bool isDarkTheme = SharedPreferenceSingleton().getBool(SharedPreferenceSingleton.isDarkTheme);
    SharedPreferenceSingleton().setBool(SharedPreferenceSingleton.isDarkTheme, !isDarkTheme);
    emit(isDarkTheme ? ThemeMode.light : ThemeMode.dark);
    
  }
}