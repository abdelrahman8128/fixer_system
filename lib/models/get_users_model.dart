
class GetUsersModel{
  int? results=null;
  List<User>users=[];
  GetUsersModel.fromJson(Map<String,dynamic>json){
    results=json['results'];
    json['data'].forEach((element) {
      users.add(User.fromJson(element));
    });
  }
}

class User{
  String? id;
  String? name;
  String?phone;
  List<Car>cars=[];
  // String? email;
  // String? password;
  // String  ?role;
  // bool?active;
  // String?carId;
  // String?carCode;
  // String?carNumber;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  User.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    phone=json['phoneNumber'];
    json['cars'].forEach((element) {
      cars.add(Car.fromJson(element));
    });

    // email=json['email'];
    // password=json['password'];
    // role=json['role'];
    // active=json['active'];
    // carId=json['Car'];
    // carCode=json['carCode'];
    // carNumber=json['car'];
    // createdAt=DateTime.parse(json['createdAt']);
    // updatedAt=DateTime.parse(json['updatedAt']);

  }
}

class Car {
  String ? id;
  String ? carNumber;
  String ?brand;
  String ?category ;
  String ?model;
  Car.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    carNumber=json['carNumber'];
    brand=json['brand'];
    category=json['category'];
    model=json['model'];
  }
}