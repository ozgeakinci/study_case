import 'package:riverpod/riverpod.dart';
import 'package:veripark_flutter_study_case/services/api_service.dart';

final participantsControllerProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final apiService = ref.read(ApiSevices() as ProviderListenable);
  return await apiService.getParticipants();
});
