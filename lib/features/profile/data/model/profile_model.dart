class ProfileModel {
  final String id;
  final String name;
  final String phone;
  final String subscription;
  final String imageUrl;
  final String createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.subscription,
    required this.imageUrl,
    required this.createdAt,
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

  factory ProfileModel.initial() {
    return ProfileModel(
      id: "",
      name: "",
      phone: "",
      subscription: "",
      imageUrl: "",
      createdAt: "",
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "image_url": imageUrl};

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
}
