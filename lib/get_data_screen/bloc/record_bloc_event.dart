abstract class RecordEvent {}

class FetchRecordEvent extends RecordEvent {
  final int index;

  FetchRecordEvent({required this.index});
}
