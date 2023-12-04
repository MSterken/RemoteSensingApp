

class LibraryChapter {
  final String _title;
  final List<String> _paragraphs;

  LibraryChapter(this._title, this._paragraphs);

  List<String> get paragraphs => _paragraphs;

  String get title => _title;
}