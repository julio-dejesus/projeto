import 'package:dio/dio.dart';
import 'package:projeto1_curso/models/post_model.dart';
import 'package:projeto1_curso/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository{

  @override
  Future<List<PostModel>> getList() async{
    try{
      var response = await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=151');
      final List results = response.data['results'];
      return results.map((e) => PostModel.fromJson(e)).toList();
    }
    catch(e){
      print(e);
    }
    return [];
  }

}