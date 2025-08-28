import 'package:flutter/material.dart';
import 'package:final_portfolio/globles/app_colors.dart';
import 'package:final_portfolio/globles/app_text_style.dart';
import 'package:final_portfolio/globles/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
            "Contact Me",
            style: TextStyle(
              fontSize: 30,
              color: AppColors.themecolor,
              fontFamily: AppTextStyle.monteseratStyle(
                width: 10,
                color: Colors.white,
              ).fontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          Constants.sizedBox(height: 30),

          // Form Section
          SizedBox(
            width: isMobile ? double.infinity : size.width * 0.6,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("Your Name", _nameController),
                  Constants.sizedBox(height: 15),
                  _buildTextField("Your Email", _emailController),
                  Constants.sizedBox(height: 15),
                  _buildTextField("Your Message", _messageController, maxLines: 5),
                  Constants.sizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themecolor,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    ),
                    onPressed: _sendMessage,
                    child: Text(
                      "Send Message",
                      style: AppTextStyle.monteseratStyle(
                        color: Colors.white,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Constants.sizedBox(height: 40),

          // Contact Info
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 20,
            children: [
              _buildContactInfo(
                Icons.email,
                "Email",
                "daniyaldevsinn@gmail.com",
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: "daniyaldevsinn@gmail.com",
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  }
                },
              ),
              _buildContactInfo(
                Icons.phone,
                "Phone",
                "+92 305 8406026",
                onTap: () async {
                  final Uri phoneUri = Uri(
                    scheme: 'tel',
                    path: "+923058406026",
                  );
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  }
                },
              ),
              _buildContactInfo(
                Icons.location_on,
                "Location",
                "Lahore, Pakistan",
                onTap: () async {
                  final Uri mapUri = Uri.parse(
                    "https://www.google.com/maps/search/?api=1&query=Lahore,Pakistan",
                  );
                  if (await canLaunchUrl(mapUri)) {
                    await launchUrl(mapUri, mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// FIXED: Now supports onTap
  Widget _buildContactInfo(
    IconData icon,
    String title,
    String detail, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.themecolor, size: 28),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.monteseratStyle(
                  color: AppColors.secondaryColor,
                  width: 200,
                ).copyWith(fontSize: 16),
              ),
              Text(
                detail,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.secondaryColor),
        filled: true,
        fillColor: Colors.grey.shade900,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint cannot be empty";
        }
        return null;
      },
    );
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message Sent Successfully")),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }
}
