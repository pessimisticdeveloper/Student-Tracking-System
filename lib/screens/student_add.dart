import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;

  //StudentAdd(List<Student> students){
  //this.students = students;
  //}

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {

  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
            child: Column(
          children: [
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSubmitButton()
          ],
        )),
      ),
    );
  }

  void mesajGoster(BuildContext context, String mesaj){
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildFirstNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Adı", hintText: "Mücahit"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Yılmaz"),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Notu", hintText: "69"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }
  buildSubmitButton(){
    return ElevatedButton(child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState?.save();
        widget.students.add(student);
        Navigator.pop(context);
        var mesaj = "Eklendi ";
        mesajGoster(context, mesaj);
      },
    );
  }
}
