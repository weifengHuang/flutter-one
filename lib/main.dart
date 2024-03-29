import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(Center(child: MyApp()));


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo'),
    );
  }
}

class MyHomeTop extends StatelessWidget {
  void _onSearchInputOnChang(String value) {
    print(value);
  }
  @override
  Widget build(BuildContext context) {
    return
      new Row(
        children: <Widget>[
        Expanded(
          flex: 2, // 20%
          child: new Container(
            child: new IconButton(
              icon: Icon(Icons.edit),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                print(12);
              },
            ),
          ),
        ),
        Expanded(
          flex: 6, // 60%
          child: Container(
              height: 35,
              child: TextField(
                onChanged: _onSearchInputOnChang,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 4.0),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
              )),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
            child: IconButton(
              icon: Icon(Icons.person_pin),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                print(12);
              },
            ),
          ),
        )
      ]);
  }
}

class MyHomeSwipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Swiper(
	        itemBuilder: (BuildContext context,int index){
		        return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
	        },
	        itemCount: 3,
	        pagination: new SwiperPagination(),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 100;
  int _tabIndex = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _counter + 5;
    });
  }

  void _onTap(int index) {
    print(index);
    setState(() {
      _tabIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            Container(
              color: Color(0xFFFF6F00),
              child: MyHomeTop()
            ),
            Container(
	              height: 200,
		            child: MyHomeSwipper()
            ),
            Text(
              'You have pushed the button this many ssstimes:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text('$_tabIndex')
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        onTap: _onTap,
        currentIndex: _tabIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
