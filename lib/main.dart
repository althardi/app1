import 'package:app1/tentang_aplikasi.dart';
import 'package:flutter/material.dart';
import 'package:app1/header_drawer.dart';
import 'package:app1/tentang_aplikasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retina',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: "Beranda"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _showCamera() async {
    // try {
    //   await _initializeCameraControllerFuture;
    //   final picture = await _cameraController.takePicture();
    //   _imgBytes = await picture.readAsBytes();
    //   String base64encode = base64.encode(_imgBytes);
    //   Map<String, dynamic> d = {'name': picture.name, 'img': base64encode};
    //   String result = json.encode(d);
    //   await http.post("http://10.0.2.2:5000/", body: result);
    //   //_saveImage(picture.name);
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                ListTile(
                  leading: const Icon(Icons.broken_image_outlined),
                  title: const Text("Buka Galeri"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Tentang Aplikasi"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TentangAplikasi()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.purple[200],
                fixedSize: Size(constraints.maxHeight, constraints.maxHeight),
                maximumSize: Size.infinite),
            onPressed: () async {
              _showCamera();
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image:
                    DecorationImage(image: AssetImage('assets/img/camera.png')),
              ),
            ),
          ),
        ));
  }
}
