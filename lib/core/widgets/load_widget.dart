import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  const LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
              toolbarHeight: 50,
              title: const Text('LOAD',
                style: TextStyle(
                  color: Color(0xff322316),
                ),
              ),
              centerTitle: true,
          ),
        ),
        body:  const SafeArea(
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xffE9DDC5),
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
        ),
    );
  }
}