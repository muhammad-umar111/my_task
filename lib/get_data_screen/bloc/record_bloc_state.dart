// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apicall/get_data_screen/model/comments_model.dart';

abstract class RecordState{}
class InitialRecordState extends RecordState{}
class LoadedRecordState extends RecordState {
  List<Comments> listOfComments;
  LoadedRecordState({
    required this.listOfComments,
  });
}
