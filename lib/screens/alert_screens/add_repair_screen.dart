import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class AddRepairScreen extends StatefulWidget {
  String carNumber;
  AddRepairScreen(this.carNumber);

  @override
  _AddRepairScreenState createState() => _AddRepairScreenState(carNumber);
}



class _AddRepairScreenState extends State<AddRepairScreen> {
  String carNumber;
  _AddRepairScreenState(this.carNumber);

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
        listener: (context, state) {},
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
                      carNumber: carNumber,
                      additions: additions,
                      components: components,
                      daysItTake: daysItTake,
                      discount: discount,
                      nextPerDate: nextPerDate,
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
                                    '${carNumber}',
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
                      const SizedBox(height: 16.0),
                      const Text('Components'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: components.length,
                        itemBuilder: (context, index) {
                          var controller=TextEditingController();
                          return Row(
                            children: [
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
                                    return Text(item);
                                  },

                                  onSubmit: ({required item, required searchQuery}) {
                                    components[index]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.id;
                                    setState(() {
                                      controller.text= '${components[index]['id']}';
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
                                    child: const Icon(Icons.remove,
                                        color: Colors.white),
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      setState(() {
                                        if (components[index]['quantity'] > 1)
                                          components[index]['quantity']--;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${components[index]['quantity']}',
                                        style: const TextStyle(fontSize: 30)),
                                  ),
                                  FloatingActionButton(
                                    child: const Icon(Icons.add,
                                        color: Colors.white),
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      setState(() {
                                        components[index]['quantity'] += 1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      ElevatedButton(
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
                      const SizedBox(height: 16.0),
                      const Text('Services'),
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
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                      ),
                      ElevatedButton(
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
                      const SizedBox(height: 16.0),
                      const Text('Additions'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: additions.length,
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
                      ElevatedButton(
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
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Column(
                              children: [
                                DropdownButtonFormField<String>(
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
                                const SizedBox(height: 16.0),
                                TextFormField(
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
                                const SizedBox(height: 16.0),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.025,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Column(
                              children: [
                                TextFormField(
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
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  controller: nextPerDateController,
                                  decoration: CustomInputDecoration
                                      .customInputDecoration(
                                          context, 'Next Per Date'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2999),
                                      initialDate: DateTime.now(),
                                    ).then((value) {
                                      setState(() {
                                        nextPerDateController.text =
                                            '${value?.day.toString()}/${value?.month.toString()}/${value?.year.toString()}';
                                        nextPerDate =
                                            nextPerDateController.text;
                                      });
                                    });
                                  },
                                ),
                                const SizedBox(height: 16.0),
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
          );
        });
  }
}
