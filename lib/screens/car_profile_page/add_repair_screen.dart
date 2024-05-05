import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/get_list_of_inventory_components_model.dart';

class AddRepairScreen extends StatefulWidget {
  final String carNumber;
  final String carId;
  const AddRepairScreen(this.carNumber,this.carId, {super.key});

  @override
  State<AddRepairScreen> createState() => _AddRepairScreenState();
}


enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class _AddRepairScreenState extends State<AddRepairScreen> {

  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> components = [
    {'id': '', 'quantity': 0}
  ];
  List<Map<String, dynamic>> services = [
    {'name': '', 'price': 0, 'state': 'repairing'}
  ];
  List<Map<String, dynamic>> additions = [
    {'name': '', 'price': 0}
  ];
  String serviceType = 'nonPeriodic';
  String serviceState = 'repairing';
  String searchValue = '';


  double discount = 0;
  int daysItTake = 0;
  String nextPerDate = '';
  var nextPerDateController = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {
          if (state is AppAddRepairSuccessState)
            {
              AppCubit.get(context).getAllRepairsForSpecificCar(carId: widget.carId);
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Repair',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            floatingActionButton: ConditionalBuilder(
              condition: state is AppAddRepairLoadingState,
              builder: (context) => const CircularProgressIndicator(),
              fallback: (context) => FFButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AppCubit.get(context).addRepair(
                      context,
                      carNumber: widget.carNumber,
                      additions: additions,
                      components: components,
                      daysItTake: daysItTake,
                      discount: discount,
                      services: services,
                      type: serviceType,
                    );
                  }
                },
                text: 'Add Repair',
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
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
                                color: Colors.black,

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
                                    widget.carNumber,
                                    style: const TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.black,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      

                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: components.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 15,),
                        itemBuilder: (context, index) {
                          AppCubit.get(context).getListOfComponents();
                          var controller=TextEditingController();

                          return Row(
                            children: <Widget>[
                              // Container(
                              //   width:250,
                              //     height:200,
                              //     child:DropdownMenu<ColorLabel>(
                              //       initialSelection: ColorLabel.green,
                              //       controller: controller,
                              //       // requestFocusOnTap is enabled/disabled by platforms when it is null.
                              //       // On mobile platforms, this is false by default. Setting this to true will
                              //       // trigger focus request on the text field and virtual keyboard will appear
                              //       // afterward. On desktop platforms however, this defaults to true.
                              //       requestFocusOnTap: true,
                              //       label: const Text('Color'),
                              //       onSelected: (ColorLabel? color) {
                              //         setState(() {
                              //         });
                              //       },
                              //       dropdownMenuEntries: ColorLabel.values
                              //           .map<DropdownMenuEntry<ColorLabel>>(
                              //               (ColorLabel color) {
                              //             return DropdownMenuEntry<ColorLabel>(
                              //               value: color,
                              //               label: color.label,
                              //               enabled: color.label != 'Grey',
                              //               style: MenuItemButton.styleFrom(
                              //                 foregroundColor: color.color,
                              //               ),
                              //             );
                              //           }).toList(),
                              //     ),
                              // ),
                              // Expanded(
                              //   child: DropdownMenu<InventoryComponentData>(
                              //     enableFilter: true,
                              //     leadingIcon: const Icon(Icons.search),
                              //     requestFocusOnTap: true,
                              //     label: const Text('Icon'),
                              //     width: 250,
                              //     inputDecorationTheme: const InputDecorationTheme(
                              //       filled: true,
                              //       contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                              //     ),
                              //
                              //     onSelected: (InventoryComponentData? value) {
                              //
                              //       print ('selected ${value!.name!}');
                              //       setState(() {
                              //
                              //       });
                              //
                              //     },
                              //     searchCallback: (entries, query) {
                              //       if (query!=searchValue)
                              //         {
                              //           print (query);
                              //           searchValue=query;
                              //           AppCubit.get(context).searchComponents(word: searchValue);
                              //         }
                              //     },
                              //
                              //
                              //
                              //
                              //     dropdownMenuEntries:
                              //     AppCubit.get(context).getListOfInventoryComponentsModel!.data.map<DropdownMenuEntry<InventoryComponentData>>(
                              //           ( e) {
                              //         return DropdownMenuEntry<InventoryComponentData>(
                              //           value: e,
                              //           label: e.name!,
                              //           leadingIcon: Icon(Icons.account_tree),
                              //           enabled: true,
                              //
                              //
                              //         );
                              //       },
                              //     ).toList(),
                              //
                              //   ),
                              // ),
                              //

                                  Expanded(
                                    child:PaginatedSearchBar<String>(
                                      maxHeight: 300,
                                      hintText: 'Search',
                                      minSearchLength: 1,
                                      inputDecoration: CustomInputDecoration.customInputDecoration(context, 'search'),
                                      emptyBuilder: (context) {
                                        return const Text("No Results");
                                      },
                                      onSearch: ({
                                        required pageIndex,
                                        required pageSize,
                                        required searchQuery,
                                      }) async {
                                        AppCubit.get(context).searchComponents(word: searchQuery);
                                        return Future.delayed(const Duration(milliseconds: 1000), () {
                                          if (searchQuery == "empty") {
                                            return [];
                                          }
                                          return AppCubit.get(context).searchListOfInventoryComponentsModel!.data.map((e) => e.name!).toList();
                                        });
                                      },

                                      itemBuilder: (
                                          context, {
                                            required item,
                                            required index,
                                          }) {
                                        return  Text(item);
                                      },

                                      onSubmit: ({required item, required searchQuery}) {
                                        print(item);
                                        components[index]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.id;
                                        setState(() {
                                          controller.text= AppCubit.get(context).searchListOfInventoryComponentsModel!.data.first.name!;
                                        });
                                        },

                                        inputController: controller,


                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        mini: true,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          setState(() {
                                            if (components[index]['quantity'] > 1) {
                                              components[index]['quantity']--;
                                            }
                                          });
                                        },
                                        child: const Icon(Icons.remove,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            '${components[index]['quantity']}',
                                            style: const TextStyle(fontSize: 30)),
                                      ),
                                      FloatingActionButton(
                                        mini: true,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          setState(() {
                                            components[index]['quantity'] += 1;
                                          });
                                        },
                                        child: const Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],


                          );

                          //   Row(
                          //   children: [
                          //     Expanded(
                          //
                          //       child:PaginatedSearchBar<String>(
                          //         maxHeight: 300,
                          //         hintText: 'Search',
                          //         minSearchLength: 1,
                          //
                          //         inputDecoration: CustomInputDecoration.customInputDecoration(context, 'search'),
                          //         emptyBuilder: (context) {
                          //           return const Text("No Results");
                          //         },
                          //         onSearch: ({
                          //           required pageIndex,
                          //           required pageSize,
                          //           required searchQuery,
                          //         }) async {
                          //           AppCubit.get(context).searchComponents(word: searchQuery);
                          //           return Future.delayed(const Duration(milliseconds: 1000), () {
                          //             if (searchQuery == "empty") {
                          //               return [];
                          //             }
                          //             return AppCubit.get(context).searchListOfInventoryComponentsModel!.data.map((e) => e.name!).toList();
                          //           });
                          //         },
                          //
                          //         itemBuilder: (
                          //             context, {
                          //               required item,
                          //               required index,
                          //             }) {
                          //           return Text(item);
                          //         },
                          //
                          //         onSubmit: ({required item, required searchQuery}) {
                          //           components[index]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.id;
                          //           setState(() {
                          //             controller.text= AppCubit.get(context).searchListOfInventoryComponentsModel!.data.first.name!;
                          //           });
                          //           },
                          //           inputController: controller,
                          //
                          //       ),
                          //     ),
                          //     const SizedBox(width: 16.0),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         FloatingActionButton(
                          //           mini: true,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(20)),
                          //           onPressed: () {
                          //             setState(() {
                          //               if (components[index]['quantity'] > 1) {
                          //                 components[index]['quantity']--;
                          //               }
                          //             });
                          //           },
                          //           child: const Icon(Icons.remove,
                          //               color: Colors.white),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Text(
                          //               '${components[index]['quantity']}',
                          //               style: const TextStyle(fontSize: 30)),
                          //         ),
                          //         FloatingActionButton(
                          //           mini: true,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(20)),
                          //           onPressed: () {
                          //             setState(() {
                          //               components[index]['quantity'] += 1;
                          //             });
                          //           },
                          //           child: const Icon(Icons.add,
                          //               color: Colors.white),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(

                          onPressed: () {
                            if (components.isNotEmpty) {
                              if (components.last['id'].toString().isNotEmpty) {
                                setState(() {
                                  components.add({'id': '', 'quantity': 0});
                                });
                              }
                            }
                          },
                          child: const Text('Add Component'),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(context, 'Name'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  initialValue: services[index]['name'],
                                  onChanged: (value) {
                                    setState(() {
                                      services[index]['name'] = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(context, 'Price'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  initialValue:
                                      services[index]['price'].toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      services[index]['price'] =
                                          int.parse(value);
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(context, 'State'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  value: services[index]['state'],
                                  onChanged: (value) {
                                    setState(() {
                                      services[index]['state'] = value!;
                                    });
                                  },
                                  items: ['completed', 'repairing']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 15,),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (services.isNotEmpty) {
                              if (services.last['name'].toString().isNotEmpty) {
                                setState(() {
                                  services.add({
                                    'name': '',
                                    'price': 0,
                                    'state': 'repairing'
                                  });
                                });
                              }
                            }
                          },
                          child: const Text('Add Service'),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Additions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: additions.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 15,),

                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(context, 'Name'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  initialValue: additions[index]['name'],
                                  onChanged: (value) {
                                    setState(() {
                                      additions[index]['name'] = value;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(context, 'Price'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  initialValue:
                                      additions[index]['price'].toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      additions[index]['price'] =
                                          int.parse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (additions.isNotEmpty) {
                              if (additions.last['name'].toString().isNotEmpty) {
                                setState(() {
                                  additions.add({'name': '', 'price': 0});
                                });
                              }
                            }
                          },
                          child: const Text('Add Addition'),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Properties',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      ),
                      
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: CustomInputDecoration
                                  .customInputDecoration(context, 'Type'),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary,
                                  ),
                              value: serviceType,
                              onChanged: (value) {
                                setState(() {
                                  serviceType = value!;
                                });
                              },
                              items: ['nonPeriodic', 'periodic']
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please fill this field';
                                }
                                return null;
                              },
                              decoration: CustomInputDecoration
                                  .customInputDecoration(
                                      context, 'Discount'),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary,
                                  ),
                              initialValue: discount.toString(),
                              onChanged: (value) {
                                setState(() {
                                  discount = double.parse(value);
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please fill this field';
                                }
                                return null;
                              },
                              decoration: CustomInputDecoration
                                  .customInputDecoration(
                                      context, 'Days It Takes'),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiary,
                                  ),
                              initialValue: daysItTake.toString(),
                              onChanged: (value) {
                                setState(() {
                                  daysItTake = int.parse(value);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80,),

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
