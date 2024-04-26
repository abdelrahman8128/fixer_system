import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/models/get_specific_user_model.dart';
import 'package:fixer_system/models/get_users_model.dart';
import 'package:fixer_system/models/get_workers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:http/http.dart';

import '../components/show_toast_function/show_toast_function.dart';
import '../models/get_all_cars_model.dart';
import '../models/get_all_repairs_for_specific_car_model.dart';
import '../models/get_list_of_inventory_components_model.dart';
import '../models/get_repairing_cars_model.dart';
import '../models/get_specific_car_model.dart';
import '../models/monthly_report_model.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  GetUsersModel? getUsersModel =GetUsersModel();
  GetWorkersModel? getWorkersModel = GetWorkersModel();
  GetCarsModel?getCarsModel=GetCarsModel();
  GetRepairingCarsModel?getRepairingCarsModel=GetRepairingCarsModel();
  GetListOfInventoryComponentsModel?getListOfComponentsModel=GetListOfInventoryComponentsModel();
  GetSpecificUserModel?getSpecificUserModel=GetSpecificUserModel();
  GetSpecificCarModel?getSpecificCarModel=GetSpecificCarModel();
  GetAllRepairsForSpecificCarModel?getAllRepairsForSpecificCarModel=GetAllRepairsForSpecificCarModel();
  MainPramsModel?mainPramsModel=MainPramsModel();
  var time=DateTime.now();
  void changDatePicker(value)
  {
    time=value;
    emit(AppDatePickerChangeState());
  }
  void addClient(context,{
    required String name,
    required String email,
    required String carNumber,
    required String phoneNumber,
    required String color,
    required String brand,
    required String category,
    required String distance,
    required String role,

    required String chassisNumber,
    required String nextRepairDate,
    required String lastRepairDate,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String motorNumber,
  }) {
    emit(AppAddClientLoadingState());
    const url = 'https://fixer-backend-1.onrender.com/api/V1/User';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'name': name,
      'email': email,
      'carNumber': carNumber,
      'phoneNumber': phoneNumber,
      'color': color,
      'brand': brand,
      'category': category,
      'model': time.year.toString(),
      "role": role,
      'distances':distance,
      'chassisNumber':chassisNumber,
       'nextRepairDate':nextRepairDate,
       'lastRepairDate':lastRepairDate,
       'periodicRepairs':periodicRepairs,
       'nonPeriodicRepairs':nonPeriodicRepairs,
       'motorNumber':motorNumber,
      "State": "good",



    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==201) {
        showToast(context,"User added successfully");
        emit(AppAddClientSuccessState());
      } else {
        showToast(context ,response.body);
        emit(AppAddClientErrorState());

      }
      // if (forgetPasswordModel!.status != 'fail') {
      //   emit(AppForgetPasswordSuccessState());
      //   showToast('password sent to your email');
      // } else {
      //   emit(AppForgetPasswordErrorState(forgetPasswordModel?.message ?? ''));
      // }
    });
  }

  void getUsers() {
    const url = 'https://fixer-backend-1.onrender.com/api/V1/User';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    emit(AppGetUsersLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getUsersModel = GetUsersModel.fromJson(jsonDecode(value));
      if (getUsersModel?.results != null) {
        emit(AppGetUsersSuccessState());
      } else {
        emit(AppGetUsersErrorState());
      }
    });
  }


  void changeServiceState(context,
      {required String serviceId,
        required String state,
      })  {
    print (serviceId);
    emit(AppChangeServiceStateLoadingState());
    String url ='https://fixer-backend-1.onrender.com/api/V1/repairing/${serviceId}';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'newState': state,

    });
     put(Uri.parse(url), headers: headers, body:body).then((response) {
      print(response.body.toString());
      if (response.statusCode==200){
        showToast(context, 'service state changed successfully');
        emit(AppChangeServiceStateSuccessState());

      }
      else{
        emit(AppChangeServiceStateErrorState(''));
        showToast(context, response.body);

      }
    }).catchError((error) {
      print(error.toString());
      emit(AppChangeServiceStateErrorState(error.toString()));
    });
  }

  void getWorkers() {
    const url = 'https://fixer-backend-1.onrender.com/api/V1/Worker';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppGetWorkersLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getWorkersModel = GetWorkersModel.fromJson(jsonDecode(value));
      if (getWorkersModel?.results != null) {
        emit(AppGetWorkersSuccessState());
      } else {
        emit(AppGetWorkersErrorState());
      }
    });
  }

  void addWorker(context ,{
    required String name,
    required String phoneNumber,
    required String jobTitle,
    required String salary,
    required String IDNumber,

  }) {
    emit(AppAddWorkerLoadingState());
    const url = 'https://fixer-backend-1.onrender.com/api/V1/Worker';
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'salary': salary,
      'IdNumber': IDNumber,
    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==201)
        {
          showToast(context,'Added Successfully');
          emit(AppAddWorkerSuccessState());
        }
      else
        {
          showToast(context ,jsonDecode(response.body)['message']);
          emit(AppAddWorkerErrorState());
        }

    });
  }


  void getCars() {
    const url = 'https://fixer-backend-1.onrender.com/api/V1/Garage';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppGetAllCarsLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getCarsModel = GetCarsModel.fromJson(jsonDecode(value));

      if (getCarsModel?.results != null) {
        emit(AppGetAllCarsSuccessState());
      } else {
        emit(AppGetAllCarsErrorState());
      }
    });
  }

  void getRepairingCars() {
    const url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/repairing';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppGetRepairingCarsLoadingState());

    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {

      //print(value.toString());

        getRepairingCarsModel=GetRepairingCarsModel.fromJson(jsonDecode(value));
        print(getRepairingCarsModel?.data.toString());
        print(getRepairingCarsModel?.results);
        print(getRepairingCarsModel?.data.length);
        emit(AppGetRepairingCarsSuccessState());


    }).catchError((onError)
      {
        print(onError.toString());
        emit(AppGetRepairingCarsErrorState());

      }
    );
  }

  void searchWorkers({
    required String word,
}){
    getWorkersModel?.users=[];
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Worker/search/${word}';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppSearchWorkersLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getWorkersModel = GetWorkersModel.fromJson(jsonDecode(value));
      if (getWorkersModel?.results != null) {
        emit(AppSearchWorkersSuccessState());
      } else {
        emit(AppSearchWorkersErrorState());
      }
    }).catchError((error){
      emit(AppSearchWorkersErrorState());
    });

  }



  void searchCars({
    required String word,
  }){

    getCarsModel?.data=[];
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/search/${word}';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppSearchCarsLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getCarsModel = GetCarsModel.fromJson(jsonDecode(value));
      if (getCarsModel?.results != null) {
        emit(AppSearchCarsSuccessState());
      } else {
        emit(AppSearchCarsErrorState());
      }
    }).catchError((error){
      emit(AppSearchCarsErrorState());
    });

  }

  void searchUsers({
    required String word,
}){
    getUsersModel?.users=[];

    String url = 'https://fixer-backend-1.onrender.com/api/V1/User/search/${word}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };

    emit(AppSearchUsersLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      print(value);

      getUsersModel = GetUsersModel.fromJson(jsonDecode(value));
      if (getUsersModel?.results != null) {
        emit(AppSearchUsersSuccessState());
      } else {
        emit(AppSearchUsersErrorState());
      }
    }).catchError((error){
      print (error);
      emit(AppSearchUsersErrorState());
    });


  }

  void getListOfComponents()
  {
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Inventort';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppGetListOfComponentsLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getListOfComponentsModel = GetListOfInventoryComponentsModel.fromJson(jsonDecode(value));
      if (getListOfComponentsModel?.results != null) {
        emit(AppGetListOfComponentsSuccessState());
      } else {
        emit(AppGetListOfComponentsErrorState());
      }
    }).catchError((error){
      emit(AppGetListOfComponentsErrorState());
    });

  }


  void addComponent(context,{
    required String name,
    required String quantity,
    required String price,

  }) {
    emit(AppAddComponentLoadingState());
    const url = 'https://fixer-backend-1.onrender.com/api/V1/Inventort';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'name': name,
      'quantity': quantity,
      'price': price,
    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==201) {
        showToast(context,"Component added successfully");
        emit(AppAddComponentSuccessState());
      } else {
        showToast(context ,response.body);
        emit(AppAddComponentErrorState());
      }

    });
  }


  void searchRepairingCars({
    required String word,
  }){

    getRepairingCarsModel?.data=[];
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/search/repairing/${word}';
    final headers = {
      'Content-Type': 'application/json',
    };
    emit(AppSearchRepairingCarsLoadingState());
    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getRepairingCarsModel = GetRepairingCarsModel.fromJson(jsonDecode(value));
      if (getRepairingCarsModel?.results != null) {
        emit(AppSearchRepairingCarsSuccessState());
      } else {
        emit(AppSearchRepairingCarsErrorState());
      }
    }).catchError((error){
      emit(AppSearchRepairingCarsErrorState());
    });

  }



  void editComponent(context,{
    required String name,
    required String quantity,
    required String price,
    required String id,
  }) {
    emit(AppEditComponentLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Inventort/${id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'name': name,
      'quantity': quantity,
      'price': price,
    });

    put(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==200) {
        showToast(context,"Component edited successfully");
        emit(AppEditComponentSuccessState());
      } else {
        showToast(context ,response.body);
        emit(AppEditComponentErrorState());
      }
    });
  }



  void getSpecificUser({
    required String userId,
  }){


    emit(AppGetSpecificUserLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/User/${userId}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };

    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {

      getSpecificUserModel = GetSpecificUserModel.fromJson(jsonDecode(value));
      if (getSpecificUserModel?.name != null) {
        emit(AppGetSpecificUserSuccessState());
      } else {
        emit(AppGetSpecificUserErrorState());
      }
    }).catchError((error){
      print(error);
      emit(AppGetSpecificUserErrorState());
    });

  }



  void addCar(context,{

    required String id,
    required String carNumber,
    required String color,
    required String brand,
    required String category,
    required String distance,
    required String chassisNumber,
    required String nextRepairDate,
    required String lastRepairDate,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String motorNumber,
  }) {
    emit(AppAddCarLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/add/${id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'carNumber': carNumber,
      'chassisNumber':chassisNumber,
      'nextRepairDate':nextRepairDate,
      'lastRepairDate':lastRepairDate,
      'color': color,
      'brand': brand,
      'category': category,
      'model': time.year.toString(),
      'distance':distance,
      'motorNumber':motorNumber,
      'repairing':false,
      "periodicRepairs": 0,
      "nonPeriodicRepairs": 0,

    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==201) {
        showToast(context,"User added successfully");
        emit(AppAddCarSuccessState());
      } else {
        showToast(context ,response.body);
        emit(AppAddCarErrorState());

      }
      // if (forgetPasswordModel!.status != 'fail') {
      //   emit(AppForgetPasswordSuccessState());
      //   showToast('password sent to your email');
      // } else {
      //   emit(AppForgetPasswordErrorState(forgetPasswordModel?.message ?? ''));
      // }
    });
  }

  void updateUser(context,{
    required String id,
    required String email,
    required String name,
    required String phone,
}){
    emit(AppUpdateUsersLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/User/${id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'name': name,
      'email':email,
      'phoneNumber':phone,
    });
    put(Uri.parse(url), headers: headers, body: body).then((value) {
      if (value.statusCode==200)
        {
          showToast(context, 'user updated successfully');
          emit(AppUpdateUsersSuccessState());

        }
      else {

        emit(AppUpdateUsersErrorState());
      }


        }
    ).catchError((error){
      emit(AppUpdateUsersErrorState());

    });
  }

  void getSpecificCarById({
    required String carId,

  }){
    getAllRepairsForSpecificCarModel?.repairs=[];
    emit(AppGetSpecificCarLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/getCar/${carId}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };

    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {
      getSpecificCarModel = GetSpecificCarModel.fromJson(jsonDecode(value));
      if (getSpecificCarModel?.carData?.id!= null) {
        emit(AppGetSpecificCarSuccessState());
        getAllRepairsForSpecificCar(carId: carId);
      } else {
        emit(AppGetSpecificCarSuccessState());
      }
    }).catchError((error){
      print(error);
      emit(AppGetSpecificCarErrorState());
    });

  }



  void addRepair(context,{

    required String carNumber,
   required List<Map<String,dynamic>>components,
    required List<Map<String,dynamic>>services,
    required List<Map<String,dynamic>>additions,
    required String type,
    required double discount,
    required int daysItTake,
    required String nextPerDate,

  }) {
    emit(AppAddRepairLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/repairing';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      'components': components,
      'services':services,
      'additions':additions,
      'carNumber':carNumber,
      'type': type,
      'discount':discount ,
      'daysItTake': daysItTake,
      'nextPerDate':nextPerDate,

    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {

      if (response.statusCode==200) {
        showToast(context,"Repair added successfully");
        emit(AppAddRepairSuccessState());
      } else {
        showToast(context ,response.body);
        emit(AppAddRepairErrorState());
      }
      // if (forgetPasswordModel!.status != 'fail') {
      //   emit(AppForgetPasswordSuccessState());
      //   showToast('password sent to your email');
      // } else {
      //   emit(AppForgetPasswordErrorState(forgetPasswordModel?.message ?? ''));
      // }
    });
  }


  void getAllRepairsForSpecificCar({
    required String carId,
  }){


    emit(AppGetAllRepairsForSpecificCarLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/repairing/getById/${carId}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };

    read(
      Uri.parse(url),
      headers: headers,
    ).then((value) {

      getAllRepairsForSpecificCarModel = GetAllRepairsForSpecificCarModel.fromJson(jsonDecode(value));
      if (getAllRepairsForSpecificCarModel?.repairs != null) {
        emit(AppGetAllRepairsForSpecificCarSuccessState());
      } else {
        emit(AppGetSpecificUserErrorState());
      }
    }).catchError((error){
      print(error);
      emit(AppGetAllRepairsForSpecificCarErrorState());
    });

  }


  void updateCar(context,{
    required String carNumber,
    required String carIdNumber,
    required String color,
    required String state,
    required String brand,
    required String category,
    required String model,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String repairing,
    required String distance,
    required String motorNumber,
    required String nextRepair,
    required String carId,
    required String lastRepair,

  }){
    emit(AppUpdateCarLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/Garage/update/${carId}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E'
    };
    final body = jsonEncode({
      '_id': carId,
      "carNumber": carNumber,
      "carIdNumber": carIdNumber,
      "color": color,
      "State": state,
      "brand": brand,
      "category": category,
      "model": model,
      "nextRepairDate": nextRepair,
      "lastRepairDate": lastRepair,
      "periodicRepairs": periodicRepairs,
      "nonPeriodicRepairs": nonPeriodicRepairs,
      // "componentState": [
      //   {
      //     "_id": "661d425cf5cfc07996163c99"
      //   },
      //   {
      //     "_id": "661d425cf5cfc07996163c9a"
      //   }
      // ],
      "repairing": repairing,
      "distances": distance,
      "motorNumber": motorNumber,
    });
    put(Uri.parse(url), headers: headers, body: body).then((value) {
      if (value.statusCode==200)
      {
        showToast(context, 'car updated successfully');
        emit(AppUpdateCarSuccessState());

      }
      else {

        emit(AppUpdateCarErrorState());
      }


    }
    ).catchError((error){
      emit(AppUpdateCarErrorState());

    });
  }



  void getMainPrams({
    required String year,
    required String month,
  }){


    emit(AppGetMainPramsLoadingState());
    String url = 'https://fixer-backend-1.onrender.com/api/V1/MonthlyReport/specific_month_year/';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFlYzZiMDk1MWQ1Y2Q0MWFiZWExN2QiLCJpYXQiOjE3MTMyOTMwNTMsImV4cCI6MTcyMTA2OTA1M30.x-fjAnDSKaEt4kgQANO3X3iEMvoR9QmuZyYJ0gSfw_E',
      'year':year,
      'month':month,
    };
    // final body = jsonEncode({
    //
    // });

    read(
      Uri.parse(url),
      headers: headers,

    ).then((value) {
      print(value);
      mainPramsModel = MainPramsModel.fromJson(jsonDecode(value));
      if (mainPramsModel?.id != null) {
        emit(AppGetMainPramsSuccessState());
      } else {
        emit(AppGetMainPramsErrorState());
      }
    }).catchError((error){
      print(error);
      emit(AppGetMainPramsErrorState());
    });

  }





}
