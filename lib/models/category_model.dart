class CategoryModel{

  String imageUri;
  String title;
  bool favourite;

  CategoryModel({required this.title,required this.imageUri,required this.favourite});

  @override
  String toString() {
    return 'CategoryModel{imageUri: $imageUri, title: $title, favourite: $favourite}';
  }
}