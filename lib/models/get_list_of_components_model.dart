class GetListOfComponentsModel{
  int ?results;
  List<ComponentData>data=[];
  GetListOfComponentsModel.fromJson(Map<String,dynamic>json)
  {
    results=json['results'];
    json['data'].forEach((element) {
      data.add(ComponentData.fromJson(element));
    });
  }

}
class ComponentData{
  String? id;
  String?name;
  int? quantity;
  double ?price;
  String?createdAt;
  String?updatedAt;
  ComponentData.fromJson(Map<String,dynamic>json)
  {
    id=json['_id'];
    name=json['name'];
    quantity=json['quantity'];
    price=(json['price']*1.0);
    createdAt=json['createdAt'];
    updatedAt=json['updatedAt'];
  }
}