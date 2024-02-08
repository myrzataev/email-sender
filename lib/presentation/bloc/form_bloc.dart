import 'package:bloc/bloc.dart';
import 'package:form/data/repositories/post_email_repo.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FillFormState> {
  FormBloc({required this.repository}) : super(FormInitial()) {
    on<FillFormEvent>((event, emit) async {
      emit(FormLoading());
      try {
        await repository.sendEmail(
            name: event.fromName, toName: event.toName, message: event.message);
        emit(FormSuccess());
      } catch (e) {
        emit(FormError(errorText: e.toString()));
      }
    });
  }
  PostEmailRepo repository;
}
