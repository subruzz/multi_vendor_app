import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _banners = [];
  void getBanner() async {
    final List<String> getBanners = [];
    final QuerySnapshot value =
        await _firestore.collection('banners').get();

    for (var element in value.docs) {
      getBanners.add(element['image']);
    }

    setState(() {
      _banners = List.from(getBanners);
    });
  }

  @override
  void initState() {
    getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow.shade900,
      ),
      child: PageView.builder(
        itemCount: _banners.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              _banners[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
