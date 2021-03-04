import 'package:simple_app_with_github_api/services/github.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String user;
  Home({this.user});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future futureInfo;
  @override
  void initState() {
    super.initState();
    futureInfo = fetchInformation(widget.user);
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0E0E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "${widget.user} Projects",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: size.height * 0.9,
                    width: size.width,
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: futureInfo,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: jsonDe.length,
                                  itemBuilder: (context, i) {
                                    String repoName = name[i];
                                    String lang = language[i];
                                    String uu = htmlUrl[i];
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      width: size.width,
                                      height: 90,
                                      child: InkWell(
                                        child: Card(
                                          elevation: 3,
                                          color: Colors.black.withOpacity(0.6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, bottom: 8),
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.network(
                                                        avatarUrl,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      repoName,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Chip(
                                                      backgroundColor:
                                                          Color(0xff414EA5),
                                                      shadowColor: Colors.black,
                                                      label: Text(
                                                        lang,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white,
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          launchURL(uu);
                                        },
                                        borderRadius: BorderRadius.circular(15),
                                        splashColor: Colors.transparent,
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            if (noP == true) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 250.0),
                                child: Text(
                                  "isn't have projects",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              );
                            }
                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : print('object');
  }
}
