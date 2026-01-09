import 'package:flutter/material.dart';
import 'package:projeto1_curso/controllers/login_controller.dart';

class CustomLoginButtomComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtomComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
              valueListenable: loginController.inLoader,
              builder: (_, inLoader, _) => inLoader ? CircularProgressIndicator() :
                ElevatedButton(
                  onPressed: () => {
                    loginController.auth().then(
                      (result){
                        if(result){
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Falha ao realizar login."),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                    )
                  },
                   style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightGreenAccent),
                    foregroundColor: WidgetStateProperty.all(Colors.black45)
                   ),
                   child: Text("Logar"),
                   ),
              
            );
  }
}