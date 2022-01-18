import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    //* this is to close the FAB menu by pushing the back system button instead of leaving the app
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false; //*close
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'SpeedDial() example. Comes with the package:',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                'pub.dev/packages/flutter_speed_dial',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.white,
          //overlayColor: Colors.black,
          //overlayOpacity: 0.4,
          //icon: Icons.share,
          //spacing: 32, //*spacing between main button and childs
          //spaceBetweenChildren: 32,
          //closeManually: true,
          // onOpen: (){},
          // onClose: (){},
          openCloseDial: isDialOpen,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.mail),
              label: 'Mail',
              //backgroundColor: Colors.green,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mail Selected...')));
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.copy),
              label: 'Copy',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copy Selected...')));
              },
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
