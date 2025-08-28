import 'package:flutter/material.dart';
import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/globles/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  final List<Map<String, String>> projects = const [
    {
      "title": "Portfolio Website",
      "description": "A personal portfolio built with Flutter Web.",
      "image": "assets/portfolio.png",
      "codeLink": "https://github.com/yourusername/portfolio",
      "liveLink": "https://daniyaldevsinn.github.io/Portfolio/"
    },
    {
      "title": "Weather App",
      "description": "A Flutter weather app using OpenWeather API.",
      "image": "assets/weather.png",
      "codeLink": "https://github.com/yourusername/weather-app",
      "liveLink": ""
    },
    {
      "title": "E-Commerce UI",
      "description": "Flutter-based modern e-commerce UI design.",
      "image": "assets/ecommerce.png",
      "codeLink": "https://github.com/yourusername/ecommerce-ui",
      "liveLink": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Projects",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.themecolor,
              fontFamily:
                  AppTextStyle.monteseratStyle(width: 10, color: Colors.white)
                      .fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          Constants.sizedBox(height: 30),

          // Projects Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = isMobile ? 1 : 3;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themecolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Center(
              child: Image.asset(
                project["image"]!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  project["title"]!,
                  style: AppTextStyle.monteseratStyle(
                      color: Colors.white, width: 200)
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Constants.sizedBox(height: 8),
                Text(
                  project["description"]!,
                  style: TextStyle(color: AppColors.secondaryColor, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                Constants.sizedBox(height: 12),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (project["liveLink"]!.isNotEmpty)
                      const SizedBox(width: 10),
                    if (project["liveLink"]!.isNotEmpty)
                      _buildButton("Live Demo", project["liveLink"]!),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, String url) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themecolor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Text(
        text,
        style: AppTextStyle.normalstyle(),
      ),
    );
  }
}
