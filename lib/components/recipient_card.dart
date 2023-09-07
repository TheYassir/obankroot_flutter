import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/recipient/recipient_bloc.dart';
import '../models/recipient_model.dart';

class RecipientCard extends StatelessWidget {
  const RecipientCard({super.key, required this.recipient});
  final RecipientModel recipient;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text("{{recipient.name}}"),
        subtitle: Text(recipient.iban),
        trailing: IconButton(
          onPressed: () {
            context
                .read<RecipientBloc>()
                .add(DeleteRecipientEvent(recipientId: recipient.id));
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
