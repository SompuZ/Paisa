// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';

class TransactionAmountWidget extends StatelessWidget {
  const TransactionAmountWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    //final Parser parser = Parser();
    //final ContextModel contextModel = ContextModel();
    if(controller.text!=''){
      double? amount = double.tryParse(controller.text);
      context.read<TransactionBloc>().transactionAmount = amount;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PaisaTextFormField(
        controller: controller,
        hintText: context.loc.amount,
        maxLength: 13,
        maxLines: 1,
        counterText: '',
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r"[0-9 '.,-]")),
          TextInputFormatter.withFunction((oldValue, newValue) {
            try {
              final text = newValue.text;
              if (text.isNotEmpty) double.parse(text);
              return newValue;
            } catch (_) {}
            return oldValue;
          }),
        ],
        onChanged: (value) {
          print("Amount value chaned to "+value);
          double? amount = double.tryParse(value);
          context.read<TransactionBloc>().transactionAmount = amount;
        },
        validator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else {
            return context.loc.validAmount;
          }
        },
      ),
    );
  }
}
