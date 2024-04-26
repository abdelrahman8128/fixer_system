import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/screens/alert_screens/add_repair_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/repair_item_builder.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';


class CarProfilePage extends StatefulWidget {
  String carId;
  CarProfilePage(this.carId, {super.key});
  @override
  State<CarProfilePage> createState() => _CarProfilePageState(carId);
}

class _CarProfilePageState extends State<CarProfilePage> {
  String carId;
  _CarProfilePageState(this.carId);

  TextEditingController idController = TextEditingController();

  TextEditingController carNumberController = TextEditingController();

  TextEditingController carIdNumberController = TextEditingController();

  TextEditingController colorController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController brandController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController modelController = TextEditingController();

  TextEditingController generatedCodeController = TextEditingController();

  TextEditingController generatedPasswordController = TextEditingController();

  TextEditingController periodicRepairsController = TextEditingController();

  TextEditingController nonPeriodicRepairsController = TextEditingController();

  TextEditingController repairingController = TextEditingController();

  TextEditingController distanceController = TextEditingController();

  TextEditingController motorNumberController = TextEditingController();

  TextEditingController nextRepairDateController = TextEditingController();

  TextEditingController lastRepairDateController = TextEditingController();

  bool readOnly = true;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getSpecificCarById(carId: carId);
  }

  @override
  void dispose() {
    idController.dispose();
    carNumberController.dispose();
    carIdNumberController.dispose();
    colorController.dispose();
    stateController.dispose();
    brandController.dispose();
    categoryController.dispose();
    modelController.dispose();
    generatedCodeController.dispose();
    generatedPasswordController.dispose();
    periodicRepairsController.dispose();
    nonPeriodicRepairsController.dispose();
    repairingController.dispose();
    distanceController.dispose();
    motorNumberController.dispose();
    nextRepairDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {
      if (state is AppGetSpecificCarSuccessState) {
        idController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.id);
        carNumberController = TextEditingController(
            text:
                AppCubit.get(context).getSpecificCarModel?.carData?.carNumber);
        carIdNumberController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.carIdNumber);
        colorController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.color);
        stateController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.state);
        brandController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.brand);
        categoryController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.category);
        modelController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.model);
        generatedCodeController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.generatedCode);
        generatedPasswordController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.generatedPassword);
        periodicRepairsController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.periodicRepairs
                ?.toString());
        nonPeriodicRepairsController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.nonPeriodicRepairs
                ?.toString());
        repairingController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.repairing
                ?.toString());
        distanceController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.distance
                ?.toString());
        motorNumberController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.motorNumber);
        nextRepairDateController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.nextRepairDate
                ?.toString());
        lastRepairDateController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.lastRepairDate
                ?.toString());
      }
    },
        builder: (context, state) {
      return Scaffold(
        floatingActionButton: Container(
          alignment: Alignment.bottomRight,
          child: ConditionalBuilder(
            condition: state is AppUpdateCarLoadingState,
            builder: (context) => CircularProgressIndicator(),
            fallback: (context) => FloatingActionButton(
              onPressed: () {
                if (readOnly == true) {
                  setState(() {
                    readOnly = false;
                  });
                } else if (formKey.currentState!.validate()) {
                  AppCubit.get(context).updateCar(
                    context,
                    carId: carId,
                    carNumber: carNumberController.text,
                    carIdNumber: carIdNumberController.text,
                    color: colorController.text,
                    state: stateController.text,
                    brand: brandController.text,
                    category: categoryController.text,
                    model: modelController.text,
                    periodicRepairs: periodicRepairsController.text,
                    nonPeriodicRepairs: nonPeriodicRepairsController.text,
                    repairing: repairingController.text,
                    lastRepair: lastRepairDateController.text,
                    distance: distanceController.text,
                    motorNumber: motorNumberController.text,
                    nextRepair: nextRepairDateController.text,

                  );
                }
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              child: readOnly == true
                  ? Icon(Icons.edit_outlined)
                  : Icon(
                      Icons.done,
                      size: 30,
                    ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Car profile',
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).lineColor,
              borderRadius: 12,
              borderWidth: 1,
              buttonSize: 50,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              icon: Icon(
                Icons.car_repair_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddRepairScreen(AppCubit.get(context)
                        .getSpecificCarModel!
                        .carData!
                        .carNumber!),
                  ),
                );
                // showDialog(context: context, builder: (context) => AddRepairScreen());
              },
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ConditionalBuilder(
            condition: state is AppGetSpecificCarLoadingState,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
            fallback: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            width: 250,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  "EGYPT           مصر",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  width: 250,
                                  height: 71,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${carNumberController.text}',
                                        style: const TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Text(
                            '#${idController.text}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: carIdNumberController,
                                    readOnly:false,
                                    decoration: InputDecoration(
                                      labelText: 'Car ID Number',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: colorController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Color',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: stateController,
                                    readOnly:false,
                                    decoration: InputDecoration(
                                      labelText: 'State',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: brandController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Brand',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: categoryController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Category',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: modelController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Model',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: generatedCodeController,
                                    readOnly:false,
                                    decoration: InputDecoration(
                                      labelText: 'Generated Code',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: generatedPasswordController,
                                    readOnly:false,
                                    decoration: InputDecoration(
                                      labelText: 'Generated Password',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              child: Column(
                                children: [
                                 TextFormField(
                                    controller: periodicRepairsController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Periodic Repairs',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: nonPeriodicRepairsController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Non-Periodic Repairs',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: repairingController,
                                    readOnly:false,
                                    decoration: InputDecoration(
                                      labelText: 'Repairing',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: distanceController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Distance',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    controller: motorNumberController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Motor Number',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    onTap: () {
                                      if (readOnly==false)
                                      {
                                        showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2999),
                                          initialDate: DateTime.now(),
                                        ).then((value) {
                                          setState(() {
                                            if (value!=null) {
                                              lastRepairDateController.text =
                                            '${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                            }
                                          });
                                        });
                                      }
                                    },
                                    controller: lastRepairDateController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'last Repair Date',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    onTap: () {
                                      if (readOnly==false)
                                      {
                                        showDatePicker(
                                          context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2999),
                                          initialDate: DateTime.now(),
                                        ).then((value) {
                                          setState(() {
                                            if (value!=null) {
                                              nextRepairDateController.text =
                                                '${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                            }
                                          });
                                        });
                                      }
                                    },

                                    controller: nextRepairDateController,
                                    readOnly:readOnly,
                                    decoration: InputDecoration(
                                      labelText: 'Next Repair Date',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFFF68B1E),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFF68B1E),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 24, 0, 24),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: AppCubit.get(context)
                                        .getSpecificCarModel
                                        ?.currentRepair
                                        ?.client !=
                                    null,
                                child: const Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Text(
                                    'Current Repaires',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: AppCubit.get(context)
                                          .getSpecificCarModel
                                          ?.currentRepair
                                          ?.client !=
                                      null,
                                  child: repairItemBuilder(
                                      context,
                                      AppCubit.get(context)
                                          .getSpecificCarModel!
                                          .currentRepair!)),
                              const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Text(
                                  'All Repaires',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Container(
                                height: 700,
                                child: ConditionalBuilder(
                                  condition: state is AppGetAllCarsLoadingState,
                                  builder: (context) => Center(
                                      child: CircularProgressIndicator()),
                                  fallback: (context) => ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        repairItemBuilder(
                                            context,
                                            AppCubit.get(context)
                                                .getAllRepairsForSpecificCarModel!
                                                .repairs[index]),
                                    itemCount: AppCubit.get(context)
                                        .getAllRepairsForSpecificCarModel!
                                        .repairs
                                        .length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
