import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_portfolio/globles/app_assets.dart';
import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/globles/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : size.width * 0.15,
        vertical: size.height * 0.1,
      ),
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Intro Text
          Text("Hello, It's me",
              style: AppTextStyle.monteseratStyle(color: Colors.white, width: size.width)),
          Constants.sizedBox(height: 8),
          Text("Daniyal Saleem", style: AppTextStyle.headingStyle()),
          Constants.sizedBox(height: 12),

          // Animated Text
          Row(
            children: [
              Text("And I'm a ",
                  style: AppTextStyle.monteseratStyle(color: Colors.white, width: size.width)),
              AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1000),
                animatedTexts: [
                  TyperAnimatedText('Flutter Developer',
                      textStyle: AppTextStyle.monteseratStyle(color: Colors.lightBlue, width: size.width)),
                  TyperAnimatedText('Graphic Designer',
                      textStyle: AppTextStyle.monteseratStyle(color: Colors.lightBlue, width: size.width)),
                  TyperAnimatedText('Freelancer',
                      textStyle: AppTextStyle.monteseratStyle(color: Colors.lightBlue, width: size.width)),
                ],
              ),
            ],
          ),
          Constants.sizedBox(height: 20),

          // Description
          SizedBox(
            width: isMobile ? double.infinity : size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "I am a Flutter developer with a passion for creating beautiful and functional applications. "
                "I love exploring new technologies and continuously improving my skills.",
                style: AppTextStyle.normalstyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Constants.sizedBox(height: 25),

          // Social Icons & Button
          Wrap(
            spacing: 15,
            runSpacing: 10,
            children: [
              _buildSocialIcon(AppAssets.github, size, "https://github.com/DaniyalDevsinn"), // <-- GitHub
              _buildSocialIcon(AppAssets.linkedIn, size, "https://www.linkedin.com/in/daniyalsaleem786/"), 
              
              Constants.sizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themecolor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    launchUrl(Uri.parse(
                        'https://drive.google.com/file/d/1SbFyOjSVH7OEX7X7JOIKyw0JmE6n7L-s/view?usp=drive_link'));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Resume",
                        style: AppTextStyle.monteseratStyle(color: Colors.white, width: size.width)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, Size size, String url) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: AppColors.themecolor,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.backgroundColor,
          child: Image.asset(
            assetPath,
            height: size.height * 0.04,
            color: AppColors.themecolor,
          ),
        ),
      ),
    );
  }
}
