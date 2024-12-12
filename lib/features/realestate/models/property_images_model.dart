class PropertyImagesModel {
  String? title;
  final List<String>? imageUrl;

  PropertyImagesModel({
     this.title,
     this.imageUrl,
  });

  toJson() {
    return {
      'Title': title,
      'Images': imageUrl,
    };
  }

  factory PropertyImagesModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    
    return PropertyImagesModel(title: data.containsKey('Title') ? data['Title'] : '',
        imageUrl: List<String>.from(data['Images']));
  }
}
