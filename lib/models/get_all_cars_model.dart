class GetCarsModel{
  int ? results;
  List<CarData>data=[];
  GetCarsModel.fromJson(Map<String,dynamic>json){
    results=json['results'];
    json['data'].forEach((element) {
      data.add(CarData.fromJson(element));
    });
  }
}

class CarData{

  String? id;
  String? ownerName;
  String? carNumber;
  int? phoneNumber;
  String? email;
  String? carIdNumber;
  String? color;
  String? state;
  String? brand;
  String? category;
  String? model;
  String? generatedCode;
  String? generatedPassword;
  int? periodicRepairs;
  int? nonPeriodicRepairs;
  bool? repairing;
  int? distance;
  String?motorNumber;
  List<dynamic>componentState=[];
  DateTime?nextRepairDate;
  double?repairingPercentage;

  CarData.fromJson(Map<String,dynamic>json)
  {
    state=json['State'];
    id=json['_id'];
     ownerName=json['ownerName'];
     carNumber=json['carNumber'];
     phoneNumber=json['phoneNumber'];
     email=json['email'];
    carIdNumber=json['carIdNumber'];
    color=json['color'];
    state=json['state'];
    brand=json['brand'];
    category=json['category'];
    model=json['model'];
    generatedCode=json['generatedCode'];
    generatedPassword=json['generatedPassword'];
    periodicRepairs=json['periodicRepairs'];
    nonPeriodicRepairs=json['nonPeriodicRepairs'];
    repairing=json['repairing'];
    componentState.addAll(json['componentState']);
    distance=json['distances'];
    motorNumber=json['motorNumber'];





  }

}