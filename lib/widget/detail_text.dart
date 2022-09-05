import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailText extends StatelessWidget {
  String? detail, info;
  DetailText({this.detail, this.info});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: width * 0.3,
            child: Text(
              detail!,
              style: GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 17),
            ),
          ),
          Container(
            child: Text(
              info!,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
