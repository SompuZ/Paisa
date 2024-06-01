// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/common_enum.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';

class TransactionNameWidget extends StatelessWidget {
  const TransactionNameWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if(controller.text!=''){
      context.read<TransactionBloc>().expenseName = controller.text;
    }

    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (oldState, newState) => newState is ChangeTransactionTypeState,
      builder: (context, state) {
        String hintName = TransactionType.expense.hintName(context);
        if (state is ChangeTransactionTypeState) {
          hintName = state.transactionType.hintName(context);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PaisaTextFormField(
            maxLines: 1,
            controller: controller,
            hintText: hintName,
            inputFormatters: [
              FilteringTextInputFormatter.singleLineFormatter,
            ],
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              } else {
                return context.loc.validName;
              }
            },
            onChanged: (value) =>
                context.read<TransactionBloc>().expenseName = value,
          ),
        );
      },
    );
  }
}
