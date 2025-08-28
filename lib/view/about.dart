import 'package:final_portfolio/globles/app_assets.dart';
import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/globles/constants.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      color: AppColors.themecolor,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About Me",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.themecolor,
              fontFamily: AppTextStyle.headertextstyle().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          Constants.sizedBox(height: 20),

          // ✅ Responsive Layout
          isMobile
              ? Column(
                  children: [
                    _buildTextSection(size),
                    Constants.sizedBox(height: 20),
                    _buildImageSection(isMobile, size),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildImageSection(isMobile, size),
                    const SizedBox(width: 30),
                    Expanded(child: _buildTextSection(size)),
                  ],
                ),
        ],
      ),
    );
  }


  Widget _buildTextSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Flutter Developer",
          style: AppTextStyle.monteseratStyle(color: Colors.white, width: size.width).copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        Constants.sizedBox(height: 10),
        Text(
          "I am a Flutter developer with a passion for creating beautiful and functional mobile applications. "
          "I love to explore new technologies and continuously improve my skills.",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.secondaryColor,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }


  Widget _buildImageSection(bool isMobile, Size size) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor, 
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: isMobile ? size.width * 0.3 : size.width * 0.12,
        backgroundColor: AppColors.themecolor,
        child: ClipOval(
          child: Image.asset(
            AppAssets.my,
            fit: BoxFit.fitHeight, // ✅ Preserved your original fit
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
