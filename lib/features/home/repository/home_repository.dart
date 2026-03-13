import '../model/home_model.dart';
import '../services/home_service.dart';

class HomeRepository {
  final HomeService homeService;

  HomeRepository({required this.homeService});

  Future<List<CategoryModel>> getCategories() async {
    final data = await homeService.fetchData('categories?type=main');
    return data != null ? (data['result'] as List).map((e) => CategoryModel.fromJson(e)).toList() : [];
  }

  Future<List<TagModel>> getTags() async {
    final data = await homeService.fetchData('categories?type=tag');
    return data != null ? (data['result'] as List).map((e) => TagModel.fromJson(e)).toList() : [];
  }

  Future<List<ResultModel>> getResults(List<int> selectedTags) async {
    final endpoint = selectedTags.isEmpty ? 'products' : 'products?tags=${selectedTags.join(",")}';
    final data = await homeService.fetchData(endpoint);
    return data != null ? (data['result'] as List).map((e) => ResultModel.fromJson(e)).toList() : [];
  }

  Future<List<AddsModel>> getAdds() async {
    final data = await homeService.fetchData('advers');
    return data != null ? (data['result'] as List).map((e) => AddsModel.fromJson(e)).toList() : [];
  }

  Future<List<ResultModel>> searchProducts(String query) async {
    final data = await homeService.fetchData('products?search=$query');
    return data != null ? (data['result'] as List).map((e) => ResultModel.fromJson(e)).toList() : [];
  }
}
