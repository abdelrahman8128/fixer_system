
class GetWorkersModel{
  int? results=null;
  List<Worker>users=[];
  GetWorkersModel.fromJson(Map<String,dynamic>json){
    results=json['results'];
    json['data'].forEach((element) {
      users.add(Worker.fromJson(element));
    });
  }

}

class Worker {
  String? id;
  String ?name;
  String?phoneNumber;
  String?jobTitle;
  double?salary;
  int?IDNumber;
  DateTime?createdAt;
  DateTime?updatedAt;

  Worker.fromJson(Map<String, dynamic>json)
  {
    id = json['_id'];
    name = json['name'];
    phoneNumber=json['phoneNumber'];
    jobTitle=json['jobTitle'];
    salary=(json['salary'])*1.0 ;
    IDNumber=json['IdNumber'];

  }
}