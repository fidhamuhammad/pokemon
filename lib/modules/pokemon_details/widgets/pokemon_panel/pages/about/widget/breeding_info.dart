import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:app/shared/models/pokemon.dart';
import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:app/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class BreedingInfoWidget extends StatelessWidget {
  static final _pokemonStore = GetIt.instance<PokemonStore>();

  const BreedingInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Text("Breeding",
                  // style:
                  //     textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                  style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Observer(
                          builder: (_) => Row(
                            children: [
                              Container(
                                width: 88,
                                child: Opacity(
                                  opacity: 0.4,
                                  child: Text(
                                    "Gender",
                                    // style: textTheme.bodyText1,
                                    style: GoogleFonts.lora(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              ..._pokemonStore.pokemon!.breeding.genders
                                  .map((gender) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Row(
                                    children: [
                                      if (gender.type == GenderType.MALE)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.mars,
                                            color: AppTheme.getColors(context)
                                                .marsIcon,
                                          ),
                                        ),
                                      if (gender.type == GenderType.FEMALE)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.venus,
                                            color: AppTheme.getColors(context)
                                                .venusIcon,
                                          ),
                                        ),
                                      if (gender.type == GenderType.UNKNOWN)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text("???",
                                              // style: textTheme.bodyText1,
                                              style: GoogleFonts.lora(
                                                  color: Colors.grey[900],
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      Text(
                                          gender.type == GenderType.UNKNOWN
                                              ? "--%"
                                              : "${gender.percentage}",
                                          // style: textTheme.bodyText1,
                                          style: GoogleFonts.lora(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          children: [
                            Container(
                              width: 88,
                              child: Opacity(
                                opacity: 0.4,
                                child: Text("Egg Groups",
                                    // style: textTheme.bodyText1,
                                    style: GoogleFonts.lora(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.breeding.egg!.groups.join(", ")}",
                                // style: textTheme.bodyText1,
                                style: GoogleFonts.lora(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Row(
                          children: [
                            Container(
                              width: 88,
                              child: Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "Egg Cycle",
                                  // style: textTheme.bodyText1,
                                  style: GoogleFonts.lora(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Text(
                                "${_pokemonStore.pokemon!.breeding.egg!.cycle}",
                                // style: textTheme.bodyText1,
                                style: GoogleFonts.lora(
                                        color: Colors.grey[900],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
