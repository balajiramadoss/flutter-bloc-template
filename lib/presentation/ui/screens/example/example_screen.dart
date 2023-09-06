import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/data/models/example.model.dart';
import 'package:starter/presentation/styles/text_variants.dart';
import 'package:starter/presentation/ui/screens/example/bloc/example_bloc.dart';
import 'package:starter/presentation/ui/widgets/component_box.dart';

///
/// [ExampleScreen]
///
@RoutePage()
class ExampleScreen extends StatelessWidget {
  ///
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleBloc>(
      create: (BuildContext context) {
        return ExampleBloc()..registerEvents();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TextVariant(
              data: 'Example', variantType: TextVariantType.titleMedium),
        ),
        body: const _ExampleBody(),
      ),
    );
  }
}

class _ExampleBody extends StatelessWidget {
  const _ExampleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: <Widget>[
          _GreenBoxListWidget(),
          SizedBox(height: 20),
          _RedBoxListWidget(),
          SizedBox(height: 20),
          _TotalCalculationWidget()
        ],
      ),
    );
  }
}

///
class _RedBoxListWidget extends StatelessWidget {
  const _RedBoxListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExampleBloc, ExampleState, List<RedBox>?>(
        selector: (ExampleState state) {
      return state.redBoxes;
    }, builder: (_, List<RedBox>? redBoxes) {
      return SizedBox(
        height: 180,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int pos) {
            RedBox item = redBoxes![pos];
            return BoxComponent(
              onTap: () {
                context.read<ExampleBloc>().add(RedBoxClickEvent(index: pos));
              },
              color: item.color,
              isSelected: item.isSelected,
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(width: 16);
          },
          itemCount: redBoxes?.length ?? 0,
        ),
      );
    });
  }
}

///
class _GreenBoxListWidget extends StatelessWidget {
  const _GreenBoxListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExampleBloc, ExampleState, List<GreenBox>?>(
        selector: (ExampleState state) {
      return state.greenBoxes;
    }, builder: (_, List<GreenBox>? greenBoxes) {
      return SizedBox(
        // we can use SingleChildScrollView + Row to avoid static height but it affect performance
        height: 180,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int pos) {
            GreenBox item = greenBoxes![pos];
            return BoxComponent(
              onTap: () {
                context.read<ExampleBloc>().add(GreenBoxClickEvent(index: pos));
              },
              color: item.color,
              isSelected: item.isSelected,
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(width: 16);
          },
          itemCount: greenBoxes?.length ?? 0,
        ),
      );
    });
  }
}

///
class _TotalCalculationWidget extends StatelessWidget {
  const _TotalCalculationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExampleBloc bloc = BlocProvider.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          TextVariant(
              data:
                  'Total Green Boxes Selected  ==> ${(bloc.state).greenBoxes?.where((GreenBox element) => element.isSelected).length}'),
          TextVariant(
              data:
                  'Total Red Boxes Selected  ==> ${(bloc.state).redBoxes?.where((RedBox element) => element.isSelected).length}'),
          ElevatedButton(
              onPressed: () {
                bloc.add(const DataPassEvent());
              },
              child: const TextVariant(data: 'Send Data To Home'))
        ],
      ),
    );
  }
}
