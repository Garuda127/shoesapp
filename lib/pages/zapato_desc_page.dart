import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/helpers/helpers.dart';
import 'package:shoesapp/models/zapato_model.dart';
import 'package:shoesapp/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            const Hero(
                tag: 'Zapato-1', child: ZapatoSizePreview(fullscreen: true)),
            Positioned(
                top: 80,
                child: FloatingActionButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ))
          ],
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ZapatoDescript(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _MontoBuyNow(),
                _ColoresAndMore(),
                _BotonesLikeCartSettings()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(Icon(
            Icons.favorite,
            color: Colors.red,
            size: 25,
          )),
          _BotonSombreado(Icon(
            Icons.shopping_cart,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
          _BotonSombreado(Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10)),
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresAndMore extends StatelessWidget {
  const _ColoresAndMore();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90,
                  child: _BotonColor(
                      Color(0xffc6d642), 1, 'assets/imgs/verde.png')),
              Positioned(
                  left: 60,
                  child: _BotonColor(
                      Color(0xffffad29), 2, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30,
                  child: _BotonColor(
                      Color(0xff2099f1), 3, 'assets/imgs/azul.png')),
              _BotonColor(Color(0xff364d56), 4, 'assets/imgs/negro.png'),
            ],
          )),
          BotonNaraja(
            texto: 'More Items',
            height: 30,
            width: 170,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String url;
  const _BotonColor(this.color, this.index, this.url);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = url;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$Monto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaraja(
                texto: 'Comprar',
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
