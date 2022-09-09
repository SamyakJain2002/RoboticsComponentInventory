import 'package:flutter_application_1/models/componentDetails.dart';
import 'package:flutter_application_1/pages/add.dart';
import 'package:flutter_application_1/pages/details.dart';
import 'package:flutter_application_1/widgets/component.dart';

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
  List<ComponentDetails> componentList = [
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description:
            'angjodnafonnsdf;asnbwauifhnioewnfuorngfioranf[iaemfklasdfm/;oewianfaoiNGR;AOINGIOAJWNTI[JQWI[OANFIOANGJKNWAIOPNR[WQJRIFNMDSAKFNKDSNGIOER[QU5T834HJFINEASNIOWNFimciv 2iejvmiwecijriefosanfuphtpenfioann;jngre;npgowparnfupabnrfi vinrwginfwirnfi[wnvminiwrnfiewnfvirnwinwrifipowanksnjnw98qphtfunvajfni[H8IANFKEWNFOIPWQ[AHR[fvrovcdv ewijfiewjfiodsmcldskmvkenefiwejfokd v ko OIGFNQEIOJFIEWNMFV DFION NWIEOnfiwEJRF9-w]rkew4\fdfsnjoidsnafidsabfouifbduisbfiuasdbfipudsbfuisabngudsbgunfudsnfuidsnfospANFiopanfoi[snfiaosnf'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
    ComponentDetails(
        name: 'Arduino',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg',
        quantity: 5,
        description: 'angjodnafon'),
  ];

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
          child: Column(
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
                  controller: textController,
                  obscureText: false,
                  cursorColor: Colors.amber,
                  decoration: InputDecoration(
                    hintText: 'Search Component',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
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
                child: ListView.builder(
                    itemCount: componentList.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: (() {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsWidget(
                                      details: componentList[index])));
                        }),
                        child: Component(
                            name: componentList[index].name,
                            imageUrl: componentList[index].imageUrl,
                            quantity: componentList[index].quantity),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
