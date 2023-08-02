// import 'package:untitled12/Providerrrr.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/foundation.dart';
// void main(){
//   runApp(
//     MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_)=>ProductProvider()),
//         ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Example'),
//       ),
//       body: MyHome(),
//     );
//   }
// }
//
// class MyHome extends StatefulWidget {
//   const MyHome({super.key});
//
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     ProductProvider _myProvider=Provider.of(context,listen: false);
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height-56,
//             child: ListView.builder(
//                 itemBuilder: (BuildContext context,int index){
//                   var s=_myProvider.products[index];
//                   return Container(
//                     height: 300,
//                     child: Column(
//                       children: [
//                         Text(
//                           s.title,
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 22),
//                         ),
//                         Text("Description : ${s.description}"),
//                         Text("Price : ${s.price.toString()}"),
//                         Text("Brand : ${s.brand}"),
//                         Text("Category : ${s.category}"),
//                         Text("Stock Available: ${s.stock.toString()}"),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.network(s.thumbnail),
//                         ),
//                         Text("${s.title}"),
//                         // Image.network(
//                         //   '${s.images[index]}',
//                         //   height: 100,
//                         //   width: 100,
//                         //   fit: BoxFit.cover,
//                         // )
//                       ],
//                     ),
//                   );
//                 }
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled12/Providerrrr.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: ListData(),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider _myProvider = Provider.of(context, listen: false);
    _myProvider.fetchdata();

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: _myProvider.products.length,
            itemBuilder: (BuildContext context, int index) {
              var s = _myProvider.products[index];
              return Container(
                height:500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    // Text("${s.id.toString()}"),
                    Text("Description : ${s.description}"),
                    Text("Price : ${s.price.toString()}"),
                    Text("Brand : ${s.brand}"),
                    Text("Category : ${s.category}"),
                    Text("Stock Available: ${s.stock.toString()}"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(s.thumbnail,height: 200,width: 200,),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: s.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,int i){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(s.images[i]),
                            );
                          }),
                    ),
                    // Text("${s.id}"),
                    // Text("${s.title}"),
                    // Image.network(
                    //   '${s.thumbnail}',
                    //   height: 100,
                    //   width: 100,
                    //   fit: BoxFit.cover,
                    // )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
