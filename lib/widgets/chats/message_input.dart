// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constant/app_color.dart';
// import '../../controller/chat_detail_controller.dart';
//
// class MessageInput extends StatelessWidget {
//   const MessageInput({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ChatDetailScreenController>();
//
//     return TextFormField(
//       controller: controller.messageController,
//       focusNode: controller.focusNode,
//       minLines: 1,
//       maxLines: 5,
//       onChanged: controller.changeInput,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColor.white,
//         hint: Text("Type a message",style: TextStyle(fontSize: 13),),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: BorderSide.none,
//         ),
//         prefixIcon: IconButton(
//           icon: const Icon(Icons.emoji_emotions),
//           onPressed: controller.toggleEmoji,
//         ),
//         suffixIcon: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // IconButton(
//             //   icon: const Icon(Icons.attach_file),
//             //   onPressed: () => Get.bottomSheet(
//             //     BottomSheetWidget(controller: controller),
//             //     backgroundColor: Colors.transparent,
//             //   ),
//             // ),
//             if (!controller.isSend.value) const Icon(Icons.camera_alt),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // class BottomSheetWidget extends StatelessWidget {
// //   final ChatDetailScreenController controller;
// //   const BottomSheetWidget({super.key, required this.controller});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.all(15),
// //       padding: const EdgeInsets.symmetric(vertical: 20),
// //       decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
// //       child: Wrap(
// //         alignment: WrapAlignment.center,
// //         spacing: 50,
// //         runSpacing: 20,
// //         children: controller.bottomSheetItems.map((item) {
// //           return BottomIcon(
// //             text: item["text"] as String,
// //             icon: item["icon"] as IconData,
// //             color: item["color"] as Color,
// //             onTap: item["function"] as VoidCallback,
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }
// // }
//
// // class BottomIcon extends StatelessWidget {
// //   final String text;
// //   final IconData icon;
// //   final Color color;
// //   final VoidCallback onTap;
// //   const BottomIcon({super.key, required this.text, required this.icon, required this.color, required this.onTap});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return InkWell(
// //       onTap: onTap,
// //       child: Column(
// //         children: [
// //           CircleAvatar(radius: 30, backgroundColor: color, child: Icon(icon, color: AppColor.white)),
// //           const SizedBox(height: 6),
// //           Text(text, style: const TextStyle(fontSize: 13)),
// //         ],
// //       ),
// //     );
// //   }
// // }