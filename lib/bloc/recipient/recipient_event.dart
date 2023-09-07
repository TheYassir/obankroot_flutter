part of 'recipient_bloc.dart';

sealed class RecipientEvent {
  const RecipientEvent();
}

class LoadRecipientsEvent extends RecipientEvent {
  final int? userId;
  const LoadRecipientsEvent({this.userId});
}

class DeleteRecipientEvent extends RecipientEvent {
  final int recipientId;
  const DeleteRecipientEvent({required this.recipientId});
}
