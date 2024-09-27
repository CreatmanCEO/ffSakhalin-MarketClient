import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'place_component_model.dart';
export 'place_component_model.dart';

class PlaceComponentWidget extends StatefulWidget {
  const PlaceComponentWidget({
    super.key,
    required this.restoran,
  });

  final RestoranRecord? restoran;

  @override
  State<PlaceComponentWidget> createState() => _PlaceComponentWidgetState();
}

class _PlaceComponentWidgetState extends State<PlaceComponentWidget>
    with TickerProviderStateMixin {
  late PlaceComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceComponentModel());

    animationsMap.addAll({
      'carouselOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 1500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      height: 270.0,
      child: Stack(
        children: [
          if (widget!.restoran!.imageCart.length > 1)
            Builder(
              builder: (context) {
                final imageCar = widget!.restoran?.imageCart?.toList() ?? [];

                return Container(
                  width: double.infinity,
                  height: 270.0,
                  child: CarouselSlider.builder(
                    itemCount: imageCar.length,
                    itemBuilder: (context, imageCarIndex, _) {
                      final imageCarItem = imageCar[imageCarIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: imageCarItem,
                          width: double.infinity,
                          height: 270.0,
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
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      autoPlayInterval: Duration(milliseconds: (2000 + 4000)),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, _) =>
                          _model.carouselCurrentIndex = index,
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['carouselOnPageLoadAnimation']!);
              },
            ),
          if (widget!.restoran?.imageCart?.length == 1)
            Container(
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: widget!.restoran!.imageCart.first,
                  width: double.infinity,
                  height: 270.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
