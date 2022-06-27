
import 'package:mvvm_flutter_example/model/picsum_model.dart';
import 'package:mvvm_flutter_example/services/services.dart';

class ListPictureView{
  late List<PictureViewModel>? pictures;

  Future<void> fetchPictures() async{
    final apiResult= await Services().fetchPicturesApi();
    pictures = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  late final PicSumModel? picSumModel;

  PictureViewModel(this.picSumModel);
}