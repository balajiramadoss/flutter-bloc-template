import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/application/localizations/locale_keys.g.dart';
import 'package:starter/application/routes/router.gr.dart';
import 'package:starter/data/injection/injector.dart';
import 'package:starter/data/network/responses/quote.response.dart';
import 'package:starter/data/repositories/home_repository.dart';
import 'package:starter/presentation/styles/global.styles.dart';
import 'package:starter/presentation/styles/text_variants.dart';
import 'package:starter/presentation/ui/screens/home/bloc/home_bloc.dart';

///
@RoutePage()
class HomeScreen extends StatelessWidget {
  ///
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (_) =>
            HomeBloc(injector<HomeRepository>())..add(const InitialEvent()),
        child: Scaffold(
          appBar: AppBar(
            title: TextVariant(
              data: LocaleKeys.home.tr(),
              variantType: TextVariantType.headlineMedium,
              color: Theme.of(context).colorScheme.background,
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const ExampleScreen());
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.background,
                  ))
            ],
          ),
          body: const _HomeBody(),
        ));
  }
}

///
/// private widget
///
class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            QuotesSection(),
            Spacer(),
            TotalBoxCountSection()
          ],
        ));
  }
}

class CringeAsFWidget extends StatelessWidget {
  const CringeAsFWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(builder: (context,lol){
      return Container();
    }, listener: (context,state){

    });
  }
}


///
class QuotesSection extends StatelessWidget {
  ///
  const QuotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (HomeState previous, HomeState current) =>
            (current is HomeLoadingState) ||
            (current is HomeSuccessState) ||
            (current is HomeErrorState),
        builder: (BuildContext context, HomeState state) {
          switch (state) {
            case HomeLoadingState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeSuccessState():
              return QuoteBody(
                quote: state.data,
              );
            case HomeErrorState():
              return Center(
                child: TextVariant(data: state.errorData),
              );
            default:
              return const SizedBox.shrink();
          }
        });
  }
}

///
class TotalBoxCountSection extends StatelessWidget {
  ///
  const TotalBoxCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = GlobalTheme.getColorScheme(context);
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (HomeState previous, HomeState current) =>
            previous != current && current is HomeBoxesState,
        builder: (_, HomeState state) {
          if (state is HomeBoxesState) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: colorScheme.tertiaryContainer,
              child: TextVariant(
                data: state.data,
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}

///
class QuoteBody extends StatelessWidget {
  ///
  final QuoteResponse quote;

  ///
  const QuoteBody({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = GlobalTheme.getColorScheme(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorScheme.tertiaryContainer,
            ),
            padding: const EdgeInsets.all(16.0),
            child: TextVariant(
                color: colorScheme.onBackground,
                textAlign: TextAlign.center,
                data: quote.sentence ?? 'Empty',
                fontWeight: FontWeight.w600,
                variantType: TextVariantType.titleLarge),
          ),
          const SizedBox(height: 16),
          Align(
              alignment: Alignment.centerRight,
              child: TextVariant(
                data: '- ${quote.character?.name?.toUpperCase() ?? ''}',
                variantType: TextVariantType.labelLarge,
                color: colorScheme.primary,
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(const RefreshEvent());
              },
              child: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
