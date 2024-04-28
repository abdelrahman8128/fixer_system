class MainPramsModel {
  MainPramsModel();
  String? id;
  int? salaries;
  int? income;
  int? totalOutcome;
  String? createdAt;
  String? updatedAt;

  MainPramsModel.fromJson(Map<String,dynamic>?json){
    json=json?['data'];
   id=json?["_id"];
    salaries=json?["salars"];
    totalOutcome=json?["totalOutcome"];
    income=json?['income'];
    createdAt=json?["createdAt"];
    updatedAt=json?["updatedAt"];

  }
}
