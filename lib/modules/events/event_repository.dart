import 'package:uni_alumni/api/api_provider.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/models/request/event_request.dart';

class EventRepository {
  final ApiProvider apiProvider;

  EventRepository({required this.apiProvider});

  Future<List<Event>?> getEvents(String token, EventRequest params) async {
    final response = await apiProvider.getEvents('/event', token, params);
    if (response.statusCode == 200) {
      List responseList = response.body['data'];
      return responseList.map((event) => Event.fromJson(event)).toList();
    }

    if (response.statusCode == 204) {
      throw Exception('There is no event');
    }
  }

  Future<bool> joinEvent(String token, int eventId) async {
    print(">>Join");
    final response = await apiProvider.join('/alumnus/event/$eventId', token);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> leaveEvent(String token, int eventId) async {
    print(">>Leave");
    final response =
        await apiProvider.deleteMethod('/alumnus/event/$eventId', token);
    if (response.statusCode == 204) {
      return true;
    }

    return false;
  }
}
