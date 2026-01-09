class PostModel{
  final String name;

  PostModel(this.name);

  factory PostModel.fromJson(Map json){
    return PostModel(json['name'],);
  }

}