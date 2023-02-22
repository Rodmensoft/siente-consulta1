import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';

class PageViewButton extends StatelessWidget {
  const PageViewButton({
    Key? key,
    @required this.text,
    @required this.image,
    @required this.active,
    this.onPressed,
  }) : super(key: key);
  final String? text;
  final String? image;
  final bool? active;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.sp,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: !active!
                ? Colors.white.withOpacity(0.1)
                : Colors.white.withOpacity(0.0),
            shadowColor: Colors.white.withOpacity(0.06),
            animationDuration: const Duration(seconds: 1),
            backgroundColor: active!
                ? Colors.white.withOpacity(0.2)
                : Colors.white.withOpacity(0.0),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image!,
                width: 20.sp,
                height: 20.sp,
              ),
              SizedBox(width: 10.86.sp),
              Text(
                text ?? '',
                style: GoogleFonts.mulish(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}

class PageViewButtonsRow extends StatelessWidget {
  const PageViewButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GetBuilder<HomeController>(
        id: 'pageview_controller',
        builder: (_) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 5.sp,
              horizontal: 13.sp,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white.withOpacity(0.1),
            ),
            height: 40.sp,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: PageViewButton(
                    image: 'assets/new/home/map_marker.png',
                    text: 'Mapa',
                    active: _.currentPageViewIndex == 0,
                    onPressed: () => _.onChangePageView(0),
                  ),
                ),
                Expanded(
                  child: PageViewButton(
                    image: 'assets/new/home/list.png',
                    text: 'Lista',
                    active: _.currentPageViewIndex == 1,
                    onPressed: () => _.onChangePageView(1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
