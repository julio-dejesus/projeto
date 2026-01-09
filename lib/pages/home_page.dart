import 'package:flutter/material.dart';
import 'package:projeto1_curso/controllers/home_controller.dart';
import 'package:projeto1_curso/models/post_model.dart';
import 'package:projeto1_curso/repositories/home_repository_imp.dart';
import 'package:projeto1_curso/services/prefs_service.dart';
import 'package:projeto1_curso/teste/title_case.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState(){
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
            }, 
            icon: Icon(Icons.logout)
            )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(  
        valueListenable: _controller.posts,
        builder: (_, list, _) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, index) =>
              ListTile(
                leading: Text(
                  "#${(index + 1).toString()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  ),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(ajustaTexto(list[index].name)),
                onTap: () => {
                  Navigator.of(context).pushNamed('/details', arguments: ((index + 1).toString()))
                },
              ),
            separatorBuilder: (_, _) => Divider(
              height: 1,
              color: Colors.grey,
            )
            
          );
        },
          )
    );
  }
}