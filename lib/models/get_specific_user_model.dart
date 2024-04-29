class GetSpecificUserModel{
  GetSpecificUserModel();
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  bool active=false;
  String? phoneNumber;
  List<SpecificCarData>cars=[];
  DateTime? createdAt;
  GetSpecificUserModel.fromJson(Map<String,dynamic>?json){
    json=json?['data'];
    id=json?['id'];
    name=json?['name'];
    email=json?['email'];
    password=json?['password'];
    role=json?['role'];
    active=json?['active'];
    phoneNumber=json?['phoneNumber'];
    createdAt=DateTime.tryParse(json?['createdAt']);
    json?['car'].forEach((element) {
      cars.add(SpecificCarData.fromJson(element));
    });
  }


}

class SpecificCarData {
  SpecificCarData();
  String ? id;
  String ? carCode;
  String ? carNumber;
  String ?brand;
  String ?category ;
  String ?model;
  SpecificCarData.fromJson(Map<String,dynamic>?json)
  {
    id=json?['id'];
    carCode=json?['carCode'];
    carNumber=json?['carNumber'];
    brand=json?['brand'];
    category=json?['category'];
    model=json?['model'];
  }
}