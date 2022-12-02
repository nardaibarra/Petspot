import 'package:cloud_firestore/cloud_firestore.dart';

class Forms {
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;
  Future<List<String>> getSpecies(String form) async {
    List<String> SpeciesDocs = [];
    var SpeciesDataQuery = await _fireBaseStore.collection('especies').get();
    SpeciesDocs = SpeciesDataQuery.docs.map((doc) => doc.id).toList();
    if (form == 'filters') {
      SpeciesDocs.add('todas');
    }
    print(SpeciesDocs);
    return SpeciesDocs;
  }

  Future<List<String>> getBreeds(String specie, String form) async {
    if (specie == 'todas') {
      return ['todas'];
    }
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
      if (form == 'filters') {
        breeds.add('todas');
      }

      return breeds;
    } catch (e) {
      print('aquiaa');
      print(e);
      return [''];
    }
  }

  Future<List<String>> getColors(String specie) async {
    print(specie);
    if (specie == 'todas') {
      try {
        var catsDoc = await FirebaseFirestore.instance
            .collection("colores")
            .doc('todos')
            .get();
        List<dynamic> data = await catsDoc.get('todos');
        List<String> allColors = data.map((s) => s as String).toList();
        print(allColors);
        return allColors;
      } catch (e) {
        print(e);
        return [''];
      }
    }
    try {
      var breedsDoc = await FirebaseFirestore.instance
          .collection("especies")
          .doc(specie)
          .get();
      List<dynamic> data = await breedsDoc.get('colores');
      List<String> colors = data.map((s) => s as String).toList();
      return colors;
    } catch (e) {
      print(e);
      return [''];
    }
  }
}
