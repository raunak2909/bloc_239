abstract class ListEvent {}

class AddNoteEvent extends ListEvent{
  String title;
  String desc;

  AddNoteEvent({required this.title, required this.desc});
}
class UpdateNoteEvent extends ListEvent{
  String updatedTitle;
  String updatedDesc;
  int index;

  UpdateNoteEvent({required this.updatedTitle, required this.updatedDesc, required this.index});
}
class DeleteNoteEvent extends ListEvent{
  int index;

  DeleteNoteEvent({required this.index});
}
