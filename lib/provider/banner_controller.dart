import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _banners = [];

  List<String> get banners => _banners;

  Future<void> fetchBanners() async {
    final List<String> getBanners = [];
    final QuerySnapshot value = await _firestore.collection('banners').get();

    for (var element in value.docs) {
      getBanners.add(element['image']);
    }

    _banners = List.from(getBanners);
    notifyListeners();
  }
}
