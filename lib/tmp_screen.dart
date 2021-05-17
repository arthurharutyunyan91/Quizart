import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TMPPage extends StatelessWidget {
  final databaseQuestions =
      FirebaseDatabase.instance.reference().child('questions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () => createRecord(),
            child: Text('button'),
          ),
        ),
      ),
    );
  }

  void createRecord() async {
    DataSnapshot questions = await databaseQuestions.once();
    var q1 = questions.value['q1'];
    Question.fromJson(q1);
  }
}

class Question {
  final String question;
  final List<Variant> variants;

  Question({@required this.question, @required this.variants});

  Question.fromJson(Map<dynamic, dynamic> data)
      : question = data['question'],
        variants =
            asf((data['variants'] as Map<dynamic, dynamic>).values.toList());

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'question': question,
    };
  }

  static asf(List<dynamic> pVariants) {
    var variants = <Variant>[];
    pVariants.forEach((element) {
      variants.add(Variant.fromJson(element));
    });
    return variants;
  }
}

class Variant {
  final String variant;
  final bool isTrue;

  Variant({@required this.variant, this.isTrue = false});
  Variant.fromJson(Map<dynamic, dynamic> json)
      : variant = json['variant'],
        isTrue = json['isTrue'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'variant': variant,
      'isTrue': isTrue,
    };
  }
}
