// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

final _formKey = GlobalKey<FormState>();

var nameController = TextEditingController();

var phoneNumberController = TextEditingController();

var IdNumberController = TextEditingController();

var jobTitleController = TextEditingController();

var salaryController = TextEditingController();


Widget AddNewWorkerPage(context) {
  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return AlertDialog(

        alignment: Alignment.topRight,
        title: Text(
          'Add Worker',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        actions: [
          ConditionalBuilder(
            condition: state is AppAddWorkerLoadingState,
            builder: (context) => Center(child: CircularProgressIndicator()),
            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                  AppCubit.get(context).addWorker(
                    context,
                      name: nameController.text,
                      phoneNumber: phoneNumberController.text,
                      jobTitle: jobTitleController.text,
                      salary: salaryController.text,
                      IDNumber: IdNumberController.text,
                  );
                }
              },
              text: 'Add Worker',
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
                          width: MediaQuery.sizeOf(context).width * 0.70,
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
                                  filled: true,
                                  fillColor: Colors.white,
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
                                  filled: true,
                                  fillColor: Colors.white,
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
                                controller: IdNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'ID number',
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
                                  filled: true,
                                  fillColor: Colors.white,
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
                                    return 'please enter the ID number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: jobTitleController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Job title ',
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
                                  filled: true,
                                  fillColor: Colors.white,
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
                                    return 'please enter the Job title';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: salaryController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Salary',
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
                                  filled: true,
                                  fillColor: Colors.white,
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
                                    return 'please enter the salary';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
