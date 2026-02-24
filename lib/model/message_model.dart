import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String conversationId;
  final String senderId;
  final String receiverId;
  final String? content;
  final String? mediaUrl;
  final DateTime timestamp;
  final bool isSeen;

  MessageModel({
    required this.conversationId,
    required this.senderId,
    required this.receiverId,
    this.content,
    this.mediaUrl,
    DateTime? timestamp,
    this.isSeen = false,
  }) : timestamp = timestamp ?? DateTime.now();


  MessageModel copyWith({
    String? conversationId,
    String? senderId,
    String? receiverId,
    String? content,
    DateTime? timestamp,
    bool? isSeen,
  }) {
    return MessageModel(
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isSeen: isSeen ?? this.isSeen,
    );
  }

  /// Factory constructor to create a MessageModel from JSON
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      conversationId: json['conversation_id'] ?? 0,
      senderId: json['sender_id'] ?? 0,
      receiverId: json['receiver_id'] ?? 0,
      content: json['content'],
      mediaUrl: json['media_url'],
      timestamp: json['timestamp'] != null
          ? (json['timestamp'] is Timestamp
          ? (json['timestamp'] as Timestamp).toDate()
          : DateTime.parse(json['timestamp']))
          : DateTime.now(),
      isSeen: json['is_seen'] ?? false,
    );
  }

  /// Convert MessageModel to JSON for Firestore or API
  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'content': content,
      'media_url': mediaUrl,
      'timestamp': Timestamp.fromDate(timestamp),
      'is_seen': isSeen,
    };
  }
}