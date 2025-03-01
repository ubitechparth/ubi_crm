import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubi_crm/core/custom_appbar.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/core_widget/buil_pop_up_menu_button.dart';
import 'package:ubi_crm/core_widget/custom_popup_button.dart';
import 'package:ubi_crm/core_widget/drawer.dart';
import 'package:ubi_crm/core_widget/icon_widget.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/controller/lead_controller.dart';
import 'package:ubi_crm/theme/color_constant.dart';
import 'package:ubi_crm/theme/text_style.dart';

class LeadView extends GetView<LeadController>{
  LeadView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){


    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: AppTextStyle.appBarText( "Leads"),
        leading: IconButton(
            icon:  Icon(Icons.menu,color: AppColor.whiteOriginalColor,),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            }),

      ),
      drawer: getAppDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 12.0,bottom: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryOriginalColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                    child: Row(
                      children: [
                        AppIcons.calendarTodayIcon(color: AppColor.primaryOriginalColor, size: 18),
                        SizedBox(width: 7,),
                        Text("Today",style: AppTextStyle.bodyText4B(color: AppColor.primaryOriginalColor),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AppIcons.searchIcon(),
                      SizedBox(width: 15,),
                      CustomPopUpMenuButton(
                        iconColor: AppColor.blackOriginalColor,
                        itemBuilder: (BuildContext context) {
                          return [
                            BuildPopUpMenuButton(text: 'Lead Owner', onTap: () {},),
                            BuildPopUpMenuButton(text: 'Lead Stages', onTap: () {}, ),
                            BuildPopUpMenuButton(text: 'Lead Status', onTap: () {}, ),
                            BuildPopUpMenuButton(text: 'Ratings', onTap: () {}, ),
                            BuildPopUpMenuButton(text: 'Remarks', onTap: () {}, ),
                            BuildPopUpMenuButton(text: 'Delete', onTap: () {}, ),
                          ];
                        },
                      )
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                  height: Get.height*0.7,
                  child: DataTableExample())
            ],
          ),
        ),
      ),
    );
  }
}

class DataTableExample extends StatelessWidget {
  // Sample data model
  final List<Map<String, String>> _data = [
    {'company': 'Abc Company pvt ltd', 'date': '09 May', 'First Name': 'John Doe', 'product': 'Product A'},
    {'company': 'Ubitech Solution Pvt Ltd Gwalior', 'date': '10 May', 'First Name': 'Jane Smith', 'product': 'Product B'},
    {'company': 'Godrej', 'date': '11 May', 'First Name': 'Mike Johnson', 'product': 'Product C'},
    {'company': 'XYZ Corp', 'date': '12 May', 'First Name': 'Emily Davis', 'product': 'Product D'},
    {'company': 'PQR Ltd', 'date': '13 May', 'First Name': 'David Wilson', 'product': 'Product E'},
    {'company': 'Abc Company', 'date': '14 May', 'First Name': 'John Doe', 'product': 'Product A'},
    {'company': 'Ubitech', 'date': '15 May', 'First Name': 'Jane Smith', 'product': 'Product B'},
    {'company': 'Godrej', 'date': '16 May', 'First Name': 'Mike Johnson', 'product': 'Product C'},
    {'company': 'XYZ Corp', 'date': '17 May', 'First Name': 'Emily Davis', 'product': 'Product D'},
    {'company': 'XYZ Corp', 'date': '17 May', 'First Name': 'Emily Davis', 'product': 'Product D'},
    {'company': 'XYZ Corp', 'date': '17 May', 'First Name': 'Emily Davis', 'product': 'Product D'},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed First Column (Company)
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              border: TableBorder.all(color: AppColor.transparentColor),
              columnSpacing: 0, // Remove spacing between columns
              horizontalMargin: 0,
              headingRowHeight: 20,
              columns: [
                DataColumn(label: _buildHeaderCell('Company')),
              ],
              rows: _data.map((item) {
                return DataRow(

                    cells: [
                  DataCell(
                      _buildDataCell(item['company']!,'Company')),
                ]);
              }).toList(),

            ),
          ),

          // Scrollable Remaining Columns
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 20,
                border: TableBorder.all(color: Colors.transparent),
                columnSpacing: 0, // Remove spacing between columns
                columns: [
                  DataColumn(label: _buildHeaderCell('First Name')),
                  DataColumn(label: _buildHeaderCell('Phone')),
                  DataColumn(label: _buildHeaderCell('Create Date')),
                  DataColumn(label: _buildHeaderCell('Lead Owner')),
                  DataColumn(label: _buildHeaderCell('Lead Stage')),
                  DataColumn(label: _buildHeaderCell('Remarks')),
                  DataColumn(label: _buildHeaderCell('Requirements')),
                  DataColumn(label: _buildHeaderCell('Action')),
                ],
                rows: _data.map((item) {
                  return DataRow(cells: [
                    DataCell(_buildDataCell(item['First Name']!,'')),
                    DataCell(_buildDataCell(item['product']!,'')),
                    DataCell(_buildDataCell(item['date']!,'')),
                    DataCell(_buildDataCell(item['product']!,'')),
                    DataCell(_buildDataCell(item['product']!,'')),
                    DataCell(_buildDataCell(item['product']!,'')),
                    DataCell(_buildDataCell(item['product']!,'')),
                    DataCell(CustomPopUpMenuButton(

                      itemBuilder: (BuildContext context) {
                        return [
                          BuildPopUpMenuButton(text: 'Edit', onTap: () {}, icon: AppIcons().editOutline),
                        ];
                      },
                    )),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Helper method to build header cells with styling
  Widget _buildHeaderCell(String text) {
    return Container(
      width:text=='Company'?140 : 110,
        height:20,
        padding: EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(

    border: text=='Company'?Border(
        right: BorderSide(color: Colors.grey)):Border.all(color: Colors.transparent),),
    child: Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
    ),
    );
    }

  // Helper method to build data cells with styling
  Widget _buildDataCell(String text,String lineText) {
    return InkWell(
      onTap: (){
        Get.toNamed(RouteConstant.leadProfile);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          width: lineText=='Company'?140 : 110, // Allow full width
        decoration: BoxDecoration(
          border: lineText!='Company'? Border(right: BorderSide(color: Colors.transparent)): Border(right: BorderSide(color: Colors.grey)),
        ),
        child:AutoSizeText(
          text,
          maxLines: 2, // Increase this or remove it
          overflow: TextOverflow.visible, // Add this if needed
          style: (lineText == 'Company')
              ? AppTextStyle.bodyText4SB(color: AppColor.primaryOriginalColor, underLine: true)
              : AppTextStyle.bodyText4SB(),
        )
      ),
    );
  }
}