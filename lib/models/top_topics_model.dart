class TopTopicsModel{

  String imageUri;
  String title;

  TopTopicsModel({required this.imageUri,required this.title});

  @override
  String toString() {
    return 'TopTopicsModel{imageUri: $imageUri, title: $title}';
  }
}