import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlight/services/hotels_services.dart';
import 'package:starlight/views/main_views.dart' show HotelsView;
import 'package:starlight/widgets/loading_starlight.dart';

class LayoutHotelsView extends StatelessWidget {
  const LayoutHotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = Provider.of<HotelsServices>(context);
    hotels.context;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hoteles disponibles'),
      ),
      body: HotelsView(hotels: hotels),
    );
  }
}
