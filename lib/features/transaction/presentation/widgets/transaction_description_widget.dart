// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';

class TransactionDescriptionWidget extends StatelessWidget {
  const TransactionDescriptionWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if(controller.text!=''){
      context.read<TransactionBloc>().currentDescription = controller.text;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PaisaTextFormField(
        controller: controller,
        hintText: context.loc.description,
        keyboardType: TextInputType.name,
        onChanged: (value) =>
            context.read<TransactionBloc>().currentDescription = value,
      ),
    );
  }
}
