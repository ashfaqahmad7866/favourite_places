import 'package:flutter/material.dart';
import'package:image_picker/image_picker.dart';
import 'dart:io';
class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});
  final void Function(File image) onPickImage;
  @override
  State<StatefulWidget> createState() {
    return ImageInputState();
  }
}

class ImageInputState extends State<ImageInput> {
  File? selectedImage;
  void _takePicture()async
  {
    final imagePicker=ImagePicker();
   final pickedImage=await imagePicker.pickImage(source: ImageSource.camera,maxWidth: 600);
   if(pickedImage==null)
   {
    return;
   }
   setState(()=>selectedImage =File(pickedImage.path));
   widget.onPickImage(selectedImage!);
  }
  @override
  Widget build(BuildContext context) {
    Widget content=TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'));
          if(selectedImage!=null)
          {
            content=Image.file(selectedImage!,fit: BoxFit.cover,width: double.infinity,);
          }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      width: double.infinity,
      height: 250,
      alignment: Alignment.center,
      child: content,
    );
  }
}
