
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesine/core/core.dart' as core_widgets;
import 'package:nesine/feature/presentation/home/widgets/home_widget.dart';
import 'package:nesine/feature/presentation/home/widgets/index_home_widget.dart';
import 'package:nesine/feature/presentation/home/widgets/no_internet_widget.dart';
import 'package:nesine/feature/presentation/home/widgets/preview_list_widget.dart';
import 'package:nesine/servise_locator.dart';

import '../controller/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
        builder: (context, state) {
          return state.when(
              initial: () => const IndexHomeWidget(),
              page: (webController) => HomeWidget(
                controller: webController,
              ),
              internetError: () => const NoInternetWidget(),
              preview: (previewList) =>  PreviewListWidget(
                previewList: previewList,
                toCard: (preview) => BlocProvider.of<HomeController>(context).toCard(preview),
              ),
              loading: () => const core_widgets.LoadWidget(),
              empty: () => const core_widgets.LoadWidget(),
              error: (failure) => core_widgets.ErrorWidget(failure.message)
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeController>(
      create: (context) => sl<HomeController>()..init(),
      child: _buildBody(context),
    );
  }
}

