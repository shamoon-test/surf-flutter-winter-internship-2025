import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrition_tech/presentation/bloc/receipts_bloc.dart';

import '../../domain/entities/fruit.dart';
import '../bloc/favorites_bloc.dart';
import '../widgets/fruit_card.dart';

class CreateReceiptPage extends StatefulWidget {
  const CreateReceiptPage({super.key});

  @override
  State<CreateReceiptPage> createState() => _CreateReceiptPageState();
}

class _CreateReceiptPageState extends State<CreateReceiptPage> {
  final name = TextEditingController();
  final description = TextEditingController();
  List<Fruit> selectedFruits = [];

  @override
  Widget build(BuildContext context) {
    bool canSave = name.text.isNotEmpty && selectedFruits.isNotEmpty;
    return Scaffold(
      appBar: AppBar(title: Text('Создание рецепта')),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: canSave
              ? () {
                  context.read<ReceiptsBloc>().add(
                    ReceiptsCreate(
                      name: name.text,
                      description: description.text,
                      fruits: selectedFruits,
                    ),
                  );
                  context.pop();
                }
              : null,
          child: Text('Сохранить'),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  label: Text('Название'),
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),

              SizedBox(height: 4),

              TextField(
                controller: description,
                maxLines: 4,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  label: Text('Описание рецепта'),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => setState(() {}),
              ),

              SizedBox(height: 4),
              BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, fruitsState) {
                  if (fruitsState is FavoritesLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (fruitsState is FavoritesErrorLoad) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('Произошла ошибка')),
                        TextButton(
                          onPressed: () {
                            context.read<FavoritesBloc>().add(
                              FavoritesGetList(),
                            );
                          },
                          child: Text('Повторить'),
                        ),
                      ],
                    );
                  }
                  List<Fruit> fruits = [];
                  if (fruitsState is FavoritesLoaded) {
                    fruits = fruitsState.data;
                  }

                  if (fruits.isEmpty) {
                    return Center(
                      child: Text('Вы пока ничего не добавили в избранное'),
                    );
                  }

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: fruits.length,
                    itemBuilder: (context, index) => FruitCard(
                      fruit: fruits[index],
                      selected: selectedFruits.contains(fruits[index]),
                      onTap: () {
                        setState(() {
                          if (!selectedFruits.remove(fruits[index])) {
                            selectedFruits.add(fruits[index]);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
