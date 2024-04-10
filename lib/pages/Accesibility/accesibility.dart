import 'package:flutter/material.dart';
import 'accessibility_settings_helper.dart';

class AccessibilitySettingsPage extends StatefulWidget {
  @override
  _AccessibilitySettingsPageState createState() => _AccessibilitySettingsPageState();
}

class _AccessibilitySettingsPageState extends State<AccessibilitySettingsPage> {
  double _fontSize = 16.0;
  bool _isColorBlindModeEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _fontSize = await AccessibilitySettingsHelper.getFontSize();
    _isColorBlindModeEnabled = await AccessibilitySettingsHelper.getColorBlindModeEnabled();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessibility Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Font Size',
            style: Theme.of(context).textTheme.headline6,
          ),
          Slider(
            value: _fontSize,
            min: 10.0,
            max: 30.0,
            divisions: 4,
            onChanged: (newValue) {
              setState(() {
                _fontSize = newValue;
              });
              AccessibilitySettingsHelper.setFontSize(newValue);
            },
          ),
          Text(
            'Colorblind Mode',
            style: Theme.of(context).textTheme.headline6,
          ),
          Switch(
            value: _isColorBlindModeEnabled,
            onChanged: (newValue) {
              setState(() {
                _isColorBlindModeEnabled = newValue;
              });
              AccessibilitySettingsHelper.setColorBlindModeEnabled(newValue);
            },
          ),
        ],
      ),
    );
  }
}
