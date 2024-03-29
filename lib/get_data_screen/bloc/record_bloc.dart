import 'package:apicall/api_provider/api_provider.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_event.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_state.dart';
import 'package:apicall/get_data_screen/model/comments_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBloc extends Bloc<RecordEvent, RecordState> {
    List<Comments> list=[];

  CommentsBloc() : super(InitialRecordState()) {
    CommentsApiProvider commentsApiProvider = CommentsApiProvider();
     
    on<FetchRecordEvent>((event, emit) async {
      List<Comments> comments = await commentsApiProvider.fetchComments();
      list=comments;
      emit(LoadedRecordState(listOfComments: list));
    });
  }
}
