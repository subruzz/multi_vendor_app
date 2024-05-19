import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mutli_vendor_app/provider/banner_controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BannerProvider>(context, listen: false).fetchBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, bannerProvider, child) {
        if (bannerProvider.banners.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow.shade900,
          ),
          child: PageView.builder(
            itemCount: bannerProvider.banners.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: Container(
                          width: 200.0,
                          height: 100.0,
                        )),
                  ),
                  imageUrl: bannerProvider.banners[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
