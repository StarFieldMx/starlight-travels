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
        child: ItemDetails(
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
                  const DotText(text: "Cuartos"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.bar ?? false)
                  const DotText(text: "Alberca"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.public ?? false)
                  const DotText(text: "Area publica"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.internet[1].places?.restaurant ?? false)
                  const DotText(text: "Restaurante"),
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
                  const DotText(text: "No cuenta"),
                if (hotel.accessibility.elevator)
                  const DotText(text: "Elevadores"),
                const SizedBox(
                  height: 10,
                ),
                if (hotel.accessibility.ramps) const DotText(text: "Rampas"),
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

class DotText extends StatelessWidget {
  const DotText({
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

class ItemDetails extends StatelessWidget {
  const ItemDetails({
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
      return const ItemAmenties(Icons.wifi, "Internet Gratis");
    case AmentiesType.pool:
      return const ItemAmenties(Icons.pool, "Piscina");
    case AmentiesType.air:
      return const ItemAmenties(Icons.air, "Aire acondicionado");
    case AmentiesType.pet:
      return const ItemAmenties(Icons.pets, "Se permiten mascotas");
    case AmentiesType.parking:
      return const ItemAmenties(Icons.local_parking, "Estacionamiento propio");
    case AmentiesType.breakfast:
      return const ItemAmenties(Icons.breakfast_dining, "Cuenta con desayuno");
    case AmentiesType.restaurant:
      return const ItemAmenties(Icons.restaurant, "Tiene restaurante");
    case AmentiesType.bar:
      return const ItemAmenties(Icons.local_bar, "Tiene bar");
    case AmentiesType.housekeeping:
      return const ItemAmenties(
          Icons.cleaning_services, "Servicio de limpieza");
    case AmentiesType.frontDesk:
      return const ItemAmenties(Icons.desk, "Recepción 24/7");
    case AmentiesType.none:
      return const ItemAmenties(Icons.error, "No cuenta con comodidades");
  }
}

class ItemAmenties extends StatelessWidget {
  const ItemAmenties(this.icon, this.text, {super.key});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Icon(icon, size: 25),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 140,
          // height: size.height * 0.1,
          child: Flexible(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        ),
      ],
    );
  }
}
