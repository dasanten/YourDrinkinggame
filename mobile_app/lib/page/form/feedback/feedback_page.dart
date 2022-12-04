import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController description;
  late TextEditingController header;
  late TextEditingController answerAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Antwort Adresse")),
                controller: answerAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: header,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Titel")),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                controller: description,
                decoration: InputDecoration(label: Text("Feedback")),
                maxLines: 5,
                textInputAction: TextInputAction.send,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Es muss Text festgelegt werden!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Send",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Icon(Icons.send),
                      ],
                    ),
                    onPressed: sendFeedback,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendFeedback() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    var feedback = FeedbackDto(
      (b) {
        b.answerAddress = answerAddress.text;
        b.description = description.text;
        b.header = header.text;
      },
    );
    await api.getFeedbackApi().sendFeedback(feedbackDto: feedback);
  }

  @override
  void initState() {
    super.initState();
    description = TextEditingController();
    header = TextEditingController();
    answerAddress = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    description.dispose();
    header.dispose();
    answerAddress.dispose();
  }
}
