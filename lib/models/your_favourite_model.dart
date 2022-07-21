class YourFavouriteModel{
   String image;
   String title;
   String completion;

   YourFavouriteModel({required this.image, required this.title, required this.completion});

   @override
  String toString() {
    return 'yourFavouriteModel{image: $image, title: $title, subTitle: $completion}';
  }
}