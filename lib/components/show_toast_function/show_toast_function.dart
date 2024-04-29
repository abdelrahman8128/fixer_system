import 'package:flutter/material.dart';
void showToast(context,String text,) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

            content: Text('${text}'),

            duration: const Duration(seconds: 5),
            backgroundColor: Colors.grey,

        ),
    );
