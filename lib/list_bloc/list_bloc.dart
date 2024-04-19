import 'package:bloc/bloc.dart';
import 'package:bloc_239/list_bloc/list_state.dart';

import 'list_event.dart';



class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState(allNotes: [])) {

    on<AddNoteEvent>((event, emit) {
      var mData = state.allNotes;
      mData.add({
        'title' : event.title,
        'desc' : event.desc
      });
      emit(ListState(allNotes: mData));
    });

    on<UpdateNoteEvent>((event, emit) {
      var mData = state.allNotes;

      mData[event.index] = {
        'title' : event.updatedTitle,
        'desc' : event.updatedDesc
      };

      emit(ListState(allNotes: mData));

    });

    on<DeleteNoteEvent>((event, emit){

      var mData = state.allNotes;

      mData.removeAt(event.index);

      emit(ListState(allNotes: mData));

    });
  }
}
