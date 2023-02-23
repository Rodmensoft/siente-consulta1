import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/data/models/design/drowpdown_card.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/count_down_widget.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/list_additional_info_card.dart';
import 'package:siente_app/app/ui/pages/details_page/local_widgets/proyect_card_info.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

import 'details_controller.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.sp,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        color: ColorTheme.bgScaffold,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 164.sp,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: ColorTheme.primaryTint,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 17.sp),
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 22.sp,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 75.sp),
                        ProjectInfoCard(
                          image: controller.detallesProyecto!.urlImageProyecto,
                          title: controller.detallesProyecto!.nombreproyecto,
                          text: controller.detallesProyecto!.objetoproyecto,
                          budget: controller.detallesProyecto!.valorproyecto,
                          status: controller.detallesProyecto!.estadoproyecto,
                          progress: controller.detallesProyecto!.avanceproyecto,
                        ),
                        SizedBox(height: 15.sp),
                        GetBuilder<DetailsController>(
                          id: 'count_down',
                          builder: (_) {
                            return CountDownWidget(
                                days: '${_.days}',
                                hours: '${_.hours}',
                                minutes: '${_.minutes}',
                                seconds: '${_.seconds}');
                          },
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: const <Widget>[
                                MoreDetailedInfoList(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreDetailedInfoList extends StatelessWidget {
  const MoreDetailedInfoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(
      id: 'details_list',
      builder: (_) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: DropDownCard.listDropDownCards.length,
          itemBuilder: (BuildContext context, int index) {
            final DropDownCard data = DropDownCard.listDropDownCards[index];
            final EdgeInsets edgeInsets = EdgeInsets.symmetric(
              horizontal: 15.sp,
              vertical: 5.sp,
            );
            final BorderRadius borderRadius2 = BorderRadius.circular(
              10.sp,
            );

            return Column(
              children: <Widget>[
                if (index == 0) SizedBox(height: 19.64.sp),
                Container(
                  margin: edgeInsets,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius2,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => _.openCloseDropDown(index),
                      child: DropDownCardWidget(
                        content: data.content,
                        title: data.title,
                        icon: data.icon,
                        isOpen: data.isOpen,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: data.isOpen,
                  child: Container(
                    margin: edgeInsets,
                    child: additionalInfoCard(_.detallesProyecto)[index],
                  ),
                ),
                if (index == DropDownCard.listDropDownCards.length - 1)
                  SizedBox(height: 19.64.sp),
              ],
            );
          },
        );
      },
    );
  }
}

class DropDownCardWidget extends StatelessWidget {
  const DropDownCardWidget({
    Key? key,
    this.icon,
    this.title,
    this.content,
    this.isOpen,
  }) : super(key: key);
  final String? icon;
  final String? title;
  final String? content;
  final bool? isOpen;

  @override
  Widget build(BuildContext context) {
    String arrow;
    arrow = isOpen! ? 'dropup' : 'dropdown';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Row(
        children: <Widget>[
          SizedBox(width: 11.sp),
          Image.asset(
            icon!,
            width: 38.sp,
            height: 38.sp,
          ),
          SizedBox(width: 15.sp),
          Text(
            title!,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: ColorTheme.detailsRating,
            ),
          ),
          const Expanded(child: SizedBox()),
          Image.asset(
            'assets/new/details/$arrow.png',
            width: 12.sp,
            height: 12.sp,
          ),
          SizedBox(width: 20.sp),
        ],
      ),
    );
  }
}
