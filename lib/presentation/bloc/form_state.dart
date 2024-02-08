part of 'form_bloc.dart';

@immutable
abstract class FillFormState {}

final class FormInitial extends FillFormState {}

final class FormLoading extends FillFormState {}

final class FormSuccess extends FillFormState {}

final class FormError extends FillFormState {
  final String errorText;
  FormError({required this.errorText});
}
