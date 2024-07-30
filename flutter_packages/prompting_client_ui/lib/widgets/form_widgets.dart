import 'package:flutter/material.dart';
import 'package:prompting_client_ui/widgets/iterable_extensions.dart';
import 'package:prompting_client_ui/widgets/markdown_text.dart';
import 'package:yaru/yaru.dart';

class RadioButtonList<T> extends StatelessWidget {
  const RadioButtonList({
    required this.title,
    required this.options,
    required this.optionTitle,
    required this.groupValue,
    this.onChanged,
    this.optionSubtitle,
    this.toggleable = false,
    this.direction = Axis.vertical,
    super.key,
  });

  final String title;
  final Iterable<T> options;
  final String Function(T option) optionTitle;
  final String Function(T option)? optionSubtitle;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final bool toggleable;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(title.bold()),
        const SizedBox(height: 10),
        Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: direction,
          children: [
            for (final option in options)
              YaruRadioButton<T>(
                value: option,
                groupValue: groupValue,
                onChanged: onChanged,
                title: Text(optionTitle(option)),
                subtitle: optionSubtitle != null
                    ? Text(
                        optionSubtitle!(option),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      )
                    : null,
                toggleable: toggleable,
              ),
          ].withSpacing(direction == Axis.horizontal ? 16 : 0),
        ),
      ],
    );
  }
}

class CheckButtonList<T> extends StatelessWidget {
  const CheckButtonList({
    required this.title,
    required this.options,
    required this.optionTitle,
    required this.hasOption,
    required this.isEnabled,
    required this.toggleOption,
    super.key,
  });

  final String title;
  final Iterable<T> options;
  final String Function(T option) optionTitle;
  final bool Function(T option) hasOption;
  final bool Function(T option) isEnabled;
  final void Function(T option) toggleOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarkdownText(title.bold()),
        const SizedBox(height: 10),
        Row(
          children: [
            for (final option in options)
              YaruCheckButton(
                value: hasOption(option),
                onChanged:
                    isEnabled(option) ? (_) => toggleOption(option) : null,
                title: Text(optionTitle(option)),
              ),
          ].withSpacing(16),
        ),
      ],
    );
  }
}
