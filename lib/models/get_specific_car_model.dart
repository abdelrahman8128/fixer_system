




class GetSpecificCarModel{
  GetSpecificCarModel();

SpecificCarData ?carData;
RepairData?repaired=RepairData();
RepairData?currentRepair=RepairData();

GetSpecificCarModel.fromJson(Map<String,dynamic>?json)
{
  json=json?['data'];
   carData=SpecificCarData.fromJson(json?['car']);
   repaired=RepairData.fromJson(json?['repairing']);
   currentRepair=RepairData.fromJson(json?['currentRepair']);
}




}

class SpecificCarData{

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
  var componentState=[];
  String?nextRepairDate;
  String?lastRepairDate;
  double?repairingPercentage;


  SpecificCarData.fromJson(Map<String,dynamic>?json)

  {
    state = json?['State'];
    id = json?['_id'];
    ownerName = json?['ownerName'];
    carNumber = json?['carNumber'];
    phoneNumber = json?['phoneNumber'];
    email = json?['email'];
    carIdNumber = json?['carIdNumber'];
    color = json?['color'];
    brand = json?['brand'];
    category = json?['category'];
    model = json?['model'];
    generatedCode = json?['generatedCode'];
    generatedPassword = json?['generatedPassword'];
    periodicRepairs = json?['periodicRepairs'];
    nonPeriodicRepairs = json?['nonPeriodicRepairs'];
    repairing = json?['repairing'];
    componentState.addAll(json?['componentState']);
    distance = json?['distances'];
    motorNumber = json?['motorNumber'];
    nextRepairDate=json?['nextRepairDate'];
    lastRepairDate=json?['lastRepairDate'];
    repairingPercentage=json?['repairingPercentage'];

  }
  }

class RepairData {
  RepairData();

  String? id;
  String? client;
  String? brand;
  String? category;
  String? model;
  int ? discount;
  String? totalPrice;
  String? carNumber;
  String? type;
  String? expectedDate;
  List<Service>services = [];
  List<Addition>additions = [];
  List<Component>components = [];
  int ?priceAfterDiscount;
  bool? complete;
  var  completedServicesRatio;
  String? createdAt;
  String? updatedAt;


  RepairData.fromJson(Map<String, dynamic>?json)
  {
   id = json?["_id"];
   client= json?["client"];
   brand= json?["brand"];
   category= json?["category"];
   model= json?["model"];
   discount= json?["discount"];
   totalPrice= json?["totalPrice"];
   carNumber= json?["carNumber"];
   type= json?["type"];
   expectedDate= json?["expectedDate"];
   json?["Services"].forEach((element){
     if (element!=null) {
        services.add(Service.fromjson(element));
      }
    });
    json?["additions"].forEach((element){
     if (element!=null) {
       additions.add(Addition.fromjson(element));
     }
    });

      json?["component"].forEach((element) {
     if (element!=null) {
       components.add(Component.fromjson(element));
     }
      });

   priceAfterDiscount= json?["priceAfterDiscount"];
   complete= json?["complete"];
   completedServicesRatio= json?["completedServicesRatio"];
   createdAt= json?["createdAt"];
   updatedAt= json?["updatedAt"];
  }
}

class Service{
  String? name;
  double?price;
  String?state;
  String?id;
  Service.fromjson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    state=json?['state'];
    id=json?['_id'];
  }
}


class Addition{
  String? name;
  double?price;
  String?id;
  Addition.fromjson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    id=json?['_id'];
  }
}



class Component{
  String? name;
  double?price;
  String?id;
  int?quantity;
  Component.fromjson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    id=json?['_id'];
    quantity=json?['quantity'];
  }
}
