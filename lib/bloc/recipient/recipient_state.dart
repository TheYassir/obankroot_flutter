part of 'recipient_bloc.dart';

class RecipientState extends Equatable {
  final List<RecipientModel> recipients;

  const RecipientState({required this.recipients});

  RecipientState copyWith({List<RecipientModel>? recipients}) {
    return RecipientState(
      recipients: recipients ?? this.recipients,
    );
  }

  @override
  List<Object?> get props => [
        recipients,
      ];

  @override
  String toString() {
    return 'RecipientState{recipients: $recipients}';
  }
}
