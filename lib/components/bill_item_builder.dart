import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget billItemBuilder(context){
 return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(
        0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsetsDirectional
                .fromSTEB(12, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'KIA 2020',
                  style:
                  FlutterFlowTheme.of(
                      context)
                      .bodyMedium
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .bodyMediumFamily,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .bodyMediumFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional
                  .fromSTEB(24, 0, 0, 0),
              child: Column(
                mainAxisSize:
                MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Text(
                    '1234ert5',
                    style:
                    FlutterFlowTheme.of(
                        context)
                        .bodyMedium
                        .override(
                      fontFamily: FlutterFlowTheme.of(
                          context)
                          .bodyMediumFamily,
                      letterSpacing:
                      0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(context)
                              .bodyMediumFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional
                  .fromSTEB(24, 0, 0, 0),
              child: Column(
                mainAxisSize:
                MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Text(
                    'Andrew D.',
                    style:
                    FlutterFlowTheme.of(
                        context)
                        .bodyMedium
                        .override(
                      fontFamily: FlutterFlowTheme.of(
                          context)
                          .bodyMediumFamily,
                      letterSpacing:
                      0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(context)
                              .bodyMediumFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional
                  .fromSTEB(24, 0, 0, 0),
              child: Column(
                mainAxisSize:
                MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  Text(
                    'Aug. 8, 2022',
                    style:
                    FlutterFlowTheme.of(
                        context)
                        .bodyMedium
                        .override(
                      fontFamily: FlutterFlowTheme.of(
                          context)
                          .bodyMediumFamily,
                      letterSpacing:
                      0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(context)
                              .bodyMediumFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsetsDirectional
                .fromSTEB(24, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  '\$199.99',
                  style:
                  FlutterFlowTheme.of(
                      context)
                      .titleMedium
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .titleMediumFamily,
                    color: FlutterFlowTheme.of(
                        context)
                        .primary,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .titleMediumFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}