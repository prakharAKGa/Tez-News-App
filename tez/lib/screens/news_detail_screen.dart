// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tez/screens/detail_view.dart';

class NewsDetails extends StatefulWidget {
  final String newImage,
      newsTitle,
      newsDate,
      author,
      description,
      content,
      source,
      url;

  const NewsDetails({
    Key? key,
    required this.newImage,
    required this.newsTitle,
    required this.newsDate,
    required this.author,
    required this.description,
    required this.content,
    required this.source,
    required this.url,
  }) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final format = DateFormat('MMMM dd,yyyy');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    DateTime dateTime = DateTime.parse(widget.newsDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tez News",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          child: Container(
            height: height * 0.45,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(40)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.newImage,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: height * 0.6,
          margin: EdgeInsets.only(top: height * 0.4),
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Text(
                widget.newsTitle,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.source,
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    format.format(dateTime),
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                widget.description,
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailView(
                                    url: widget.url,
                                  )));
                    },
                    child: Text(
                      "Read More",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 3, 71, 99)),
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}
