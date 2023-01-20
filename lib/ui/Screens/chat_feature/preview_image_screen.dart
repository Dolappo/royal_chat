import 'package:flutter/material.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_screen.dart';
import 'package:royal_chat/ui/Screens/chat_feature/preview_image_view_model.dart';
import 'package:stacked/stacked.dart';

class PreviewSelectedImage extends StatelessWidget {
  const PreviewSelectedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreviewImageViewModel>.reactive(
        viewModelBuilder: () => PreviewImageViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              elevation: 0,
            ),
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: Image.memory(
                      model.selectedImage!,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 20,
                ),
                CustomField(
                  controller: model.textController,
                  isChat: false,
                  sendImage: model.sendImage,
                ),
              ],
            ),
          );
        });
  }
}
