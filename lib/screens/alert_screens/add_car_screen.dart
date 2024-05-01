import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

final _formKey = GlobalKey<FormState>();



  var carNumberController = TextEditingController();

  var chassisNumberController = TextEditingController();

  var colorController = TextEditingController();

  var brandController = TextEditingController();

  var categoryController = TextEditingController();


  var nextRepairDateController = TextEditingController();

  var lastRepairDateController = TextEditingController();

  var periodicRepairsController = TextEditingController();

  var nonPeriodicRepairsController = TextEditingController();


  var distanceController= TextEditingController();

  var motorNumberController = TextEditingController();

Widget addNewCarScreen(context, String userId,) {



  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {

    },
    builder: (context, state) {
      return AlertDialog(
        alignment: Alignment.topCenter,
        surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title: const Text(
          'Add Car',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon:IconButton(
          onPressed: () {

             carNumberController = TextEditingController();

             chassisNumberController = TextEditingController();

             colorController = TextEditingController();

             brandController = TextEditingController();

            categoryController = TextEditingController();


             nextRepairDateController = TextEditingController();

             lastRepairDateController = TextEditingController();

             periodicRepairsController = TextEditingController();

             nonPeriodicRepairsController = TextEditingController();

             distanceController = TextEditingController();

             motorNumberController = TextEditingController();


            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerRight,
        ),
        actions: [
          ConditionalBuilder(
            condition: state is AppAddCarLoadingState,
            builder: (context) =>  const Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                 child: CircularProgressIndicator(),
                                            ),),
            
                                        
            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  AppCubit.get(context).addCar(context,
                    id: userId,
                    carNumber: carNumberController.text,
                    color: colorController.text,
                    brand: brandController.text,
                    category: categoryController.text,
                    distance:distanceController.text,
                    chassisNumber: chassisNumberController.text,
                    nextRepairDate: nextRepairDateController.text,
                    lastRepairDate: lastRepairDateController.text,
                    periodicRepairs: periodicRepairsController.text,
                    nonPeriodicRepairs: nonPeriodicRepairsController.text,
                    motorNumber: motorNumberController.text,
                  );
                }
              },
              text: 'Add Car',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: MediaQuery.sizeOf(context).height * 0.065,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: const Color(0xFFF68B1E),
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 3,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: carNumberController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'Car number'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the car number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: chassisNumberController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'chassis number'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the chassis number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: colorController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'color'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the car color';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: brandController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'brand'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter car brand';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: categoryController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'category'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter car category';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 70,
                              ),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: nextRepairDateController,

                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'Next Repair date'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),

                                onTap:() {
                                    showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2999),
                                    initialDate: DateTime.now(),
                                    ).then((value) {
                                    nextRepairDateController.text =
                                    DateFormat.yMEd().format(value!);
                                    });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: lastRepairDateController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'last Repair date'),
                                onTap:() {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2999),
                                    initialDate: DateTime.now(),
                                  ).then((value) {
                                    lastRepairDateController.text =
                                        DateFormat.yMEd().format(value!);
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: periodicRepairsController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'periodic repairs'),
                                   
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),

                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nonPeriodicRepairsController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'non periodic repairs'),


                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),

                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: distanceController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'distance'),

                                   
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the distance';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: motorNumberController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'motor number'),


                                   
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the motor number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      width: 350,
                      child: YearPicker(
                        firstDate: DateTime(1970),
                        lastDate: DateTime.now(),
                        selectedDate: AppCubit.get(context).time,
                        onChanged: (value) {
                          AppCubit.get(context).changDatePicker(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
