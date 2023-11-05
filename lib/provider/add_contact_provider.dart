import 'package:advance_tutorial_1_contact_diary/model/variable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addcontacatprovider extends ChangeNotifier {
  int index = 0;
  List<global> addcontact = [];
  List<global> hiddencontact = [];
  final key = GlobalKey<FormState>();
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;

  void pickImage() {
    imagePicker.pickImage(source: ImageSource.camera).then((value) {
      xFile = value;
    });
  }

  void deletelist() {
    hiddencontact.add(addcontact[index]);
    addcontact.remove(addcontact[index]);
    notifyListeners();
  }

  void deletehiddenlist() {
    addcontact.add(hiddencontact[index]);
    hiddencontact.remove(hiddencontact[index]);
    notifyListeners();
  }

  void addContact(
      String name, String lastname, String mail, String phonenumber) {
    print(name);
    print(lastname);
    print(phonenumber);
    global Global = global(
        mail: mail, name: name, lastname: lastname, phonenumber: phonenumber);
    addcontact.add(Global);
    notifyListeners();
  }
}
