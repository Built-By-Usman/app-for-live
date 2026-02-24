import 'conversation_model.dart';

class ChatModel {
  final String otherUserId;
  final String name;
  final String? profilePicture;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isSeen;
  final ConversationModel conversation;



  ChatModel({
    required this.otherUserId,
    required this.name,
    this.profilePicture,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isSeen,
    required this.conversation
  });
}