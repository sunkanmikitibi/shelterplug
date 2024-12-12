
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realestateapi/features/realestate/models/property_model.dart';


class PropertyService {

  final _firestoredb = FirebaseFirestore.instance;

  late final CollectionReference _featuredSaleProperties;

  PropertyService() {
    _featuredSaleProperties = _firestoredb.collection('Propertys').withConverter<PropertyModel>(
      fromFirestore: (snapshots, _) => PropertyModel.fromJson(snapshots.data()!), 
      toFirestore: (property, _) => property.toJson()
      );
  }

  Stream<QuerySnapshot> getFeaturedProperties() {
    return _featuredSaleProperties.snapshots();
  }

  void addProperty(PropertyModel property) async {
    _featuredSaleProperties.add(property);
  }
}