import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/api/api_calls.dart';
import 'package:flutter_application_1/models/componentDetails.dart';
import 'package:flutter_application_1/pages/add.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/widgets/component.dart';
import 'package:flutter_application_1/widgets/delete_alert_box.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isdeletePressed = false;
  String name = '';
  String uid = '';

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddComponent(),
            ),
          );
        },
        backgroundColor: Colors.amber,
        elevation: 8,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hi!\nWelcome",
                    style: TextStyle(
                      color: Color(0xFF1d1d1d),
                      fontSize: 24,
                    )),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: TextFormField(
                    onChanged: ((value) {
                      setState(() {});
                    }),
                    controller: textController,
                    obscureText: false,
                    cursorColor: Colors.amber,
                    decoration: InputDecoration(
                      hintText: 'Search Component',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Poppins',
                                color: const Color(0xFF1d1d1d),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1d1d1d),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF1d1d1d),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF1d1d1d),
                        size: 28,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('components')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              Map<String, dynamic> data =
                                  snapshot.data.docs[index].data();
                              return (textController.text.isEmpty ||
                                      data['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(textController.text
                                              .toLowerCase()))
                                  ? GestureDetector(
                                      onTap: (() {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsWidget(
                                                        snapshot: snapshot.data
                                                            .docs[index])));
                                      }),
                                      onLongPress: () {
                                        name = data['name'];
                                        uid = data['uid'];
                                        setState(() {
                                          isdeletePressed = true;
                                        });
                                      },
                                      child: ComponentItem(data),
                                    )
                                  : Container();
                            }));
                      }),
                )
              ],
            ),
            (isdeletePressed)
                ? Center(
                    child: SizedBox(
                      height: 210,
                      child: DeleteAlertBox(
                        name: name,
                        uid: uid,
                        onPressedCancel: () {
                          setState(() {
                            isdeletePressed = false;
                          });
                        },
                        onPressedDelete: () {
                          deleteComponentFromDB(uid);
                          setState(() {
                            isdeletePressed = false;
                          });
                        },
                      ),
                    ),
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }

  Widget ComponentItem(Map<String, dynamic> data) {
    ComponentDetails component = ComponentDetails.fromJson(data);
    return Component(
        name: component.name,
        imageUrl: component.imageUrl,
        quantity: component.quantity);
  }
}
