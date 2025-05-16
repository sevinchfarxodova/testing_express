// domain/entities/profile_entity.dart
class ProfileEntity {
  final String id;
  final String name;
  final String phone;
  final String subscription;
  final String imageUrl;
  final String createdAt;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.subscription,
    required this.imageUrl,
    required this.createdAt,
  });
}
