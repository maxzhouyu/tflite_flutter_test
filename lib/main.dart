import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() async {
    final gpuDelegateV2 = GpuDelegateV2(options: GpuDelegateOptionsV2());

    var interpreterOptions = InterpreterOptions()..addDelegate(gpuDelegateV2);
    final interpreter = await Interpreter.fromAsset('your_model.tflite',
        options: interpreterOptions);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tflite_flutter'),
      ),
      body: Container(),
    );
  }
}
