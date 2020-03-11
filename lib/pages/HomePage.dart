import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Consumer<ImagePickerProvider>(
        builder:
            (BuildContext context, ImagePickerProvider image, Widget child) =>
                ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: image.imageFile == null
                    ? Text('No image selected.')
                    : Image.file(image.imageFile),
              ),
              MaterialButton(
                  onPressed: () => image.getImageFromCamera(),
                  child: Text('Take Picture')),
              MaterialButton(
                  onPressed: () => image.getImageFromCameraRoll(),
                  child: Text('Pick Picture From Gallery'))
            ],
          )
        ]),
      ),
      // floatingActionButton: Consumer(
      //   builder:
      //       (BuildContext context, ImagePickerProvider image, Widget child) =>
      //           FloatingActionButton(
      //     onPressed: () => image.getImageFromCamera(),
      //     tooltip: 'Pick Image',
      //     child: Icon(Icons.add_a_photo),
      //   ),
      // ),
    );
  }
}
