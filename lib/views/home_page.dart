
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_example/view_model/list_picture_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPictureView listPictureView = ListPictureView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pictures Gallery'),),
      body: FutureBuilder(
        future: listPictureView.fetchPictures(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          else
            {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 150
                  ),
                  itemBuilder: (context, int index)=> Container(
                    color: Colors.grey,
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: '${listPictureView.pictures![index].picSumModel?.downloadUrl}',
                        fit: BoxFit.cover,
                    ),
                  ),
              );
            }
          },
      ),
    );
  }
}
