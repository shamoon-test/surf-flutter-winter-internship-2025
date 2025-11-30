import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition_tech/core/router/routes.dart';
import 'package:nutrition_tech/presentation/widgets/receipt_card.dart';

import '../../domain/entities/receipt.dart';
import '../bloc/receipts_bloc.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рецепты')),
      body: BlocBuilder<ReceiptsBloc, ReceiptsState>(
        builder: (context, receiptsState) {
          if (receiptsState is ReceiptsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (receiptsState is ReceiptsErrorLoad) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Произошла ошибка')),
                TextButton(
                  onPressed: () {
                    context.read<ReceiptsBloc>().add(ReceiptsGetList());
                  },
                  child: Text('Перезагрузить'),
                ),
              ],
            );
          }
          List<Receipt> receipts = [];
          if (receiptsState is ReceiptsLoaded) {
            receipts = receiptsState.data;
          }

          if (receipts.isEmpty) {
            return Center(
              child: Text('Создайте свой первый рецепт'),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: receipts.length,
            itemBuilder: (context, index) => ReceiptCard(
              receipt: receipts[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoute.createReceipt.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
