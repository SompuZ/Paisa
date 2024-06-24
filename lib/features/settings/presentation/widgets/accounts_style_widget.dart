import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:paisa/config/routes.dart';
import 'package:paisa/core/common.dart';

class AccountsStyleWidget extends StatefulWidget {
  const AccountsStyleWidget({super.key});

  @override
  State<AccountsStyleWidget> createState() => _AccountsStyleWidgetState();
}

class _AccountsStyleWidgetState extends State<AccountsStyleWidget> {
  late bool isSelected =
      settings.get(userAccountsStyleKey, defaultValue: false);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(MdiIcons.creditCard),
      title: Text(context.loc.accountStyle),
      subtitle: Text(context.loc.accountStyleDescription),
      onChanged: (bool value) async {
        setState(() {
          isSelected = value;
        });
        settings.put(userAccountsStyleKey, value);
      },
      value: isSelected,
    );
  }
}
