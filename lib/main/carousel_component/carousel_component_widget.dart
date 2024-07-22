import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carousel_component_model.dart';
export 'carousel_component_model.dart';

class CarouselComponentWidget extends StatefulWidget {
  const CarouselComponentWidget({
    super.key,
    required this.restoran,
  });

  final RestoranRecord? restoran;

  @override
  State<CarouselComponentWidget> createState() =>
      _CarouselComponentWidgetState();
}

class _CarouselComponentWidgetState extends State<CarouselComponentWidget> {
  late CarouselComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarouselComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.0,
      child: Stack(
        children: [
          if (widget!.restoran!.imageCart.length > 1)
            Builder(
              builder: (context) {
                final imageCar = widget!.restoran?.imageCart?.toList() ?? [];

                return Container(
                  width: double.infinity,
                  height: 220.0,
                  child: CarouselSlider.builder(
                    itemCount: imageCar.length,
                    itemBuilder: (context, imageCarIndex, _) {
                      final imageCarItem = imageCar[imageCarIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageCarItem,
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: max(0, min(1, imageCar.length - 1)),
                      viewportFraction: 1.0,
                      disableCenter: true,
                      enlargeCenterPage: false,
                      enlargeFactor: 0.0,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1),
                      autoPlayInterval: Duration(milliseconds: (1 + 5000)),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                );
              },
            ),
          if (widget!.restoran?.imageCart?.length == 1)
            Container(
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.restoran!.imageCart.isNotEmpty
                      ? widget!.restoran!.imageCart.first
                      : widget!.restoran!.logo,
                  width: double.infinity,
                  height: 220.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
