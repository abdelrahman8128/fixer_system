import 'package:flutter/material.dart';

import '../models/get_specific_user_model.dart';
import '../screens/car_profile_page/car_profile_page.dart';

Widget clientCarItemBuilder(context,SpecificCarData model){
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarProfilePage(model.id!),
        ),
      );
    },
    child: Container(
      decoration:ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.orange.shade300)),
        color: Colors.orange.shade100,
      ),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * 0.15,
      height: MediaQuery.sizeOf(context).width * 0.13,
      child: Column(
          children: [
            Image.asset(
              'assets/images/car.png',
              width: MediaQuery.sizeOf(context).width * 0.15,
              height: MediaQuery.sizeOf(context).width * 0.1,
              fit: BoxFit.cover,
            ),
            Text('${model.carNumber}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

            ),
            Text('${model.brand} ${model.category}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

            ),
            Text('${model.model}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

            ),
            Text('${model.id}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

            ),

          ],
        ),
    ),
  );
}