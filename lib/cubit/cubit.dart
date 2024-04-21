import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/models/change_service_state_model.dart';
import 'package:fixer_system/models/get_users_model.dart';
import 'package:fixer_system/models/get_workers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:http/http.dart';

import '../components/show_toast_function/show_toast_function.dart';
import '../models/get_all_cars_model.dart';
import '../models/get_list_of_components_model.dart';
import '../models/get_repairing_cars_model.dart';
import '../models/get_services_model.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  GetUsersModel? getUsersModel = null;
  GetServicesModel? getServicesModel = null;
  ChangeServiceStateModel? changeServiceStateModel = null;
  GetWorkersModel? getWorkersModel = null;
  GetCarsModel?getCarsModel=null;
  GetRepairingCarsModel?getRepairingCarsModel=null;
  GetListOfComponentsModel?getListOfComponentsModel=null;

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
    required String carIdNumber,
    required String color,
    required String brand,
    required String category,
    required String distance, required String role,
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
      'carIdNumber': carIdNumber,
      'color': color,
      'brand': brand,
      'category': category,
      'model': time.toString(),
      "role": role,
      'distance':distance,
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

  void getCarServicesByNumber(context,{
    required String carNumber,
  }) async {
    if (getServicesModel == null) {
      emit(AppGetCarServicesByNumberLoadingState());
      String url =
          'https://fixer-backend-1.onrender.com/api/V1/repairing/' + carNumber;
      final headers = {'Content-Type': 'application/json'};
      return read(
        Uri.parse(url),
        headers: headers,
      ).then((response) {
        getServicesModel = GetServicesModel.fromJson(jsonDecode(response));
        if (getServicesModel!.visits.isNotEmpty) {
          print('daret ya sey3');
          emit(AppGetCarServicesByNumberSuccessState());
        } else {
          emit(AppGetCarServicesByNumberErrorState(response.toString()));
          showToast(context,'Failed to load, please try to reopen the app');
        }
      }).catchError((error) {
        emit(AppGetCarServicesByNumberErrorState(error.toString()));
      });
    }
  }

  void changeServiceState(context,
      {required String serviceId, required String state}) async {
    emit(AppChangeServiceStateLoadingState());
    String url =
        'https://fixer-backend-1.onrender.com/api/V1/repairing/' + serviceId;
    final headers = {'Content-Type': 'application/json'};
    return put(Uri.parse(url), headers: headers, body: {
      'newState': state,
    }).then((response) {
      print(jsonDecode(response.body)['message']);
      showToast(context,jsonDecode(response.body)['message']);
      emit(AppChangeServiceStateSuccessState());
    }).catchError((error) {
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
      getUsersModel?.users=[];

      getUsersModel = GetUsersModel.fromJson(jsonDecode(value));
      if (getUsersModel?.results != null) {
        emit(AppSearchUsersSuccessState());
      } else {
        emit(AppSearchUsersErrorState());
      }
    }).catchError((error){
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
      getListOfComponentsModel = GetListOfComponentsModel.fromJson(jsonDecode(value));
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

}
