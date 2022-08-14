import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movedb/presentation/resources/assets_manger.dart';
import 'package:movedb/presentation/resources/colors_manager.dart';
import 'package:movedb/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer.periodic(const Duration(seconds: 2), _goNext);
  }

  void _goNext(Timer t) {
    Navigator.pushReplacementNamed(context, Routes.mainRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image(image: AssetImage(ImageAssets.splashLogo))));
  }
}
