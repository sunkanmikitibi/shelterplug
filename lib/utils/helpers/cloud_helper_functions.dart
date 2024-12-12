
import 'package:flutter/material.dart';

class TCloudHelperFunctions {
  static Widget? checkingSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if(!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Property Found'),
      );
    }

    if(snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong...Please Try again'),
      );
    }

    return null;
  }
}