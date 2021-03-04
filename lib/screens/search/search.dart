import 'package:simple_app_with_github_api/screens/home/home.dart';
import 'package:simple_app_with_github_api/services/github.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String username;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E0E1E),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/42553582?s=460&u=3dc0f69bfc4548c36e004af7e667ded382775f82&v=4',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Get Github Repos",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    hintText: 'Github Username',
                    helperText: '',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(Icons.account_circle_sharp),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() => username = value);
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      fetchInformation(username);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(user: username),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Search",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF414AE5), // background
                    onPrimary: Colors.white, // foreground
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Developed By Cookieizi",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
