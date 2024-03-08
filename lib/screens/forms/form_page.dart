import 'package:flutter/material.dart';
import 'package:niamcity/donnee_fixes/couleurs.dart';
import 'package:niamcity/donnee_fixes/categories.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../models/categorie.dart';
import '../../models/type_element.dart';

// ignore: camel_case_types
class Creation_page extends StatelessWidget {
  const Creation_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'création ',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w400, color: Couleurs.c),
        ),
      ),
      body: const Entreprise(),
    );
  }
}

class Entreprise extends StatefulWidget {
  const Entreprise({super.key});

  @override
  State<Entreprise> createState() => _EntrepriseState();
}

class _EntrepriseState extends State<Entreprise> {
  final picker = ImagePicker();
  PickedFile? _pickedImage; // Stockez l'image sélectionnée ici.
  bool _showImagePicker =
      false; // Pour afficher ou masquer le tableau de choix.
  ImageCropper imageCropper = ImageCropper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _quantiteController = TextEditingController();
  Categorie categorieSelectionnee = categories[0];
  TypeElement typeSelectionne = categories[0].types[0];

  Future<void> _getImage() async {
    final pickedFile = await showDialog<PickedFile>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choisir une image"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Caméra"),
                  onTap: () async {
                    final picked = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (picked != null) {
                      final croppedImage =
                          await _cropImage(picked as PickedFile);
                      Navigator.of(context).pop(croppedImage);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text("Galerie"),
                  onTap: () async {
                    final picked = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (picked != null) {
                      final croppedImage =
                          await _cropImage(picked as PickedFile);
                      Navigator.of(context).pop(croppedImage);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _showImagePicker = false; // Masquer le tableau de choix.
                });
                Navigator.of(context).pop(); // Fermer le dialogue.
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
  }

  Future<PickedFile?> _cropImage(PickedFile pickedFile) async {
    final croppedFile = await imageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatio:
          CropAspectRatio(ratioX: 1, ratioY: 1), // Par exemple, un rapport 1:1
      compressQuality: 100,
      maxHeight: 500,
      maxWidth: 500,
    );

    if (croppedFile != null) {
      return PickedFile(croppedFile.path);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? dropdownStyle = const TextStyle(
        color: Couleurs.b,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold);
    Decoration dropdownDecoration = BoxDecoration(
        color: Couleurs.d, //background color of dropdown button
        border: Border.all(
            color: Colors.white, width: 1), //border of dropdown button
        borderRadius:
            BorderRadius.circular(30), //border raiuds of dropdown button
        boxShadow: const <BoxShadow>[
          //apply shadow on Dropdown button
          BoxShadow(
              color: Couleurs.b, //shadow for button
              blurRadius: 5) //blur radius of shadow
        ]);
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 80,
      ),
      child: Form(
          child: Column(
        children: <Widget>[
          const Text(
            'ajouter les information',
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DecoratedBox(
                decoration: dropdownDecoration,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.center,
                      borderRadius: BorderRadius.circular(30),
                      underline: Container(),
                      dropdownColor: Couleurs.d,
                      style: dropdownStyle,
                      value: categorieSelectionnee,
                      items: categories
                          .map((e) => DropdownMenuItem<Categorie>(
                              value: e,
                              child: Text(
                                textAlign: TextAlign.center,
                                e.nom,
                                overflow: TextOverflow.ellipsis,
                              )))
                          .toList(),
                      onChanged: (Categorie? newValue) => setState(() {
                            categorieSelectionnee = newValue!;
                            typeSelectionne = newValue.types[0];
                          })),
                ),
              ),
              DecoratedBox(
                decoration: dropdownDecoration,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: DropdownButton(
                      alignment: AlignmentDirectional.center,
                      borderRadius: BorderRadius.circular(30),
                      underline: Container(),
                      dropdownColor: Couleurs.d,
                      style: dropdownStyle,
                      value: typeSelectionne,
                      items: categorieSelectionnee.types
                          .map((e) => DropdownMenuItem<TypeElement>(
                              value: e,
                              child: Text(
                                e.nom,
                                overflow: TextOverflow.ellipsis,
                              )))
                          .toList(),
                      onChanged: (TypeElement? newValue) => setState(() {
                            typeSelectionne = newValue!;
                          })),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
                labelText: 'nom',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
                labelText: ' description',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _contactController,
            decoration: const InputDecoration(
                labelText: 'contact',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _adresseController,
            decoration: const InputDecoration(
                labelText: 'adresse',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _prixController,
            decoration: const InputDecoration(
                labelText: 'prix',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _quantiteController,
            decoration: const InputDecoration(
                labelText: 'quantité',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 400, // Largeur du cadre
            height: 200, // Hauteur du cadre
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Couleur de la bordure
                width: 2.0, // Largeur de la bordure
              ),
              borderRadius: BorderRadius.circular(10.0), // Bordure arrondie
              image: const DecorationImage(
                image: AssetImage(
                    'images/001.jpeg'), // Remplacez par le chemin de votre image
                fit: BoxFit
                    .cover, // Ajustez le mode de redimensionnement de l'image
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 15, top: 15)),
            onPressed: () {
              _getImage(); // Ouvrir le dialogue pour choisir entre la caméra et la galerie.
            },
            child: const Text(
              'ajouter une images',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w800, color: Couleurs.c),
            ),
          ),
          _showImagePicker
              ? AlertDialog(
                  title: Text("Choisir une image"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.camera),
                          title: Text("Caméra"),
                          onTap: () async {
                            _getImage(); // Ouvrir le dialogue pour choisir entre la caméra et la galerie.
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.photo),
                          title: Text("Galerie"),
                          onTap: () async {
                            _getImage(); // Ouvrir le dialogue pour choisir entre la caméra et la galerie.
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showImagePicker =
                              false; // Masquer le tableau de choix.
                        });
                      },
                      child: Text('Fermer'),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, bottom: 15, top: 15)),
            onPressed: () {},
            child: const Text(
              'Publier',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w800, color: Couleurs.c),
            ),
          ),
        ],
      )),
    ));
  }
}
