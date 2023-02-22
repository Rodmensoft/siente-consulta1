import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/ui/global_widgets/customed_button.dart';
import 'package:siente_app/app/ui/global_widgets/customed_textfield.dart';
import 'package:siente_app/app/ui/global_widgets/logo.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 13.sp),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Container(
            width: 40.sp,
            height: 40.sp,
            color: Colors.white.withOpacity(0.1),
            child: Center(
              child: LogoImage(
                width: 33.47.sp,
                height: 27.42.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 5.sp),
        Expanded(
          child: GetBuilder<HomeController>(
            id: 'search_field',
            builder: (_) {
              return CustomedTextField(
                focusNode: _.searchFocus,
                controller: _.searchCtrl,
                height: 40.sp,
                hintText: '¿Qué proyecto buscas?',
                imageIcon: 'assets/new/login/search_circle.png',
                keyboardType: TextInputType.text,
                onEditingComplete: () => _.onSearch(),
                style: GoogleFonts.mulish(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13.sp,
                ),
                onTap: _.onSearchTap,
              );
            },
          ),
        ),
        SizedBox(width: 5.sp),
        GetBuilder<HomeController>(
          id: 'search_field',
          builder: (_) {
            return CustomedButton(
              bgColor: ColorTheme.successAlt,
              height: 40.sp,
              width: 100.sp,
              borderRadius: 10.r,
              loading: false,
              text: 'Buscar',
              text2: 'Buscando',
              onPressed: () {
                _.onSearch();
              },
            );
          },
        ),
        SizedBox(width: 12.sp),
      ],
    );
  }
}
