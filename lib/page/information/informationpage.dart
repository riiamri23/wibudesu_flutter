import 'package:flutter/material.dart';
import 'package:wibudesu2/components/wdlayouts/wdappbar.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Column(
              children: [
                WDAppBarLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
