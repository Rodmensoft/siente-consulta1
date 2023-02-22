import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:siente_app/app/data/models/sample_data.dart';
import 'package:siente_app/app/ui/global_widgets/fadein_top_edge.dart';
import 'package:siente_app/app/ui/pages/home_page/home_controller.dart';
import 'package:siente_app/app/ui/pages/home_page/local_widgets/page_view_button.dart';
import 'package:siente_app/app/ui/pages/home_page/local_widgets/search_row.dart';
import 'package:siente_app/app/ui/pages/home_page/local_widgets/summary.dart';
import 'package:siente_app/app/ui/pages/listview_page/listview_page.dart';
import 'package:siente_app/app/ui/pages/mapview_page/mapview_page.dart';
import 'package:siente_app/app/ui/pages/mapview_page/marker_widget.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const color2 = Color(0xffE2EFF9);
    return Scaffold(
      backgroundColor: color2,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Obx(() {
              var initialCategories2 =
                  Get.find<HomeController>().initialCategories;
              return SizedBox.expand(
                child: Column(
                  children: <Widget>[
                    ...initialCategories2.map(
                      (CategoryData e) => MarkerToWidget(
                        color: e.color!,
                        image: 'assets/new/home/${e.codigoCategoria}.png',
                        key: e.key,
                      ),
                    )
                  ],
                ),
              );
            }),
            SizedBox.expand(
              child: Container(
                color: color2,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    gradient: ColorTheme.splashGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 11.46.sp, bottom: 17.sp),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      SafeArea(child: SizedBox(height: 40.sp)),
                      const SearchRow(),
                      const PageViewButtonsRow(),
                    ],
                  ),
                ),
                const IndicadoresList(),
                const CategoriesList(),
                Container(
                  color: Colors.transparent,
                  height: 14.02.sp,
                ),
                Expanded(
                  child: GetBuilder<HomeController>(
                    id: 'page_view',
                    builder: (_) {
                      return _.currentPageViewIndex == 0
                          ? const MapViewPage()
                          : const ListViewPage();
                    },
                  ),
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(top: 20.sp),
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.dashboard_sharp,
                                size: 30.sp,
                                color: ColorTheme.primaryTint,
                              ),
                              Text(
                                'Dashboard',
                                style: GoogleFonts.mulish(
                                  fontSize: 12.sp,
                                  color: ColorTheme.primaryTint,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GetBuilder<HomeController>(
                            builder: (_) {
                              return InkWell(
                                onTap: () => _.openLogoutDialog(),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.logout_outlined,
                                      size: 30.sp,
                                      color: ColorTheme.medium,
                                    ),
                                    Text(
                                      'Logout',
                                      style: GoogleFonts.mulish(
                                        fontSize: 12.sp,
                                        color: ColorTheme.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IndicadoresList extends StatelessWidget {
  const IndicadoresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'indicators',
      builder: (_) {
        return Marquee(
          animationDuration: const Duration(milliseconds: 5800),
          child: Container(
            color: Colors.white,
            height: 80.sp,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: SummaryData.sampleSummary.length,
              itemBuilder: (BuildContext context, int index) {
                final SummaryData data = SummaryData.sampleSummary[index];
                return GlobalIndicatorsWidget(
                  image: data.image!,
                  amount: data.value!,
                  name: data.name!,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'categories',
      builder: (_) {
        return Container(
          color: Colors.transparent,
          height: 125.sp,
          child: FadeInEdgesHorizontal(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _.initialCategories.length,
              itemBuilder: (BuildContext context, int index) {
                final CategoryData data = _.initialCategories[index];
                return CategoryCard(
                    data: data,
                    index: index,
                    type: _.type,
                    onTap: () => _.onChangeCategory(index));
              },
            ),
          ),
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
    required this.type,
  });

  final CategoryData data;
  final int index;
  final void Function() onTap;
  final bool type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.47.r),
            boxShadow: !data.isSelected
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.r,
                      offset: Offset(3.sp, 5.sp),
                    ),
                  ],
          ),
          height: 104.sp,
          margin: EdgeInsets.only(
            left: index == 0 ? 15.sp : 0,
            right: 5.85.sp,
            top: 5.sp,
            bottom: 5.sp,
          ),
          width: 99.sp,
          child: Material(
            color: data.color,
            child: InkWell(
              onTap: onTap,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 13.sp),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      height: 45.28.sp,
                      width: 50.28.sp,
                      color: Colors.black.withOpacity(0.07),
                      child: Center(
                        child: Image.asset(
                          data.image!,
                          height: data.height!.sp,
                          width: data.width!.sp,
                        ),
                      ),
                    ),
                  ),
                  if (type) SizedBox(height: 6.52.sp),
                  if (!type) const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 32.85.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: type ? Colors.transparent : Colors.white,
                    ),
                    child: Text(
                      type
                          ? data.nombreCamelCase
                          : data.nombreCamelCase.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w700,
                        color: type ? Colors.white : const Color(0xff666666),
                        fontSize: type ? 11.72.sp : 12.sp,
                      ),
                    ),
                  ),
                  if (type) SizedBox(height: 4.2.sp),
                ],
              ),
            ),
          ),
        ),
        if (type) SelectedCategoryUnderline(data: data, index: index),
      ],
    );
  }
}

class SelectedCategoryUnderline extends StatelessWidget {
  const SelectedCategoryUnderline({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final CategoryData data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: index == 0 ? 15.sp : 0,
        right: 5.85.sp,
        top: 3.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5.47.r),
          bottomRight: Radius.circular(5.47.r),
        ),
        color: data.isSelected ? data.color : Colors.transparent,
      ),
      height: 3.sp,
      width: 99.sp,
    );
  }
}
