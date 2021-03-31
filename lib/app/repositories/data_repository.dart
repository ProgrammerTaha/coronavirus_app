import 'package:rest_api/app/services/api.dart';
import 'package:rest_api/app/services/api_service.dart';

class DataRepository {
  DataRepository({required this.apiService});
  final APIService apiService;

  Future<int> getEndpointData(Endpoint endpoint) async {
    final accessToken = await apiService.getAccessToken();
    return await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: endpoint,
    );
  }
}
