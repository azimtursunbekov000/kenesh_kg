class DeputiesModel {
  final int id;
  final String fullName;
  final String pathToImage;
  final String? phone;
  final String? email;
  final int? faction;

  DeputiesModel({
    required this.id,
    required this.fullName,
    required this.pathToImage,
    required this.phone,
    required this.email,
    required this.faction,
  });
}
