import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = "/settings";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool doNotDisturb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
        body: SettingsList(
      sections: [
        SettingsSection(
          title: 'Profile',
          tiles: [
            SettingsTile(
              title: 'Username',
              subtitle: 'Bob T. Builder',
              onPressed: (context) {},
            ),
            SettingsTile(
              title: 'Study ID',
              subtitle: '123456',
              onPressed: (context) {},
            ),
            SettingsTile(
              title: 'Password',
              subtitle: '*********',
              onPressed: (context) {},
            )
          ],
        ),
        SettingsSection(
          title: 'Notifications',
          tiles: [
            SettingsTile.switchTile(
                title: 'Do Not Disturb',
                switchValue: doNotDisturb,
                onToggle: (value) {
                  setState(() {
                    doNotDisturb = value;
                  });
                }),
            SettingsTile(title: 'Preset Times'),
            SettingsTile(title: 'Notification Type')
          ],
        ),
        SettingsSection(
          title: 'Contacts',
          tiles: [
            SettingsTile(
              title: 'Emergency Contact',
              subtitle: '123-456-7890',
            ),
            SettingsTile(
              title: 'Trusted Support',
              subtitle: '123-456-7890',
            ),
          ],
        )
      ],
    ));
  }
}
