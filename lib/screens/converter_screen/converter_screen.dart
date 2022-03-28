import 'package:first/screens/converter_screen/converter_bloc/converter_bloc.dart';
import 'package:first/screens/error_message/error_message.dart';
import 'package:first/screens/converter_screen/currency_card.dart';
import 'package:first/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => ConverterScreenState();
}

class ConverterScreenState extends State<ConverterScreen>
  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _topAnimation;
  late Animation<Offset> _bottomAnimation;
  late Animation<double> _animation;

  @override
  void initState (){
    super.initState();
    _animationController=AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _topAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _bottomAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(-1.5, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _animation = Tween<double>(
      begin:0.0,
        end:1.0,
    ).animate(CurvedAnimation(curve: Curves.easeInOutCirc, parent: _animationController));

    // _animationController.addListener(() {
    //   if (_animationController.value==1) {
    //     _animationController.forward(from:0);
    //   }
    // });
    _animationController.addStatusListener((status) {print('$status');});

  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Converter'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.update),
          onPressed: () {

          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 210,
                child: BlocBuilder<ConverterBloc, ConverterState>(
                  builder: (context, state) {
                    if (state is ConverterLoading) {
                      return
                        // Container();
                        const Center(child: CircularProgressIndicator());
                    }
                    if (state is ConverterError) {
                      return
                        ErrorMessage(
                        error: state.error,
                        onTap: () => context.read<ConverterBloc>().add(GetConverterData()),
                      );
                    }
                    if (state is ConverterSuccess) {
                      _animationController.animateTo(0.5);
                      _animationController.addListener(() {
                        if (_animationController.value==1.0) {
                          context.read<ConverterBloc>().add(SwitchCurrencies());
                          _animationController.forward(from: 0.0);
                        }
                      });
                      return
                        SlideTransition(
                          position: _topAnimation,
                          child: CurrencyCard(currency: state.converter.currencyTop,
                            controller: context.read<ConverterBloc>().topController,
                            onChanged: (currency) {
                              context.read<ConverterBloc>().add(CurrencyTopChanged(currency));
                            },
                            onInputValueChanged: (value) {context.read<ConverterBloc>().add(Convert(value));},
                          ),
                        );
                    }
                    return const Center(child:  Text('Internal Error'));
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.read<ConverterBloc>().add(Convert());
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.all(8),
                    //   ),
                    //   child: const Text('=', style: TextStyle(fontSize: 30)),
                    // ),
                    FadeTransition(
                      opacity: _animation,
                      child: ElevatedButton(
                        onPressed: () {
                            _animationController.forward();
                            // context.read<ConverterBloc>().add(SwitchCurrencies());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.import_export),
                            Text('Switch Currencies'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 210,
                child: BlocBuilder<ConverterBloc, ConverterState>(
                    builder: (context, state) {
                      if (state is ConverterLoading) {
                        return
                          // Container();
                          const Center(child: CircularProgressIndicator());
                      }
                      if (state is ConverterError) {
                        return
                          ErrorMessage(
                            error: state.error,
                            onTap: () => context.read<ConverterBloc>().add(GetConverterData()),
                          );
                      }
                      if (state is ConverterSuccess) {
                        return
                          SlideTransition(
                            position: _bottomAnimation,
                            child: CurrencyCard(currency: state.converter.currencyDown,
                              controller: context.read<ConverterBloc>().bottomController,
                              onChanged: (currency) {
                                context.read<ConverterBloc>().add(CurrencyDownChanged(currency));},
                              onInputValueChanged: (value) {context.read<ConverterBloc>().add(ConvertBack(value));},
                            ),
                          );
                      }
                      return const Center(child: Text('Internal Error'));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
