class MainPramsModel {
  MainPramsModel();
  String? id;
  int? salaries;
  int? income;
  int? totalOutcome;
  DateTime? createdAt;
  DateTime? updatedAt;

  MainPramsModel.fromJson(Map<String,dynamic>?json){
    json=json?['data'];
   id=json?["_id"];
    salaries=json?["salars"];
    totalOutcome=json?["totalOutcome"];
    income=json?['income'];
    createdAt=DateTime.tryParse(json?["createdAt"]);
    updatedAt=DateTime.tryParse(json?["updatedAt"]);

  }
}
