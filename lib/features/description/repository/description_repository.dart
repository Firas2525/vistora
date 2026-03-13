import '../services/description_service.dart';
import '../model/description_model.dart';

class DescriptionRepository {
  final DescriptionService _service = DescriptionService();

  Future<DescriptionModel> getProductDetails(int productId) async {
    var data = await _service.fetchProductDetails(productId);
    return DescriptionModel.fromJson(data['result']);
  }
}
