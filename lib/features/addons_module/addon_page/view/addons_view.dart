import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/features/addons_module/myAddons/view/my_addons_page.dart';
import 'package:ubi_crm/features/addons_module/suggestedAddons/view/suggested_addons_page.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

// ignore: must_be_immutable
class AddonsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  RxBool isTabOnTap = false.obs;
  RxInt a=0.obs;
  AddonsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: getAppDrawer(context),
      appBar: CustomAppBar(
        title:AppTextStyle.appBarText( "addonTitle".tr),

        leading: IconButton(
            icon:  Icon(Icons.menu,color: AppColor.whiteOriginalColor,),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            }),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Builder(
            builder: (context){
              final tabController = DefaultTabController.of(context);
              tabController.addListener(() {
                if (isTabOnTap.value) {
                  ++a;
                  if (a%2 == 0) {
                    isTabOnTap.value = false;
                    if (kDebugMode) {
                      print("Index on tap: ${tabController.index}");
                    }
                  }
                } else {
                  if (kDebugMode) {
                    print("Index on tap: ${tabController.index}");
                  }
                }
              });
              return Column(
                children: <Widget>[
                  Material(
                    color: AppColor.primaryOriginalColor.withValues(alpha: 0.03),
                    child: TabBar(
                      indicatorColor: AppColor.primaryOriginalColor,
                      labelColor: AppColor.blackOriginalColor,
                      unselectedLabelColor: AppColor.greyOriginalColor,
                      onTap: (index){
                        isTabOnTap.value = true;
                      },
                      tabs: [
                        Tab(
                            child: Text('myAddonTitle'.tr,
                              textScaler: const TextScaler.linear(1),
                              style: AppTextStyle.heading2B(),)
                        ),
                        Tab(
                            child: Text('suggestedAddonTitle'.tr,
                                textScaler: const TextScaler.linear(1),
                                style: AppTextStyle.heading2B())
                        )
                      ],

                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        const MyAddonsPage(),
                        SuggestedAddonsPage()
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
      //bottomNavigationBar: ,
    );
  }
}
