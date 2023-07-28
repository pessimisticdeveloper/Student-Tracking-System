import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(this.selectedStudent);
  //StudentEdit(Student selectedStudent) {
  //this..selectedStudent = selectedStudent;
  //}
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State<StudentEdit> {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentAddState(this.selectedStudent);

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

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration:
          InputDecoration(labelText: "Öğrenci Adı", hintText: "Mücahit"),
      onSaved: (String? value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Yılmaz"),
      onSaved: (String? value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Öğrenci Notu", hintText: "69"),
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState?.save();
        Navigator.pop(context);
        var mesaj = "Güncellendi: " + selectedStudent.firstName;
        mesajGoster(context, mesaj);
      },
    );
  }
}
