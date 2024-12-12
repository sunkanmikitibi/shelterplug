class PropertyCategory {

  String title;
  String? description;

  PropertyCategory(
    this.title,
    this.description
  );

  static List<PropertyCategory> allCategory = [
    PropertyCategory("Rent", "Rent"),
    PropertyCategory("Buy", "Buy Properties"),
    PropertyCategory("Shortlets", "Shortlets"),
    PropertyCategory("PG/Co-Living", "PG/Co-Living"),
    PropertyCategory("Land", "land"),
  ];

}