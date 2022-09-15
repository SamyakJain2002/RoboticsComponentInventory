import 'dart:io';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_application_1/api/api_calls.dart';
import 'package:flutter_application_1/models/componentDetails.dart';
import 'package:image_picker/image_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class AddComponent extends StatefulWidget {
  const AddComponent({Key key}) : super(key: key);

  @override
  _AddComponentState createState() => _AddComponentState();
}

class _AddComponentState extends State<AddComponent> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  String url = 'https://picsum.photos/seed/560/600';
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantity = TextEditingController();

  Future<String> pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      File selectedImage = File(image.path);
      selectedImage = await compressImage(
        selectedImage,
      );
      return uploadImageToStorage(selectedImage);
    } else {
      return url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
          iconSize: 22,
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: GestureDetector(
                      onTap: () async {
                        //await Permissions.cameraPermissionsGranted()
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 200,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              iconSize: 80,
                                              onPressed: () async {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                Navigator.pop(context);
                                                url = await pickImage(
                                                    ImageSource.camera);
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.camera,
                                                color: Colors.amber,
                                              )),
                                          const Text(
                                            'Camera',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              iconSize: 80,
                                              onPressed: () async {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                Navigator.pop(context);
                                                url = await pickImage(
                                                    ImageSource.gallery);
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.image,
                                                color: Colors.amber,
                                              )),
                                          const Text(
                                            'Gallery',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ]),
                                  ],
                                ),
                              );
                            });

                        // : print('no camera permission');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.width / 1.5,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: (isLoading)
                            ? const CircularProgressIndicator()
                            : Image.network(
                                url,
                              ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: name,
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Component Name',
                      hintText: 'Enter Component Name',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffffdc3d),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(width: 2, color: Colors.grey[200]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: quantity,
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'Enter Component Quantity',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffffdc3d),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(width: 2, color: Colors.grey[200]),
                      ),
                      suffixIcon: const Icon(Icons.email, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: description,
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Enter Component Description',
                      labelStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700],
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xffffdc3d),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(width: 2, color: Colors.grey[200]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                        ComponentDetails details = ComponentDetails(
                            uid: const Uuid().v4(),
                            name: name.text,
                            description: description.text,
                            quantity: int.parse(quantity.text),
                            imageUrl: url);
                        print(details.uid);
                        addComponentToDB(details);
                        Navigator.pop(context);
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        width: 250,
                        height: 40,
                        color: Colors.amber,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

// child: Stack(
//   children: [
//     Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding:
//                   EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 child: Image.network(
//                   'https://picsum.photos/seed/560/600',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//           child: Text(
//             'Name of the Component',
//             style: FlutterFlowTheme.of(context).bodyText1.override(
//                   fontFamily: 'Poppins',
//                   fontSize: 18,
//                 ),
//           ),
//         ),
//         Text(
//           'Hello World',
//           style: FlutterFlowTheme.of(context).bodyText1.override(
//                 fontFamily: 'Poppins',
//                 fontSize: 16,
//               ),
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 15),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Text(
//                 'Description',
//                 style:
//                     FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 16,
//                         ),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding:
//                     EdgeInsetsDirectional.fromSTEB(10, 0, 0, 15),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Text(
//                       'Hello World',
//                       style: FlutterFlowTheme.of(context).bodyText1,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//     Padding(
//       padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 'Quantity:-',
//                 style:
//                     FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                         ),
//               ),
//               Text(
//                 '2',
//                 style:
//                     FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 18,
//                         ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
//             child: FFButtonWidget(
//               onPressed: () {
//                 print('Button pressed ...');
//               },
//               text: 'Save',
//               options: FFButtonOptions(
//                 width: 250,
//                 height: 40,
//
//                 color: Colors.amber,
//                 textStyle: FlutterFlowTheme.of(context)
//                     .subtitle2
//                     .override(
//                     fontFamily: 'Poppins',
//                     color:Colors.white,
//                     fontWeight: FontWeight.w600
//                 ),
//                 borderSide: const BorderSide(
//                   color: Colors.transparent,
//                   width: 1,
//                 ),
//                 borderRadius: 8,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
