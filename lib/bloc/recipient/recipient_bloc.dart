import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/recipient_model.dart';
import '../../services/recipient_service.dart';

part 'recipient_event.dart';
part 'recipient_state.dart';

class RecipientBloc extends Bloc<RecipientEvent, RecipientState> {
  RecipientBloc() : super(const RecipientState(recipients: [])) {
    on<LoadRecipientsEvent>((event, emit) async {
      List<RecipientModel> recipients =
          await RecipientService().getRecipients();
      recipients = recipients
          .where((recipient) => recipient.userId == event.userId)
          .toList();
      emit(state.copyWith(recipients: recipients));
    });

    on<DeleteRecipientEvent>((event, emit) async {
      await RecipientService().deleteOneRecipient(event.recipientId);
      emit(state.copyWith());
    });
  }
}
