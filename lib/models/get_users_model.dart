
class GetUsersModel{
  GetUsersModel();
  int? results=null;
  List<User>users=[];
  GetUsersModel.fromJson(Map<String,dynamic>?json){
    results=json?['results'];
    json?['data'].forEach((element) {
      users.add(User.fromJson(element));
    });
  }
}

class User{
  User();
  String? id;
  String? name;
  String?phone;
  //List<Car>cars=[];
  // String? email;
  // String? password;
  // String  ?role;
  // bool?active;
  // String?carId;
  // String?carCode;
  // String?carNumber;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  User.fromJson(Map<String,dynamic>?json)
  {
    id=json?['id'];
    name=json?['name'];
    phone=json?['phoneNumber'];

  }
}