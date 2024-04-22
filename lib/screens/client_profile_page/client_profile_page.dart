import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/client_car_item_builder.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ClientProfilePage extends StatefulWidget {
String userId;
   ClientProfilePage(this.userId, {super.key});
  @override
  State<ClientProfilePage> createState() => _ClientDetailsState(userId);
}

class _ClientDetailsState extends State<ClientProfilePage> {
  String userId;
  _ClientDetailsState(this.userId);


  @override
  void initState() {
    //WidgetsFlutterBinding.ensureInitialized();

    AppCubit.get(context).getSpecificUser(userId: userId);
    nameController = TextEditingController(text: AppCubit.get(context).getSpecificUserModel?.name);

    emailController = TextEditingController(text: AppCubit.get(context).getSpecificUserModel?.email);

    phoneNumberController = TextEditingController(text: AppCubit.get(context).getSpecificUserModel?.phoneNumber);

    passwordController=TextEditingController(text: AppCubit.get(context).getSpecificUserModel?.password);

    _radioSelected =AppCubit.get(context).getSpecificUserModel!.active!?1:2 ;


    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();


  var phoneNumberController = TextEditingController();

  var passwordController = TextEditingController();

  int? _radioSelected;
  bool? _radioVal;

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state) {

        },
        builder:(context, state) {
          return Scaffold(
            appBar: AppBar(),
            body:  Form(
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
                                      return 'please enter the Email';
                                    }
                                    return null;
                                  },
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
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio(
                                        value: 1,
                                        groupValue: _radioSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioSelected = value;
                                            _radioVal = true;
                                          });
                                        },
                                      ),
                                      Text('Active'),
                                      SizedBox(width: 20,),
                                      Radio(
                                        value: 2,
                                        groupValue: _radioSelected,
                                        onChanged: (value) {
                                          setState(() {
                                            _radioSelected = value;
                                            _radioVal = false;
                                          });
                                        },
                                      ),
                                      Text('Not Active'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ConditionalBuilder(
                        condition:state is  AppGetSpecificUserLoadingState,
                        builder: (context) => Center(child: CircularProgressIndicator()),
                        fallback:(context) =>  Padding(
                          padding: const EdgeInsetsDirectional
                              .fromSTEB(0, 16, 0, 0),
                          child: Container(
                            height: 250,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,

                              scrollDirection: Axis.horizontal,
                              //physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => clientCarItemBuilder(context,AppCubit.get(context).getSpecificUserModel!.cars[index]),//AppCubit.get(context).getUsersModel!.users[index]),
                              itemCount: AppCubit.get(context).getSpecificUserModel!.cars.length,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          );
        },
    );

  }
}