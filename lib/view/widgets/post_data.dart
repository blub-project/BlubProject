import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Precious Oladele',
            style: GoogleFonts.poppins(),
          ),
          Text(
            'oladelep77@gmail.com',
            style: GoogleFonts.poppins(
              fontSize: 10,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lorem nibh, faucibus id felis et, sodales faucibus dolor. Morbi tincidunt eget nisl id venenatis. In a sapien eu diam tempus pulvinar euismod id augue. Nam lectus dolor, lacinia quis viverra at, tempor quis magna. Curabitur feugiat mauris lectus, vitae tincidunt ligula fermentum iaculis. Nulla a rutrum eros, vitae tincidunt ligula. Nam eget enim non purus pharetra lobortis ut ut ipsum. Fusce id posuere sapien. Nunc vehicula lectus ut justo tincidunt, ac dictum ex posuere. Donec semper molestie orci, eu aliquet eros bibendum ac. Proin sed nisl augue. Fusce viverra euismod dictum.',
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
              )
            ],
          )
        ],
      ),
    );
  }
}
