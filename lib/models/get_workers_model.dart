
class GetWorkersModel{
  GetWorkersModel();
  int? results=null;
  List<Worker>workers=[];
  GetWorkersModel.fromJson(Map<String,dynamic>?json){
    results=json?['results'];
    json?['data'].forEach((element) {
      workers.add(Worker.fromJson(element));
    });
  }

}

class Worker {
  Worker();
  String? id;
  String ?name;
  String?phoneNumber;
  String?jobTitle;
  double?salary;
  String?IDNumber;
  // DateTime?createdAt;
  // DateTime?updatedAt;
  //
  Worker.fromJson(Map<String, dynamic>?json)
  {
    id = json?['_id'];

    name = json?['name'];
    phoneNumber=json?['phoneNumber'];
    jobTitle=json?['jobTitle'];
    salary=(json?['salary'])*1.0 ;
    IDNumber=json?['IdNumber'];

  }
}