abstract class AppCubitStates {}

class AppInitialState extends AppCubitStates{}

class AppAddClientLoadingState extends AppCubitStates{}
class AppAddClientSuccessState extends AppCubitStates{}
class AppAddClientErrorState extends AppCubitStates{}

class AppGetUsersLoadingState extends AppCubitStates{}
class AppGetUsersSuccessState extends AppCubitStates{}
class AppGetUsersErrorState extends AppCubitStates{}


class AppGetWorkersLoadingState extends AppCubitStates{}
class AppGetWorkersSuccessState extends AppCubitStates{}
class AppGetWorkersErrorState extends AppCubitStates{}


class AppSearchWorkersLoadingState extends AppCubitStates{}
class AppSearchWorkersSuccessState extends AppCubitStates{}
class AppSearchWorkersErrorState extends AppCubitStates{}


class AppSearchCarsLoadingState extends AppCubitStates{}
class AppSearchCarsSuccessState extends AppCubitStates{}
class AppSearchCarsErrorState extends AppCubitStates{}



class AppGetCarServicesByNumberLoadingState extends AppCubitStates{}
class AppGetCarServicesByNumberSuccessState extends AppCubitStates{}
class AppGetCarServicesByNumberErrorState extends AppCubitStates{
  String error;
  AppGetCarServicesByNumberErrorState(this.error);
}

class AppChangeServiceStateLoadingState extends AppCubitStates{}
class AppChangeServiceStateSuccessState extends AppCubitStates{}
class AppChangeServiceStateErrorState extends AppCubitStates{
  String error;
  AppChangeServiceStateErrorState(this.error);
}

class AppDatePickerChangeState extends AppCubitStates{}


class AppAddWorkerLoadingState extends AppCubitStates{}
class AppAddWorkerSuccessState extends AppCubitStates{}
class AppAddWorkerErrorState extends AppCubitStates{}


class AppGetAllCarsLoadingState extends AppCubitStates{}
class AppGetAllCarsSuccessState extends AppCubitStates{}
class AppGetAllCarsErrorState extends AppCubitStates{}


class AppGetRepairingCarsLoadingState extends AppCubitStates{}
class AppGetRepairingCarsSuccessState extends AppCubitStates{}
class AppGetRepairingCarsErrorState extends AppCubitStates{}
