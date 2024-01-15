
import 'libraryMinorSubject.dart';

class LibrarySubject {

  final String _title;
  final List <LibraryMinorSubject> _libraryMinorSubjects = [];

  LibrarySubject(this._title);

  void addMinorSubject(LibraryMinorSubject subject){
    _libraryMinorSubjects.add(subject);
  }

  List<LibraryMinorSubject> get libraryMinorSubjects => _libraryMinorSubjects;

  String get title => _title;
}

