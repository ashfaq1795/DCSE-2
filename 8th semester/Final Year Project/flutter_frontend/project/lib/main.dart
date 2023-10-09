import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? imageBytes;
  String prediction = '';
  String color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                imageBytes = await _selectImage();
              },
              child: const Text('Choose Image'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (imageBytes != null) {
                  _uploadImage(context, imageBytes!);
                } else {
                  print('No image selected');
                }
              },
              child: const Text('Predict Image'),
            ),
            const SizedBox(height: 16),
            PredictedResult(prediction: prediction, color: color),
          ],
        ),
      ),
    );
  }

  Future<Uint8List?> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      return Uint8List.fromList(imageBytes);
    }
    return null;
  }

  void _uploadImage(BuildContext context, Uint8List imageBytes) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:5000'),
    );
    request.files.add(
      http.MultipartFile.fromBytes(
        'imageFile',
        imageBytes,
        filename: 'image.jpg',
      ),
    );
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final data = json.decode(responseString);
      final prediction = data['prediction'];
      final color = data['color'];
      setState(() {
        this.prediction = prediction;
        this.color = color;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Prediction: $prediction, Color: $color'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      print('Error uploading image: ${response.statusCode}');
    }
  }
}

class PredictedResult extends StatelessWidget {
  final String prediction;
  final String color;

  const PredictedResult({
    Key? key,
    required this.prediction,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Prediction: $prediction'),
        Text('Color: $color'),
      ],
    );
  }
}
