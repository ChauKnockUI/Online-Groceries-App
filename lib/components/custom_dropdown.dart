import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/dropdown/custom_dropdown_cubit.dart';
import '../blocs/dropdown/custom_dropdown_state.dart';

class CustomDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String name;
  final bool showSelectButton;
  final Function(Map<String, dynamic>)? onSelect;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.name,
    this.showSelectButton = true,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomDropdownCubit(),
      child: BlocBuilder<CustomDropdownCubit, CustomDropdownState>(
        builder: (context, state) {
          final cubit = context.read<CustomDropdownCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF53B175),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(color: Colors.white)),
                        const SizedBox(height: 4),
                        Text(
                          state.selectedItem ?? "Select $name",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: cubit.toggleExpand,
                      icon: Icon(
                        state.isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isExpanded)
                Container(
                  height: 310,
                  decoration: const BoxDecoration(
                    color: Color(0xFF53B175),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final itemName = item['name'] as String;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                if (item['image'] != null)
                                  Image.asset(
                                    item['image'],
                                    width: 60,
                                    height: 50,
                                  ),
                                const SizedBox(width: 12),
                                Text(
                                  itemName,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            if (showSelectButton)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  textStyle: const TextStyle(fontSize: 14),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  cubit.selectItem(itemName);
                                  onSelect?.call(item);
                                },
                                child: const Text("Select"),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
