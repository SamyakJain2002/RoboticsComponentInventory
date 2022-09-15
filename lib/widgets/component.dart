import 'package:flutter/material.dart';
import 'package:flutter_application_1/flutter_flow/flutter_flow_theme.dart';

class Component extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int quantity;

  const Component({Key key, this.name, this.imageUrl, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color(0xFFFFFFFF),
        elevation: 3,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  imageUrl,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '$quantity',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
