import 'package:express_testing/features/tests_pages/presentation/widget/test_item.dart';
import 'package:flutter/material.dart';

class TestVariantsView extends StatelessWidget {
  const TestVariantsView({
    super.key,
    required this.onChangedSelectVariant,
    required this.variants,
    required this.currentLanguage,
    required this.isShowTrueAnswer,
    required this.currentTestTrueAnswerIndex,
    required this.currentTestSelectVariantIndex,
  });

  final Function(String selectedVariantText, int selectVariantIndex)
      onChangedSelectVariant;
  final List<String> variants;
  final String currentLanguage;
  final bool isShowTrueAnswer;
  final int currentTestTrueAnswerIndex;
  final int currentTestSelectVariantIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(variants.length, (index) {
        return TestItem(
          onTab: () => onChangedSelectVariant.call(variants[index], index),
          isError: index == currentTestSelectVariantIndex && isShowTrueAnswer,
          isActive: index == currentTestTrueAnswerIndex && isShowTrueAnswer,
          title: variants[index],
          leadingTitle: _getLetter(index + 1, currentLanguage),
        );
      }),
    );
  }

  String _getLetter(int index, String languageCode) {
    Map<String, String> alphabets = {
      'en': 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'ru': 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ',
      'uz': 'ABCDЕFGHIJKLMNOPQRSTUЎVXYZ'
    };

    // Agar noto‘g‘ri til kodi bo‘lsa yoki index diapazondan tashqarida bo‘lsa
    if (!alphabets.containsKey(languageCode)) return 'Unknown language';
    if (index < 1 || index > alphabets[languageCode]!.length) {
      return 'Invalid index';
    }

    return alphabets[languageCode]![index - 1]; // 0-indeks bo‘lgani uchun -1
  }
}
