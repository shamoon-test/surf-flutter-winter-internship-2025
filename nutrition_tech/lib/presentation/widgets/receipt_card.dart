import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/domain/entities/receipt.dart';
import 'package:nutrition_tech/presentation/bloc/receipts_bloc.dart';
import 'package:nutrition_tech/presentation/widgets/nutritions_render.dart';

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({required this.receipt, super.key});

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(receipt.name),
            trailing: IconButton(
              onPressed: () {
                context.read<ReceiptsBloc>().add(ReceiptsDelete(receipt.uuid));
              },
              icon: Icon(Icons.delete_forever, color: Colors.red),
            ),
          ),
          if (receipt.description != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(receipt.description!),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(receipt.fruitsNames),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NutritionsRender(receipt.nutritions),
          ),
        ],
      ),
    );
  }
}
