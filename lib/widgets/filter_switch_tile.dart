import 'package:flutter/material.dart';

class FilterSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;
  final String subtitle;
  final Color? activeColor;
  final EdgeInsetsGeometry contentPadding;

  const FilterSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    this.activeColor,
    this.contentPadding = const EdgeInsets.only(left: 34, right: 22),
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: activeColor ?? Theme.of(context).colorScheme.tertiary,
      contentPadding: contentPadding,
    );
  }
}
