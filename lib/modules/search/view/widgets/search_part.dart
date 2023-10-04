import '../../../../core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SearchPartItem extends StatelessWidget {
  final Function(dynamic val) onChange;
  const SearchPartItem({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:getHeight(15)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          Expanded(
              child: TextField(
                onChanged: (value) => onChange(value),
            decoration: InputDecoration(
              hintText: "Search for any book",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.primaryColor,width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.primaryColor,width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.primaryColor,width: 1.5),
              ),
            ),
          )),
         
        ],
      ),
    );
  }
}
