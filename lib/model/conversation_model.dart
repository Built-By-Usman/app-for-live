import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationModel {
  final String user1Id;
  final String user2Id;
  final bool? isSeen;
  final String? photoUrl;
  final String? lastMessage;
  final DateTime? lastMessageTime;
  final String? senderId;

  ConversationModel({
    required this.user1Id,
    required this.user2Id,
    this.photoUrl,
    this.lastMessage,
    this.isSeen,
    this.lastMessageTime,
    this.senderId
  });

  factory ConversationModel.fromJson(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Convert last_message_time safely
    DateTime? lastMessageTime;
    if (data['last_message_time'] != null) {
      final timestamp = data['last_message_time'];
      if (timestamp is Timestamp) {
        lastMessageTime = timestamp.toDate();
      } else if (timestamp is DateTime) {
        lastMessageTime = timestamp;
      }
    }

    return ConversationModel(
      user1Id: data['user1_id'] ?? "",
      user2Id: data['user2_id'] ?? "",
      photoUrl: data['photo_url'],
      isSeen: data['is_seen'],
      lastMessage: data['last_message'],
      lastMessageTime: lastMessageTime,
      senderId: data['sender_id'],
    );
  }
  /// Convert ConversationModel to Map for Firestore
  Map<String, dynamic> toJson() {
    return {
      'user1_id': user1Id,
      'user2_id': user2Id,
      'is_seen':isSeen,
      'photo_url': photoUrl,
      'last_message': lastMessage,
      'sender_id':senderId,
      'last_message_time': lastMessageTime != null
          ? Timestamp.fromDate(lastMessageTime!)
          : null,
    };
  }
}