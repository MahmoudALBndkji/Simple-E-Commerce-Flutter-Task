import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_flutter_task/core/constants/app_colors.dart';
import 'package:simple_ecommerce_flutter_task/core/languages/app_localizations.dart';
import 'package:simple_ecommerce_flutter_task/features/home/view_model/home_cubit.dart';

class CategoryFilterChips extends StatelessWidget {
  const CategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetAllProductsSuccessState ||
          current is GetAllProductsErrorState ||
          current is GetAllProductsLoadingState,
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        final List<String> categories = cubit.availableCategories;
        final List<String> allChips = ["all".tr(context), ...categories];
        if (allChips.isEmpty) {
          return const SizedBox.shrink();
        }
        return SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: allChips.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final String chipLabel = allChips[index];
              final bool isSelected = cubit.selectedCategory.toLowerCase() ==
                  chipLabel.toLowerCase();
              return FilterChip(
                label: Text(
                  chipLabel,
                  style: TextStyle(
                    color: isSelected
                        ? whiteColor
                        : primaryColor.withValues(alpha: 0.7),
                  ),
                ),
                selected: isSelected,
                onSelected: (_) => cubit.selectCategory(
                  chipLabel,
                  currentLangAr() ? "الكل" : "All",
                ),
                showCheckmark: false,
              );
            },
          ),
        );
      },
    );
  }
}
