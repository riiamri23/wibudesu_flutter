import 'package:flutter/material.dart';
import 'package:wibudesu2/page/home/homepage.dart';
import 'package:wibudesu2/page/information/informationpage.dart';
import 'package:wibudesu2/page/watch/watchpage.dart';

Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => const HomePage(),
  '/information': (context) => const InformationPage(),
  '/watch': (context) => const WatchPage(),
};
