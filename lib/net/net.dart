import 'package:get/get.dart';
import './cases_model.dart';

// ignore: one_member_abstracts
abstract class IHomeProvider {
  Future<Response<CasesModel>> getCases(String path);
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = CasesModel.fromJson;
    httpClient.baseUrl = 'https://api.covid19api.com';
  }

  @override
  Future<Response<CasesModel>> getCases(String path) => get(path);
}