import 'package:apicall/api_provider/api_provider.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_event.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_state.dart';
import 'package:apicall/get_data_screen/model/comments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBloc extends Bloc<RecordEvent, RecordState> {
  List<Comments> list = [];

  CommentsBloc() : super(InitialRecordState()) {
    CommentsApiProvider commentsApiProvider = CommentsApiProvider();
    commentsApiProvider.fetchComments().then((value) {
      emit(LoadedRecordState(listOfComments: list));
    });
    on<FetchRecordEvent>((event, emit) async {
      list.removeAt(event.index);
      emit(LoadedRecordState(listOfComments: list));
    });
  }
}
