part of 'form_bloc.dart';

@immutable
sealed class FormEvent {}

class FillFormEvent extends FormEvent {
  final String fromName;
  final String toName;
  final String message;
  FillFormEvent(
      {required this.fromName, required this.message, required this.toName});
}
