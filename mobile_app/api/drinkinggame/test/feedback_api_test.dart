import 'package:test/test.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';


/// tests for FeedbackApi
void main() {
  final instance = DrinkinggameApi().getFeedbackApi();

  group(FeedbackApi, () {
    // Gets all User Feedback
    //
    //Future<BuiltList<FeedbackDto>> getUserFeedback() async
    test('test getUserFeedback', () async {
      // TODO
    });

    // Saves user Feedback
    //
    //Future sendFeedback(FeedbackDto feedbackDto) async
    test('test sendFeedback', () async {
      // TODO
    });

  });
}
