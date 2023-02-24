import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter_auth/core/base/view/base_view.dart';
import 'package:flutter_auth/core/constants/svg/svg_constants.dart';
import 'package:flutter_auth/core/extension/context_extension.dart';
import 'package:flutter_auth/core/extension/string_extension.dart';
import 'package:flutter_auth/core/init/lang/locale_keys.g.dart';
import 'package:flutter_auth/core/widget/avatar/onboard_circle.dart';
import 'package:flutter_auth/view/auth/onboard/model/onboard_model.dart';
import 'package:flutter_auth/view/auth/onboard/viewModel/onboard_view_model.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnboardViewModel viewModel) => Scaffold(
        backgroundColor: context.colors.background,
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 7,
                child: buildPageView(viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildRowFooter(viewModel, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnboardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemCount: viewModel.onBoardPages.length,
      itemBuilder: (context, index) {
        return buildColumnBody(
          context,
          viewModel.onBoardPages[index],
        );
      },
    );
  }

  Row buildRowFooter(OnboardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: buildCircle(viewModel),
        ),
        buildSkipButton(context, viewModel)
      ],
    );
  }

  ListView buildCircle(OnboardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return OnBoardCircle(isSelected: viewModel.currentIndex == index);
          },
        );
      },
    );
  }

  FloatingActionButton buildSkipButton(BuildContext context, OnboardViewModel viewModel) {
    return FloatingActionButton(
      elevation: 10,
      backgroundColor: context.colors.onSecondary,
      child: Text(
        LocaleKeys.onBoard_skip.locale,
        style: context.textTheme.bodyText2?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.colors.background,
        ),
      ),
      onPressed: () {
        viewModel.completeToOnBoard();
      },
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: buildSVGPicture(model.imagePath),
        ),
        buildColumnDescription(context, model),
      ],
    );
  }

  Padding buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Column(
        children: [
          AutoSizeText(
            textAlign: TextAlign.center,
            maxLines: 2,
            model.title,
            style: context.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.secondary,
            ),
          ),
          SizedBox(height: context.height * 0.03),
          AutoSizeText(
            textAlign: TextAlign.center,
            maxLines: 4,
            model.description,
            style: context.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400, color: context.colors.onBackground),
          ),
        ],
      ),
    );
  }

  SvgPicture buildSVGPicture(String path) => SvgPicture.asset(path);
}
