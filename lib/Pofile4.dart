import 'package:flutter/material.dart';
import 'Provider.dart';
import 'profile.dart';

class Profile4 extends StatefulWidget {
  @override
  _Profile4State createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  Profile _profile = ProfileProvider.getProfile();
  bool _visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/profiles/landscape_1.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: _bodyCard(context)),
          ),
        )
      ],
    );
  }

  Widget _bodyCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _profileRow(context),
          ..._profileText(context),
          Spacer(
            flex: 1,
          ),
          _divider(context),
          _counters(context),
        ],
      ),
    );
  }

  static Color _textColor = Color(0xff4e4e4e);
  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade600,
  );
  TextStyle _bottomBarsubTitle =
      TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700);
bool ADD = false;
bool Foll = false;
bool x = false;
  Widget _counters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'FOLLWERS',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.followers.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FOLLWING',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.following.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'FRIENDS',
                style: _bottomBarTitle,
              ),
              Text(
                _profile.friends.toString(),
                style: _bottomBarsubTitle,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
    );
  }

  Widget _profileRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage('assets/shard/1.jpg')),
              shape: BoxShape.circle,
            ),
          ),
          Spacer(
            flex: 3,
          ),
          RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width:!ADD? 1:0, color: _textColor),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              color: !ADD?Colors.white:Colors.amber,
              onPressed: () {
                setState(() {
                  ADD = !ADD;
                });
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: !ADD?'ADD ':'FRIEND',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  WidgetSpan(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child:!ADD? Icon(Icons.person_add,size: 15,):Icon(Icons.check_circle,size: 15,),
                  ))
                ]),
              )
              ),
          SizedBox(
            width: 2,
          ),
          RaisedButton(
            padding: EdgeInsets.only(right: 20, left: 20),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            color:!ADD || !Foll ? _textColor:Colors.blue,
            onPressed: () {
              setState(() {
                Foll=!Foll;
              });
            },
            child:RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: !ADD|| !Foll?'FOLLOW ':'FOLLOWING',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child:!ADD|| !Foll?Icon(Icons.favorite_border,size: 15,):Icon(Icons.favorite,size: 15,),
                    ))
              ]),
            )

//            Text(
//              'FOLLOW',
//              style: TextStyle(color:Colors.white),
//            ),
          )
        ],
      ),
    );
  }

  List<Widget> _profileText(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text(_profile.user.name,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 25, color: _textColor)),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16),
        child: Text(_profile.user.job,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.grey.shade400)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(_profile.user.about,
            style: TextStyle(
                letterSpacing: 1.05, fontSize: 15, color: _textColor)),
      ),
    ];
  }
}
