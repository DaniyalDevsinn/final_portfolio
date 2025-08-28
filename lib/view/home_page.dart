import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/view/about.dart';
import 'package:final_portfolio/view/contact.dart';
import 'package:final_portfolio/view/home.dart';
import 'package:final_portfolio/view/projects.dart';
import 'package:final_portfolio/view/service.dart';
import 'package:flutter/material.dart';

final navItems = {
  "Home": homeKey,
  "About": aboutKey,
  "Service": serviceKey,
  "Portfolio": projectsKey,
  "Contact": contactKey,
};


final homeKey = GlobalKey();
final aboutKey = GlobalKey();
final serviceKey = GlobalKey();
final projectsKey = GlobalKey();
final contactKey = GlobalKey();


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  ScrollController? get _scrollController => null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.secondaryColor,
        elevation: 4,
        title: Text("Portfolio", style: AppTextStyle.headertextstyle()),
        actions: [
  if (!isMobile)
    Row(
      children: navItems.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () => scrollToSection(entry.value),
            child: Text(entry.key, style: AppTextStyle.headertextstyle()),
          ),
        );
      }).toList(),
    )
]

      ),

   
      drawer: isMobile
          ? Drawer(
              backgroundColor: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerHeader(
                    child: Text("Menu",
                        style: AppTextStyle.headertextstyle()
                            .copyWith(fontSize: 24)),
                  ),
                 ...navItems.entries.map((entry) => ListTile(
  title: Text(entry.key,
      style: AppTextStyle.headertextstyle().copyWith(fontSize: 18)),
  onTap: () {
    Navigator.pop(context); // Close Drawer
    scrollToSection(entry.value);
  },
))
                ],
              ),
            )
          : null,
body: SingleChildScrollView(
  controller: _scrollController,
  child: Column(
    children: [
      Container(key: homeKey, child: const Home()),
      Container(key: aboutKey, child: const About()),
      Container(key: serviceKey, child: const Service()),
      Container(key: projectsKey, child: const Projects()),
      Container(key: contactKey, child: const Contact()),
    ],
  ),
),

    );
  }
}


void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}



