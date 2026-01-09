import 'package:projeto1_curso/models/post_model.dart';

abstract class HomeRepository {

  Future<List<PostModel>> getList();

}