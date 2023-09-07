import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/recipient/recipient_bloc.dart';
import 'package:obankroot/components/obankroot_appbar.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';
import '../components/recipient_card.dart';

class RecipientsPage extends StatelessWidget {
  const RecipientsPage({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecipientBloc()..add(LoadRecipientsEvent(userId: userId)),
      child: Scaffold(
        appBar: const ObankrootAppBar(
          title: 'Recipients',
        ),
        bottomNavigationBar: const ObankrootBottomNavBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<RecipientBloc, RecipientState>(
                    builder: (context, state) {
                  return ListView.builder(
                      itemCount: state.recipients.length,
                      itemBuilder: (context, index) {
                        return RecipientCard(
                            recipient: state.recipients[index]);
                      });
                }),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromRGBO(113, 28, 204, 1),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
