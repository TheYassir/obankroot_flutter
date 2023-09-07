import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/bloc/auth/auth_bloc.dart';
import 'package:obankroot/components/obankroot_appbar.dart';
import 'package:obankroot/components/obankroot_bottom_navbar.dart';

class TransferPage extends StatefulWidget {
  TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? _selectedOption1;
  String? _selectedOption2;

  final List<String> _dropdownOptions1 = [
    'Personal acccount - 4510.75€',
    'Join account - 7589.89€'
  ];
  final List<String> _dropdownOptions2 = [
    'Recipient\'s name',
    'Recipient\'s name'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const ObankrootAppBar(
            title: 'Transfer',
          ),
          bottomNavigationBar: const ObankrootBottomNavBar(),
          body: Padding(
            padding: const EdgeInsets.all(46.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: _selectedOption1,
                            hint: const Text('From Account *'),
                            onChanged: (value) {
                              setState(() {
                                _selectedOption1 = value;
                              });
                            },
                            items: _dropdownOptions1.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.input),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: 'Amount to transfer*'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButton<String>(
                            value: _selectedOption2,
                            hint: const Text('Recipient\'s name'),
                            onChanged: (value) {
                              setState(() {
                                _selectedOption2 = value;
                              });
                            },
                            items: _dropdownOptions2.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.input),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: 'Transaction name'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      child: const Text('Logout'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
