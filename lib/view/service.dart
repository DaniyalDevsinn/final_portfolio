import 'package:final_portfolio/globles/app_assets.dart';
import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/globles/constants.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ✅ Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.themecolor,
                  fontFamily: AppTextStyle.monteseratStyle(
                          color: AppColors.themecolor, width: 30)
                      .fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Service",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.secondaryColor,
                  fontFamily: AppTextStyle.headingStyle().fontFamily,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 20),

          // ✅ Responsive Layout
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: <Widget>[
              InkWell(onTap: () {},
                child: _buildServiceCard(
                    AppAssets.analytics, "Data Analysis", size, isMobile),
              ),
              InkWell(onHover: (value) => {},
                onTap: () {},
                child: _buildServiceCard(
                    AppAssets.brushStroke, "Graphic Design", size, isMobile),
              ),
              InkWell(
                onTap: () {},
                child: _buildServiceCard(
                    AppAssets.coding, "App Development", size, isMobile),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
      String asset, String title, Size size, bool isMobile) {
    return Container(
      width: isMobile ? size.width * 0.8 : size.width * 0.25,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.backgroundColor.withOpacity(0.5)  ,
            AppColors.themecolor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.themecolor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(5, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset, height: 60, fit: BoxFit.contain),
          const SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyle.monteseratStyle(
                color: AppColors.secondaryColor, width: size.width),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
