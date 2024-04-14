class ChangeServiceStateModel{

  String?message;
  Data?data;
  ChangeServiceStateModel.fromJson(Map<String,dynamic>json)
  {
    message=json['message'];
    data=Data.fromJson(json['data']);
  }

}
class Data{
  String ?name;
  int ?price;
  String?id;
  Data.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    price=json['name'];
    id=json['_id'];
  }
}