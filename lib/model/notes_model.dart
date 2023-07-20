class Notes {
  String? notesId;
  String notes;
  String? title;
  String createdOn;

  Notes({
    this.notesId,
    required this.notes,
    required this.title,
    required this.createdOn,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "notes": notes,
        "createdOn": createdOn,
      };

  static Notes fromJson(Map<String, dynamic> json) => Notes(
        notes: json["notes"],
        title: json["title"],
        createdOn: json["createdOn"],
      );
}
