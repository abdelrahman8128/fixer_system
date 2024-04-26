class GetListOfInventoryComponentsModel{
  GetListOfInventoryComponentsModel();
  int ?results;
  List<InventoryComponentData>data=[];
  GetListOfInventoryComponentsModel.fromJson(Map<String,dynamic>?json)
  {
    results=json?['results'];
    json?['data'].forEach((element) {
      data.add(InventoryComponentData.fromJson(element));
    });
  }

}
class InventoryComponentData{
  InventoryComponentData();
  String? id;
  String?name;
  int? quantity;
  double ?price;
  String?createdAt;
  String?updatedAt;
  InventoryComponentData.fromJson(Map<String,dynamic>?json)
  {
    id=json?['_id'];
    name=json?['name'];
    quantity=json?['quantity'];
    price=(json?['price']*1.0);
    createdAt=json?['createdAt'];
    updatedAt=json?['updatedAt'];
  }
}