import 'package:apicall/get_data_screen/bloc/record_bloc.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_event.dart';
import 'package:apicall/get_data_screen/bloc/record_bloc_state.dart';
import 'package:apicall/get_data_screen/model/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CommentsBloc>(
        create: (context) => CommentsBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    CommentsBloc commentsBloc = BlocProvider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: BlocBuilder<CommentsBloc,RecordState>(
        builder: (context, state) {
          if (state is InitialRecordState) {
            return Text('Click to Load');
          } else {
            return MyWidget(
              comments: (state as LoadedRecordState).listOfComments,
              commentsBloc: commentsBloc,
            );
          }
        },
      )),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget(
      {super.key, required this.comments, required this.commentsBloc});
  final List<Comments> comments;
  final CommentsBloc commentsBloc;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => commentsBloc.add(FetchRecordEvent(index: index)),
            leading: Text(comments[index].id.toString()),
            title: Text(comments[index].postId.toString()),
            subtitle: Text(comments[index].name.toString()),
            trailing: Text(comments[index].email.toString()),
          );
        },
      ),
    );
  }
}
