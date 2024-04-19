import 'package:bloc_239/list_bloc/list_bloc.dart';
import 'package:bloc_239/list_bloc/list_event.dart';
import 'package:bloc_239/list_bloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (_, state){
          print("length : ${state.allNotes.length}");
          return ListView.builder(
            itemCount: state.allNotes.length,
              itemBuilder: (_, index){
                return ListTile(
                  onTap: (){
                    context.read<ListBloc>().add(UpdateNoteEvent(updatedTitle: "UpdatedNote", updatedDesc: "with Updated desc", index: index));
                  },
                  title: Text(state.allNotes[index]['title']),
                  subtitle: Text(state.allNotes[index]['desc']),
                  trailing: InkWell(
                    onTap: (){
                      context.read<ListBloc>().add(DeleteNoteEvent(index: index));
                    },
                      child: Icon(Icons.delete)),
                );
              });
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListBloc>()
              .add(AddNoteEvent(
                  title: "New Note",
                  desc: "Description here..")
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

}