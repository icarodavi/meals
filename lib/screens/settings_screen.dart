import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings, {Key? key})
      : super(key: key);

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;
  Widget _createSwitch(String title, String subtitle, bool value,
      void Function(bool?) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de filtro'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: ListView(children: [
            _createSwitch(
                'Sem Glúten',
                'Somente irá exibir refeições sem glúten.',
                settings.isGlutenFree, (value) {
              setState(() {
                settings.isGlutenFree = value!;
                widget.onSettingsChanged(settings);
              });
            }),
            _createSwitch(
                'Sem Lactose',
                'Somente irá exibir refeições sem lactose.',
                settings.isLactoseFree, (value) {
              setState(() {
                settings.isLactoseFree = value!;
                widget.onSettingsChanged(settings);
              });
            }),
            _createSwitch(
                'Comida Vegana',
                'Somente irá exibir refeições veganas.',
                settings.isVegan, (value) {
              setState(() {
                settings.isVegan = value!;
                widget.onSettingsChanged(settings);
              });
            }),
            _createSwitch(
                'Comida Vegetariana',
                'Somente irá exibir refeições vegetarianas.',
                settings.isVegetarian, (value) {
              setState(() {
                settings.isVegetarian = value!;
                widget.onSettingsChanged(settings);
              });
            }),
          ]),
        )
      ]),
    );
  }
}
