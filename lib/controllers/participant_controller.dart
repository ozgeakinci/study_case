import 'package:riverpod/riverpod.dart';
import 'package:veripark_flutter_study_case/models/participant.dart';
import 'package:veripark_flutter_study_case/services/api_service.dart';

final participantsControllerProvider =
    Provider<Future<List<Participant>>>((ref) async {
  return ApiSevices().getParticipants();
});
