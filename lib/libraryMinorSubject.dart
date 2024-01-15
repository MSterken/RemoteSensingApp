import 'SubjectParagraph.dart';

class LibraryMinorSubject {

  String _subTitle;
  List<SubjectParagraph> _paragraphs = [];

  LibraryMinorSubject(this._subTitle);

  void addParagraph(String text, String imagePath){
    SubjectParagraph p = SubjectParagraph(text, imagePath);
    _paragraphs.add(p);
  }

  List<SubjectParagraph> get paragraphs => _paragraphs;

  String get subTitle => _subTitle;
}