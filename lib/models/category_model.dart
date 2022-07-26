class CategoryModel{

  String name;
  String imageUri;
  String completion;

  CategoryModel({required this.name,required this.imageUri,required this.completion});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUri': imageUri,
      'completion': completion,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{name: $name, imageUri: $imageUri, completion: $completion}';
  }
}