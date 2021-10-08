import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/event.dart';

class EventRepository {
  final ApiProvider apiProvider;

  EventRepository({required this.apiProvider});

  Future<List<Event>?> getEvents(String token) async {
    final response = await apiProvider.getEvents('/event', token);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((event) => Event.fromJson(event)).toList();
    }
  }
}
