import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/utils/styles.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            "MAKTABTY",
            style: Styles.textStyle14.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                letterSpacing: 4.w,
                fontSize: 32.sp,
                color: const Color(0xfffbf4ea)),
          ),
        ),
        //Image.asset(AssetsData.logo),
        SizedBox(
          height: 4.h,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var status = prefs.getBool('isLoggedIn') ?? false;
        if (status) {
          Navigator.pushReplacementNamed(context, usersHomeScreen);
        } else {
          Navigator.pushReplacementNamed(context, loginScreen);
        }
      },
    );
  }
}
