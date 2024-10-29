// Flutter imports:
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Project imports:
import 'package:paisa/core/common.dart';
import 'package:paisa/core/enum/transaction_type.dart';
import 'package:paisa/core/widgets/paisa_widget.dart';
import 'package:paisa/main.dart';
import 'package:paisa/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:paisa/features/transaction/presentation/widgets/expense_and_income_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/select_account_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/select_category_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_amount_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_date_picker_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_delete_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_description_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_name_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transaction_toggle_buttons_widget.dart';
import 'package:paisa/features/transaction/presentation/widgets/transfer_widget.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    super.key,
    this.transactionId,
    this.transactionType,
    this.accountId,
    this.categoryId,
  });

  final int? accountId;
  final int? categoryId;
  final int? transactionId;
  final TransactionType? transactionType;

  @override
  State<TransactionPage> createState() => _TransactionPageState();

}

class _TransactionPageState extends State<TransactionPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late final bool isAddExpense = widget.transactionId == null;
  final TextEditingController nameController = TextEditingController();
  final TransactionBloc transactionBloc = getIt<TransactionBloc>();

  StreamSubscription<List<SharedMediaFile>>? _intentDataStreamSubscription;
  String? _recognizedText;

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    _recognizedText='';
    nameController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    transactionBloc
      ..add(TransactionEvent.changeTransactionType(
          widget.transactionType ?? TransactionType.expense))
      ..add(TransactionEvent.findTransaction(widget.transactionId));


    // For sharing images coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.instance.getMediaStream().listen((List<SharedMediaFile> value) {
      //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Value"+value.toString());

      if (value.isNotEmpty) {
        _recognizeText(value.first.path);
        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      }
    }, onError: (err) {
      print("getMediaStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then((List<SharedMediaFile> value) {
      //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Value"+value.toString());
      if (value.isNotEmpty) {
        _recognizeText(value.first.path);
        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      }
    });
  }

  Future<void> _recognizeText(String imagePath) async {
    print("got file>>>>>>>>>>>>>>>>>"+imagePath);

    if(imagePath.contains('/cache/')){  // Image File shared

      final textRecognizer = TextRecognizer();
      final inputImage = InputImage.fromFile(File(imagePath));
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      print('>>>>>> GOT recognizedText:\n${recognizedText.text}');

      setState(() {
        List<String> values = getTransData(recognizedText.text).split('@');
        nameController.text=values[0];
        amountController.text=values[1];
        descriptionController.text=values[2];
      });

    }else{  //Text Shared

      // Extract information using regular expressions
      final receiverName = RegExp(r'for UPI to (.*?) on').firstMatch(imagePath)?.group(1)?.trim() ?? 'Unknown';
      final amount = RegExp(r'Debit Rs\.([0-9.,]+)').firstMatch(imagePath)?.group(1) ?? '0.00';
      final date = RegExp(r'on (\d{2}-\d{2}-\d{2})').firstMatch(imagePath)?.group(1) ?? 'Unknown';

      // Output the extracted information
      print('Receiver Name: $receiverName');
      print('Amount: Rs.$amount');
      print('Date: $date');

      setState(() {
        nameController.text=receiverName;
        amountController.text=amount;
        descriptionController.text=date;
      });
    }


  }

  String getTransData(String text){
    String name='',amount='',details='';

    if(text.contains('Google transaction ID')){ //GPay

      List<String> parts=text.split('\n');

      String receiver = '';
      double money = 0;
      String dateTime = '';

      for(String part in parts){
        if(receiver!='' && money!=0 && dateTime!='') break;
        print('>>${part}<<');
        // print('part.contains( am)='+part.contains(' am').toString());
        // print('part.contains( pm)='+part.contains(' pm').toString());
        // print('part.contains( To:)='+part.contains('To:').toString());
        // print('text.contains(To )='+text.contains('To ').toString());

        if (part.contains('To:') && text.contains("To ")) {
          receiver=part.replaceFirst("To:","");
        }
        else if(part.contains('From:') && text.contains("From ")) {
          receiver=part.replaceFirst("From:","");
        }
        else if (RegExp(r'\d').hasMatch(part) && money==0) {
          String cleanedInput = part.replaceAll(',', ''); // Remove commas
          cleanedInput = cleanedInput.replaceAll('O', '0'); // Replace 'O' with '0'
          cleanedInput = cleanedInput.replaceAll('?', ''); // Remove ?
          String currencyStr=double.tryParse(cleanedInput).toString();
          if(currencyStr!='null'){
            double temp=double.parse(currencyStr);
            if(temp<999999) money=temp;
          }
        } else if (part.contains(' am') || part.contains(' pm')) {
          dateTime = part;
        }
      }
      amount=money.toString();
      name=receiver;
      details=dateTime;

    }else if(text.contains('Transaction Successful')){ //PhonePay
      List<String> parts=text.split('\n');
      //print("part->"+parts[3]);

      for(String part in parts){
        if(part.contains(" AM") || part.contains(" PM") ||
            part.contains(" am") || part.contains(" pm")){
          details=part;
          break;
        }
      }
      name=parts[3];
      //details=parts[2];
      amount=parts[parts.length-1];

    }
    print('GOT Values----->$name@$amount@$details');
    return '$name@$amount@$details';
  }

  @override
  Widget build(BuildContext context) {
    return PaisaAnnotatedRegionWidget(
      color: context.background,
      child: BlocProvider(
        create: (context) => transactionBloc,
        child: BlocConsumer<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state is TransactionDeletedState) {
              context.showMaterialSnackBar(
                context.loc.deletedTransaction,
                backgroundColor: context.error,
                color: context.onError,
              );
              _intentDataStreamSubscription?.cancel();
              context.pop();
            } else if (state is TransactionAdded) {
              final content = state.isAddOrUpdate
                  ? context.loc.addedTransaction
                  : context.loc.updatedTransaction;
              context.showMaterialSnackBar(
                content,
                backgroundColor: context.primaryContainer,
                color: context.onPrimaryContainer,
              );
              _intentDataStreamSubscription?.cancel();
              context.pop();
            } else if (state is TransactionErrorState) {
              context.showMaterialSnackBar(
                state.errorString,
                backgroundColor: context.errorContainer,
                color: context.onErrorContainer,
              );
            } else if (state is TransactionFoundState) {
              nameController.text = state.transaction.name;
              nameController.selection = TextSelection.collapsed(
                offset: state.transaction.name.length,
              );
              amountController.text = state.transaction.currency.toString();
              print("Amount=${state.transaction.currency}");
              amountController.selection = TextSelection.collapsed(
                offset: state.transaction.currency.toString().length,
              );
              descriptionController.text = state.transaction.description ?? '';
              descriptionController.selection = TextSelection.collapsed(
                offset: state.transaction.description?.length ?? 0,
              );
            }
          },
          builder: (context, state) {
            if (_recognizedText != '') {  // Pre selecting first account and first category
              //context.read<TransactionBloc>().selectedAccountId =1;
              //context.read<TransactionBloc>().selectedCategoryId =1;
            }
            if (widget.accountId != null) {
              context.read<TransactionBloc>().selectedAccountId =
                  widget.accountId;
            }
            if (widget.categoryId != null) {
              context.read<TransactionBloc>().selectedCategoryId =
                  widget.categoryId;
            }
            return ScreenTypeLayout.builder(
              mobile: (p0) => Scaffold(
                extendBody: true,
                appBar: AppBar(
                  title: Text(
                    isAddExpense
                        ? context.loc.addTransaction
                        : context.loc.updateTransaction,
                    style: context.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TransactionToggleButtons(),
                    ),
                  ),
                  actions: [
                    TransactionDeleteWidget(expenseId: widget.transactionId),
                  ],
                ),
                body: BlocBuilder<TransactionBloc, TransactionState>(
                  buildWhen: (previous, current) =>
                      current is ChangeTransactionTypeState,
                  builder: (context, state) {
                    if (state is ChangeTransactionTypeState) {
                      if (state.transactionType == TransactionType.transfer) {
                        return TransferWidget(controller: amountController);
                      } else {
                        return ExpenseIncomeWidget(
                          amountController: amountController,
                          descriptionController: descriptionController,
                          nameController: nameController,
                        );
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PaisaBigButton(
                      onPressed: () {
                        context
                            .read<TransactionBloc>()
                            .add(TransactionEvent.addOrUpdate(isAddExpense));
                      },
                      title:
                          isAddExpense ? context.loc.add : context.loc.update,
                    ),
                  ),
                ),
              ),
              tablet: (p0) => Scaffold(
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    systemNavigationBarColor: Colors.transparent,
                    statusBarIconBrightness:
                        MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Brightness.light
                            : Brightness.dark,
                  ),
                  iconTheme: IconThemeData(
                    color: context.onSurface,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    isAddExpense
                        ? context.loc.addTransaction
                        : context.loc.updateTransaction,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  actions: [
                    TransactionDeleteWidget(expenseId: widget.transactionId),
                    PaisaButton(
                      onPressed: () {
                        context
                            .read<TransactionBloc>()
                            .add(TransactionEvent.addOrUpdate(isAddExpense));
                      },
                      title:
                          isAddExpense ? context.loc.add : context.loc.update,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                body: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const TransactionToggleButtons(),
                              const SizedBox(height: 16),
                              TransactionNameWidget(controller: nameController),
                              const SizedBox(height: 16),
                              TransactionDescriptionWidget(
                                  controller: descriptionController),
                              const SizedBox(height: 16),
                              TransactionAmountWidget(
                                  controller: amountController),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: ExpenseDatePickerWidget(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: const [
                          SelectedAccountWidget(),
                          SelectCategoryWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
