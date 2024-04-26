import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../models/get_specific_car_model.dart';

Widget repairItemBuilder(context, RepairData model) {
  return SingleChildScrollView(
    child: Container(
      width: MediaQuery.sizeOf(context).width * 0.30,
      padding: const EdgeInsets.all(20.0),
      decoration:ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.orange.shade300)),
        color: Colors.orange.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General Info',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Client'),
                    Text('${model.client}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Brand'),
                    Text('${model.brand}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Category'),
                    Text('${model.category}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Model'),
                    Text('${model.model}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Discount'),
                    Text('${model.discount}%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Price'),
                    Text('${model.totalPrice} EGP'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Car Number'),
                    Text('${model.carNumber}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type'),
                    Text('${model.type}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Expected Date'),
                    Text('${model.expectedDate}'),
                  ],
                ),
              ],
            ),
          ),

          const Text(
            'Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Complete'),
                  Text('${model.complete.toString()}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Completed Services Ratio'),
                  Text('${(model.completedServicesRatio)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Created At'),
                  Text('${model.createdAt}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Updated At'),
                  Text('${model.updatedAt}'),
                ],
              ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...model.services.map((value) {
                Icon icon =const Icon(Icons.done,color: Colors.green,) ;

                return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(

                          visible:  (value.state=='repairing'),

                          child: IconButton(onPressed: (){

                                AppCubit.get(context).changeServiceState(
                                  context,
                                  serviceId: value.id!,
                                  state: 'completed',
                                );

                            }, icon: icon),
                        ),
                        Text('${value.name}'),
                        Text('${value.price} EGP'),
                      ],
                    ),
              );
              }),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Additions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...model.additions.map((value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${value.name}'),
                        Text('${value.price} EGP'),
                      ],
                    ),
              )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Component',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...model.components.map((value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${value.name}'),
                        Text('${value.price} EGP'),
                      ],
                    ),
              )),
            ],
          ),
        ],
      ),
    ),
  );
}
