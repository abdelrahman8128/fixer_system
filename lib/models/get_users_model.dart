
class GetUsersModel{
  int? results=null;
  List<User>users=[];
  GetUsersModel.formJson(Map<String,dynamic>json){
    results=json['results'];
    json['data'].forEach((element) {
      users.add(User.fromJson(element));
    });
  }
}

class User{
  String? id;
  String ?name;
  String? email;
  String? password;
  String  ?role;
  bool?active;
  String?carId;
  String?carCode;
  String?carNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  User.fromJson(Map<String,dynamic>json)
  {
    id=json['_id'];
    name=json['name'];
    email=json['email'];
    password=json['password'];
    role=json['role'];
    active=json['active'];
    carId=json['Car'];
    carCode=json['carCode'];
    carNumber=json['car'];
    createdAt=DateTime.parse(json['createdAt']);
    updatedAt=DateTime.parse(json['updatedAt']);

  }
}