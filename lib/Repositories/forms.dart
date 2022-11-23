import 'package:cloud_firestore/cloud_firestore.dart';

class Forms {
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;
  Future<List<String>> getSpecies() async {
    List<String> SpeciesDocs = [];
    var SpeciesDataQuery = await _fireBaseStore.collection('especies').get();
    SpeciesDocs = SpeciesDataQuery.docs.map((doc) => doc.id).toList();
    print(SpeciesDocs);
    return SpeciesDocs;
  }

  Future<List<String>> getBreeds(String specie, String form) async {
    print(specie);
    try {
      var breedsDoc = await FirebaseFirestore.instance
          .collection("especies")
          .doc(specie)
          .get();
      List<dynamic> data = await breedsDoc.get('razas');
      List<String> breeds = data.map((s) => s as String).toList();

      if (form == 'report') {
        breeds.add('No lo sé');
      }
      print(breeds);
      return breeds;
    } catch (e) {
      print(e);
      return [''];
    }
  }

  Future<List<String>> getColors(String specie) async {
    print(specie);
    try {
      var breedsDoc = await FirebaseFirestore.instance
          .collection("especies")
          .doc(specie)
          .get();
      List<dynamic> data = await breedsDoc.get('colores');
      List<String> breeds = data.map((s) => s as String).toList();

      print(breeds);
      return breeds;
    } catch (e) {
      print(e);
      return [''];
    }
  }
}
