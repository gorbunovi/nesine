import 'package:flutter/material.dart';
import 'package:nesine/feature/data/model/preview_model.dart';
import 'package:nesine/feature/domain/entities/preview_entity.dart';

import 'preview_cache_image_widget.dart';

class PreviewListWidget extends StatelessWidget {
  PreviewListWidget({
    Key? key,
    required this.isSelect,
    required this.toCard,
    required this.gender,
    required this.colory,
  }) : super(key: key);

  Function isSelect;
  Function toCard;
  final int gender;
  final double colory;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
 TextEditingController weightController = TextEditingController();
 TextEditingController heightController = TextEditingController();
 TextEditingController ageController = TextEditingController();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF24282F),
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                      children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  const Text(
                                    'CALORIE CALCULATOR',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('MAN -',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Radio(
                                          fillColor:
                                          MaterialStateColor.resolveWith((states) => Colors.white),
                                          value: 1,
                                          groupValue: gender,
                                          onChanged: (T) => isSelect(T),
                                      ),
                                      const SizedBox(width: 50,),
                                      const Text('WOMAN -',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Radio(
                                          fillColor:
                                          MaterialStateColor.resolveWith((states) => Colors.white),
                                          value: 2,
                                          groupValue: gender,
                                          onChanged: (T) => isSelect(T),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  TextFormField(
                                    validator: (val) => val == ''? 'Weight is required': null,
                                    controller: weightController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      labelText: 'WEIGHT',
                                      labelStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      hintText: 'ENTER YOUR WEIGHT',
                                      hintStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff322316), width: 2.0),
                                          borderRadius: BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff322316), width: 2.0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  TextFormField(
                                    validator: (val) => val == '' ? 'Height is required': null,
                                    controller: heightController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      labelText: 'HEIGHT',
                                      labelStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      hintText: 'ENTER YOUR HEIGHT',
                                      hintStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff322316), width: 2.0),
                                          borderRadius: BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff322316), width: 2.0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  TextFormField(
                                    validator: (val) => val == '' ? 'Age is required': null,
                                    controller: ageController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      labelText: 'AGE',
                                      labelStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      hintText: 'ENTER YOUR AGE',
                                      hintStyle:
                                      const TextStyle(color: Color(0xff322316)),
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff322316), width: 2.0),
                                          borderRadius: BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xff322316), width: 2.0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  ElevatedButton(
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()){
                                        toCard(
                                          gender,
                                          int.parse(weightController.text),
                                          int.parse(heightController.text),
                                          int.parse(ageController.text),
                                        );
                                      }else print('ERROR');
                                    },
                                    style: ElevatedButton.styleFrom(primary: Colors.black),
                                    child: Text(colory == 0 ? 'CALCULATE': 'RECALCULATE'),
                                  ),
                                  const SizedBox(height: 10,),
                                  colory == 0 ? const SizedBox():
                                  const Text('DAILY RATE OF CALORIES',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  colory == 0 ? const SizedBox():
                                  Text('$colory',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
