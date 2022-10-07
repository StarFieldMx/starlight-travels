import 'package:flutter/material.dart';
import 'package:starlight/models/hotels.dart';

class ConstrainedBoxStarlight extends StatelessWidget {
  const ConstrainedBoxStarlight(
      {super.key, required this.maxHeight, required this.child});
  final double maxHeight;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      constraints: BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: maxHeight,
      ),
      child: child,
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.size,
    required this.hotel,
  }) : super(key: key);

  final Size size;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBoxStarlight(
        maxHeight: size.height * 0.8,
        child: _ItemDetails(
          title: '',
          child: ConstrainedBoxStarlight(
            maxHeight: size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Text("Dirección",
                        style: Theme.of(context).textTheme.headline4)),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text(hotel.direction.direction,
                        style: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Text("Comida y bebidas",
                        style: Theme.of(context).textTheme.headline4)),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text(
                        "Restaurante disponible: ${hotel.foodDrink.availableTime}",
                        style: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text("Restaurantes: ${hotel.foodDrink.restaurants}",
                        style: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text("Bares: ${hotel.foodDrink.bars}",
                        style: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Text("Internet",
                        style: Theme.of(context).textTheme.headline4)),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[0].rooms ?? false)
                  const _DotText(text: "Cuartos"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.bar ?? false)
                  const _DotText(text: "Alberca"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.public ?? false)
                  const _DotText(text: "Area publica"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.restaurant ?? false)
                  const _DotText(text: "Restaurante"),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                    child: Text("Accesibilidad",
                        style: Theme.of(context).textTheme.headline4)),
                const SizedBox(
                  height: 10,
                ),
                if (!hotel.accessibility.elevator && !hotel.accessibility.ramps)
                  const _DotText(text: "No cuenta"),
                if (hotel.accessibility.elevator)
                  const _DotText(text: "Elevadores"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.accessibility.ramps) const _DotText(text: "Rampas"),
              ],
            ),
          ),
        ));
  }
}

class Amenities extends StatelessWidget {
  const Amenities({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBoxStarlight(
      maxHeight: 300,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 6 / 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10),
          itemCount: hotel.amenties.listAmenties.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              child: _getAmentiesItem(hotel.amenties.listAmenties[index]),
            );
          }),
    );
  }
}

class _DotText extends StatelessWidget {
  const _DotText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('\u2022'),
        const SizedBox(
          width: 15,
        ),
        Flexible(
            child: Text(text, style: Theme.of(context).textTheme.titleMedium)),
      ],
    );
  }
}

class _ItemDetails extends StatelessWidget {
  const _ItemDetails({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.headline5),
        child
      ],
    );
  }
}

Widget _getAmentiesItem(AmentiesType ams) {
  switch (ams) {
    case AmentiesType.internet:
      return const _ItemAmenties(Icons.wifi, "Internet Gratis");
    case AmentiesType.pool:
      return const _ItemAmenties(Icons.pool, "Piscina");
    case AmentiesType.air:
      return const _ItemAmenties(Icons.air, "Aire acondicionado");
    case AmentiesType.pet:
      return const _ItemAmenties(Icons.pets, "Se permiten mascotas");
    case AmentiesType.parking:
      return const _ItemAmenties(Icons.local_parking, "Estacionamiento propio");
    case AmentiesType.breakfast:
      return const _ItemAmenties(Icons.breakfast_dining, "Cuenta con desayuno");
    case AmentiesType.restaurant:
      return const _ItemAmenties(Icons.restaurant, "Tiene restaurante");
    case AmentiesType.bar:
      return const _ItemAmenties(Icons.local_bar, "Tiene bar");
    case AmentiesType.housekeeping:
      return const _ItemAmenties(
          Icons.cleaning_services, "Servicio de limpieza");
    case AmentiesType.frontDesk:
      return const _ItemAmenties(Icons.desk, "Recepción 24/7");
    case AmentiesType.none:
      return const _ItemAmenties(Icons.error, "No cuenta con comodidades");
  }
}

class _ItemAmenties extends StatelessWidget {
  const _ItemAmenties(this.icon, this.text);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 35),
        const SizedBox(
          width: 8,
        ),
        Flexible(
            child: Text(text, style: Theme.of(context).textTheme.headline6)),
      ],
    );
  }
}
