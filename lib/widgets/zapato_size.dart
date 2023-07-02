import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/helpers/helpers.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullscreen;
  const ZapatoSizePreview({super.key, this.fullscreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullscreen) {
          cambiarStatusLight();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ZapatoDescPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullscreen) ? 5 : 30, vertical: (fullscreen) ? 5 : 0),
        child: Container(
            width: double.infinity,
            height: (fullscreen) ? 400 : 430,
            decoration: BoxDecoration(
              color: const Color(0xffffcf53),
              borderRadius: (!fullscreen)
                  ? BorderRadius.circular(40)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                const _ZapatoConSombra(),
                if (!fullscreen) const _ZapatoTallas(),
              ],
            )),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra();

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffEAA14E),
                blurRadius: 40,
              )
            ]),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoBox(7),
          _TallaZapatoBox(7.5),
          _TallaZapatoBox(8),
          _TallaZapatoBox(8.5),
          _TallaZapatoBox(9),
          _TallaZapatoBox(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoBox extends StatelessWidget {
  final double talla;

  const _TallaZapatoBox(this.talla);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = talla;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (talla == zapatoModel.talla)
                ? const Color(0xfff1a23a)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (talla == zapatoModel.talla)
                const BoxShadow(
                    blurRadius: 10,
                    color: Color(0xfff1a23a),
                    offset: Offset(0, 5))
            ]),
        child: Text(
          talla.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (talla == zapatoModel.talla)
                  ? Colors.white
                  : const Color(0xfff1a23a),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
