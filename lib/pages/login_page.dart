import 'package:flutter/material.dart';
import 'package:projeto1_curso/components/login/custom_login_buttom_component.dart';
import 'package:projeto1_curso/controllers/login_controller.dart';
import 'package:projeto1_curso/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController login_controller = LoginController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        //color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.3,
            ),
            CustomTextFieldWidget(label: "Login", onChanged: login_controller.setLogin),
            CustomTextFieldWidget(label: "Senha", onChanged: login_controller.setSenha, obscureText: true),
            SizedBox(
              height: 15,
            ),
            CustomLoginButtomComponent(loginController: login_controller,)
          ],
        ),
      ),
    );
  }
}