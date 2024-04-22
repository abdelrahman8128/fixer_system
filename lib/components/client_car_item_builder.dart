import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/get_specific_user_model.dart';

Widget clientCarItemBuilder(context,SpecificCarData model){
  return Card(

    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
    child: GestureDetector(
      onTap: (){},
      child: Container(
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
    ),

  );
}