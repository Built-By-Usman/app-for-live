import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class CustomContactItem extends StatelessWidget {
  final String phoneNumber;
  final String? about;
  final String? photoUrl;
  final VoidCallback? onTap;

  const CustomContactItem({
    super.key,
    required this.phoneNumber,
    this.about,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: AppColor.blueGrey200,
        backgroundImage:
        photoUrl != null && photoUrl!.isNotEmpty ? NetworkImage(photoUrl!) : null,
        child: photoUrl == null || photoUrl!.isEmpty
            ? const Icon(Icons.person, size: 25, color: AppColor.white)
            : null,
      ),
      title: Text(
        phoneNumber,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: about != null
          ? Text(
        about!,
        style:
        const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      )
          : null,
    );
  }
}