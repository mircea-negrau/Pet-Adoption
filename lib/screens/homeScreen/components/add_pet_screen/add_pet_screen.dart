import 'dart:io';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_adoption/configurations.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/models/user.dart';
import 'package:pet_adoption/services/cloud_firestore.dart';
import 'package:pet_adoption/services/date_time.dart';

class AddPetScreen extends StatefulWidget {
  final User user;
  final Function openDrawer;
  final Function closeDrawer;
  final Function isDrawerOpen;
  final String address;
  final String latitude;
  final String longitude;

  const AddPetScreen(
      {Key? key,
      required this.user,
      required this.openDrawer,
      required this.closeDrawer,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.isDrawerOpen})
      : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _descriptionTextController;
  late TextEditingController _breedTextController;
  late TextEditingController _ageTextController;

  late File _image = File("");
  bool isImageSelected = false;

  String _type = "";
  String _sex = "";
  String _timeValue = "";

  Future<bool> _getImageFromCamera() async {
    final PickedFile pickledImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    final File image = File(pickledImage.path);
    setState(() {
      _image = image;
      isImageSelected = true;
    });
    return true;
  }

  Future<bool> _getImageFromGallery() async {
    final PickedFile pickledImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    final File image = File(pickledImage.path);
    setState(() {
      _image = image;
      isImageSelected = true;
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    _breedTextController = TextEditingController();
    _ageTextController = TextEditingController();
  }

  void _clearEntries() {
    setState(() {
      _type = "";
      _sex = "";
      _timeValue = "";
      isImageSelected = false;
      _image = File("");
      _nameTextController.text = "";
      _descriptionTextController.text = "";
      _breedTextController.text = "";
      _ageTextController.text = "";
    });
  }

  String _validateForm() {
    String error = "";
    if (_image.path.isEmpty) {
      error += "Please add an image. ";
    }
    if (_nameTextController.text == "") {
      error += "Please add name. ";
    }
    if (_sex == "") {
      error += "Please add sex. ";
    }
    if (_breedTextController.text == "") {
      error += "Please add breed. ";
    }
    if (_type == "") {
      error += "Please add species. ";
    }
    if (_ageTextController.text == "") {
      error += "Please add age. ";
    }
    if (_timeValue == "") {
      error += "Please select age (months/years). ";
    }
    if (_descriptionTextController.text == "") {
      error += "Please add a description. ";
    } else if (_descriptionTextController.text.length < 30) {
      error += "Please make the description longer than 30 characters. ";
    }
    return error;
  }

  Future<bool> _publish() async {
    final String name = _nameTextController.text;
    final String gender = _sex;
    final String type = _type;
    final String breed = _breedTextController.text;
    final File picture = _image;
    final String age = "${_ageTextController.text} $_timeValue";
    final String location = widget.address;
    final String ownerID = widget.user.id;
    final String addedDate = CustomDateTime().getCurrentDate();
    final String description = _descriptionTextController.text;
    final String latitude = widget.address;
    final String longitude ;
    final Pet newPet = Pet(
      id: "TBA",
      ownerID: ownerID,
      name: name,
      type: type,
      breed: breed,
      gender: gender,
      age: age,
      description: description,
      location: location,
      addedDate: addedDate,
      longitude: widget.longitude,
      latitude: widget.latitude,
      picture: "TBA",
    );
    return CloudFirestore().addPet(newPet, picture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey[700],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.trash),
            label: 'Empty',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_rounded),
            label: 'Publish',
          ),
        ],
        onTap: (index) async {
          if (index == 0) {
            _clearEntries();
          } else {
            final String error = _validateForm();
            if (error == "") {
              if (await _publish()) {
                print("SUCCESSFUL. IMPLEMENT PUSH TO MAIN PAGE.");
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blueGrey[300],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 450.0),
                  child: !isImageSelected
                      ? Container()
                      : Image.file(
                          _image,
                        )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_outlined,
                          size: 30.0, color: Colors.grey.shade700),
                      onPressed: () {
                        widget.openDrawer();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_album,
                          size: 30.0, color: Colors.grey.shade700),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) {
                              return SafeArea(
                                child: Wrap(
                                  children: <Widget>[
                                    ListTile(
                                        leading:
                                            const Icon(Icons.photo_library),
                                        title: const Text('Photo Library'),
                                        onTap: () {
                                          _getImageFromGallery();
                                          Navigator.of(context).pop();
                                        }),
                                    ListTile(
                                      leading: const Icon(Icons.photo_camera),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        _getImageFromCamera();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              child: Container(
                height: 135.0,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: const Offset(2, 5),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      BoxShadow(
                        blurRadius: 3,
                        offset: const Offset(-2, 0),
                        color: Colors.grey.withOpacity(0.4),
                      )
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _nameTextController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(2.0),
                                hintText: 'Name',
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.grey[700],
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            offset: const Offset(0.0, 40.0),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          _sex = "M";
                                        },
                                      );
                                    },
                                    child: const Text("Male"),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          _sex = "F";
                                        },
                                      );
                                    },
                                    child: const Text("Female"),
                                  ),
                                ),
                              ];
                            },
                            child: Icon(
                              _sex == ""
                                  ? FontAwesomeIcons.venusMars
                                  : (_sex == "M"
                                      ? FontAwesomeIcons.mars
                                      : FontAwesomeIcons.venus),
                              size: 30.0,
                              color: Colors.grey[500],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AutoSizeTextField(
                                minWidth: 45.0,
                                controller: _breedTextController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Breed",
                                  isDense: true,
                                ),
                                fullwidth: false,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey[600],
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              const SizedBox(width: 3.0),
                              PopupMenuButton(
                                offset: const Offset(0.0, 40.0),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _type = "dog";
                                            },
                                          );
                                        },
                                        child: const Text("Dog"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _type = "cat";
                                            },
                                          );
                                        },
                                        child: const Text("Cat"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _type = "parrot";
                                            },
                                          );
                                        },
                                        child: const Text("Parrot"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _type = "horse";
                                            },
                                          );
                                        },
                                        child: const Text("Horse"),
                                      ),
                                    ),
                                  ];
                                },
                                child: Text(
                                  _type == "" ? "Species" : _type,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AutoSizeTextField(
                                minWidth: 15,
                                controller: _ageTextController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Breed",
                                  isDense: true,
                                ),
                                fullwidth: false,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey[600],
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              PopupMenuButton(
                                offset: const Offset(0.0, 40.0),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _timeValue = "months";
                                            },
                                          );
                                        },
                                        child: const Text("Months"),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _timeValue = "years";
                                            },
                                          );
                                        },
                                        child: const Text("Years"),
                                      ),
                                    ),
                                  ];
                                },
                                child: Text(
                                  _timeValue == ""
                                      ? "time"
                                      : _timeValue.toLowerCase(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 3.0),
                              Text(
                                "old",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: primaryYellow,
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              widget.address,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              child: Container(
                margin: const EdgeInsets.only(top: 315.0),
                height: 180.0,
                padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.photoUrl!),
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.user.userName!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Owner",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                CustomDateTime().getCurrentDate(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: _descriptionTextController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: 'Description',
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[700],
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ageTextController.dispose();
    _nameTextController.dispose();
    _descriptionTextController.dispose();
    _breedTextController.dispose();
    super.dispose();
  }
}
