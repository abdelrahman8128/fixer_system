
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

final _formKey = GlobalKey<FormState>();

Widget AddNewClientScreen(context) {

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var carNumberController = TextEditingController();

  var phoneNumberController = TextEditingController();


  var colorController = TextEditingController();

  var brandController = TextEditingController();

  var categoryController = TextEditingController();


  var roleController = TextEditingController(text: 'user');

  var distanceController = TextEditingController();

  var chassisNumberController = TextEditingController();
  var nextRepairDateController  = TextEditingController();
  var lastRepairDateController  = TextEditingController();
  var periodicRepairsController  = TextEditingController(text: '0');
  var nonPeriodicRepairsController  = TextEditingController(text: '0');
  var motorNumberController  = TextEditingController();

  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return AlertDialog(
        alignment: Alignment.topRight,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
        title: Text(
          'Add Client',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerRight,
        ),
        actions: [
          ConditionalBuilder(
            condition: state is AppAddClientLoadingState,
            builder: (context) =>  Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                 child: CircularProgressIndicator(),
                                            ),),
            
                                        
            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  AppCubit.get(context).addClient(
                    context,
                    name: nameController.text,
                    email: emailController.text,
                    carNumber: carNumberController.text,
                    phoneNumber: phoneNumberController.text,
                    color: colorController.text,
                    brand: brandController.text,
                    category: categoryController.text,
                    role: roleController.text,
                    distance: distanceController.text,
                    chassisNumber:chassisNumberController.text,
                    nextRepairDate:nextRepairDateController.text,
                    lastRepairDate:lastRepairDateController.text,
                    periodicRepairs:nonPeriodicRepairsController.text,
                    nonPeriodicRepairs:nonPeriodicRepairsController.text,
                    motorNumber:motorNumberController.text,
                  );
                }
              },
              text: 'Add Client',
              options: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 0.20,
                height: MediaQuery.sizeOf(context).height * 0.065,
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: Color(0xFFF68B1E),
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 3,
                borderSide: BorderSide(
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
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: nameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'name',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the Email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: carNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'car number',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the Car number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: phoneNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'phone number',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the phone number';
                                  } else if (value.length < 10) {
                                    return 'The phone number is to short';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: distanceController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'distance',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
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

                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: chassisNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'chassis number',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nextRepairDateController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'next repair data',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: lastRepairDateController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'last repair data',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: colorController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'color',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: brandController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'brand',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: categoryController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'category',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: roleController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'role',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the role';
                                  }
                                  return null;
                                },
                              ),


                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: periodicRepairsController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'periodic repairs',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nonPeriodicRepairsController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'non periodic repair',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: motorNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'motor number',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDBE2E7),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFF68B1E),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),

                                  contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
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