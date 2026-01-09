import 'package:flutter/material.dart';
import 'package:projeto1_curso/services/prefs_service.dart';

class LoginController {

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  String setLogin(String valor) => _login = valor;

  String? _senha;
  String setSenha(String valor) => _senha = valor;


  Future<bool> auth() async{
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    if(_login == 'admin' && _senha == 'admin'){
      PrefsService.save(_login!);
      return true;
    }

    return false;
  }
 
}