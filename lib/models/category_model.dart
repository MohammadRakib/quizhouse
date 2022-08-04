class CategoryModel{

  int id;
  String name;
  String imageUri;

  CategoryModel({this.id = 0, required this.name,required this.imageUri});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUri': imageUri,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{name: $name, imageUri: $imageUri}';
  }
}