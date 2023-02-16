import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/modules/profile/change_password_page.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_app/core/entity/entities_list.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/modules/audit_log/audit_logs_list.dart';
import 'package:thingsboard_app/modules/internal_sensors/internal_sensors_list.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';

import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/widgets/tb_progress_indicator.dart';
import 'package:thingsboard_client/thingsboard_client.dart';

class InternalSensorsPage extends TbPageWidget {
  final bool searchMode;

  InternalSensorsPage(TbContext tbContext, {this.searchMode = false})
      : super(tbContext);

  @override
  _InternalSensorsPageState createState() => _InternalSensorsPageState();
}

class _InternalSensorsPageState extends TbPageState<InternalSensorsPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var assetsList = InternalSensorsList(tbContext, _pageLinkController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    appBar = TbAppBar(tbContext, title: Text(assetsList.title), actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          navigateTo('/assets?search=true');
        },
      )
    ]);
    return Scaffold(
        appBar: appBar,
        body: Row(mainAxisSize: MainAxisSize.max, children: [
          Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(width: 16),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _accelPage();
                                  },
                                  child: Text(
                                    'Accelerometer',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 1,
                                        fontSize: 35,
                                        height: 16 / 12),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _gyroPage();
                                  },
                                  child: Text(
                                    'Gyroscope',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 1,
                                        fontSize: 35,
                                        height: 16 / 12),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _magPage();
                                  },
                                  child: Text(
                                    'Magnetometer',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 1,
                                        fontSize: 35,
                                        height: 16 / 12),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _cameraPage();
                                  },
                                  child: Text(
                                    'Camera',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        letterSpacing: 1,
                                        fontSize: 35,
                                        height: 16 / 12),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 4),
                          ],
                        )),
                    SizedBox(width: 16),
                    Icon(Icons.chevron_right, color: Color(0xFFACACAC)),
                    SizedBox(width: 16)
                  ],
                ),
              ))
        ]));
  }

  /* @override
  Widget build(BuildContext context) {
    var assetsList = InternalSensorsList(tbContext, _pageLinkController,
        searchMode: widget.searchMode);
    PreferredSizeWidget appBar;
    if (widget.searchMode) {
      appBar = TbAppSearchBar(
        tbContext,
        onSearch: (searchText) => _pageLinkController.onSearchText(searchText),
      );
    } else {
      appBar = TbAppBar(tbContext, title: Text(assetsList.title), actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            navigateTo('/assets?search=true');
          },
        )
      ]);
    }
    return Scaffold(appBar: appBar, body: assetsList);
  } */

  void _accelPage() async {
    navigateTo('/internalSensors/accel');
  }

  void _gyroPage() async {
    navigateTo('/internalSensors/gyro');
  }

  void _magPage() async {
    navigateTo('/internalSensors/mag');
  }

  void _cameraPage() async {
    navigateTo('/internalSensors/camera');
  }
}
