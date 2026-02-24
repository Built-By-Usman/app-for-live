import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../model/chat_model.dart';
import '../../../widgets/spacer/spacer.dart';

class CustomChatCard extends StatelessWidget {
  final ChatModel chatModel;
  final VoidCallback onTap;
  final Widget? profileWidget;

  const CustomChatCard({
    super.key,
    required this.chatModel,
    required this.onTap,
    this.profileWidget,
  });

  @override
  Widget build(BuildContext context) {
    final bool isUnread = chatModel.isSeen != true &&
        chatModel.conversation.senderId != FirebaseAuth.instance.currentUser!.uid;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Row(
          children: [
            /// -------- Profile Avatar ----------
            profileWidget ??
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: AppColor.primary,
                  child: const Icon(Icons.person, size: 28, color: AppColor.white),
                ),

            const HorizontalSpacer(1.5),

            /// -------- Name & Last Message ----------
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name + Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          chatModel.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (chatModel.lastMessage.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              TimeOfDay.fromDateTime(chatModel.lastMessageTime)
                                  .format(context),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: isUnread ? AppColor.primary : AppColor.blueGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (isUnread)
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  shape: BoxShape.circle,
                                ),
                              )
                          ],
                        ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  /// Last message + read receipt
                  Row(
                    children: [
                      if (chatModel.lastMessage.isNotEmpty &&
                          chatModel.conversation.senderId ==
                              FirebaseAuth.instance.currentUser!.uid)
                        Icon(Icons.done_all,
                          size: 16,
                          color: chatModel.isSeen ? Colors.blue : AppColor.blueGrey,
                        ),
                      if (chatModel.lastMessage.isNotEmpty &&
                          chatModel.conversation.senderId ==
                              FirebaseAuth.instance.currentUser!.uid)
                        const HorizontalSpacer(0.3),
                      Flexible(
                        child: Text(
                          chatModel.lastMessage,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                            isUnread ? FontWeight.bold : FontWeight.w400,
                            color: isUnread ? AppColor.black : AppColor.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}