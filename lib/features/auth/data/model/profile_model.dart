// data/models/profile_model.dart


import '../../domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.subscription,
    required super.imageUrl,
    required super.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      phone: json["phone"] as String? ?? "",
      subscription: json["subscription"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      createdAt: json["created_at"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "subscription": subscription,
    "image_url": imageUrl,
    "created_at": createdAt,
  };

  ProfileModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? subscription,
    String? imageUrl,
    String? createdAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      subscription: subscription ?? this.subscription,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ProfileModel.initial() {
    return const ProfileModel(
      id: "",
      name: "",
      phone: "",
      subscription: "",
      imageUrl: "",
      createdAt: "",
    );
  }
}
