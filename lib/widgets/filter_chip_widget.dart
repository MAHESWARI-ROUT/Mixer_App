import 'package:dating_app/models/app_colors.dart';
import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    Key? key,
    required this.label,
    this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[50] : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.purple[400]! : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: isSelected ? Colors.purple[600] : Colors.grey[600],
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'ManRope',
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.purple[600] : Colors.grey[600],
              ),
            ),
            if (label != 'Filters') ...[
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: isSelected ? AppColors.purpleApp : Colors.grey[600],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class FilterChipsRow extends StatefulWidget {
  const FilterChipsRow({Key? key}) : super(key: key);

  @override
  State<FilterChipsRow> createState() => _FilterChipsRowState();
}

class _FilterChipsRowState extends State<FilterChipsRow> {
  String? _selectedOption;

  void _onOptionTap(String label) {
    setState(() {
      _selectedOption = _selectedOption == label ? null : label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFiltersSelected = _selectedOption != null;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterChipWidget(
          label: 'Filters',
          icon: Icons.tune,
          isSelected: isFiltersSelected,
          onTap: () {
            setState(() {
              _selectedOption = null; 
            });
          },
        ),
        const SizedBox(width: 12),
        FilterChipWidget(
          label: 'Age',
          onTap: () => _onOptionTap('Age'),
        ),
        const SizedBox(width: 12),
        FilterChipWidget(
          label: 'Height',
          onTap: () => _onOptionTap('Height'),
        ),
        const SizedBox(width: 12),
        FilterChipWidget(
          label: 'Habits',
          onTap: () => _onOptionTap('Habits'),
        ),
      ],
    );
  }
}
