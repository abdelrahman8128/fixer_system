import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

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
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        /*color: Colors.orange.shade100,*/
        /*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade200,
            Colors.grey.shade300,
            Colors.grey.shade400,
            Colors.grey.shade500,
          ],
        ),*/
        color: Colors.grey.shade300,
        boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-5,0),
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(5,0),
            )
          ],
      ),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * 0.15,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                'assets/images/car.png',
                width: MediaQuery.sizeOf(context).width * 0.15,
                height: MediaQuery.sizeOf(context).width * 0.1,
                fit: BoxFit.cover,
              ),
              width: MediaQuery.sizeOf(context).width * 0.15,
              height: MediaQuery.sizeOf(context).width * 0.1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15)
              ),
            ),
            Row(
              children: [
                Text('Car Number: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${model.carNumber}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Brand: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${model.brand} ${model.category}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Model: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${model.model}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Code: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${model.carCode}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
  );
}