// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weatherapp/utils/colors.dart';

class SearchField extends StatelessWidget {
  Widget? prefix;
  Function? onChange;
  TextEditingController? controller;
  String? placeholder;

  SearchField({
    super.key,
    this.prefix,
    this.onChange,
    this.controller,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: lightColor),
      width: double.infinity,
      child: TextField(
        autofocus: true,
        controller: controller,
        onChanged: (value) => onChange!(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefix,
          hintText: placeholder ?? 'Search',
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        ),
      ),
    );
  }
}
