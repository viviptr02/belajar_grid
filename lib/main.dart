import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<String> data =[
    'Baju 1',
    'Baju 2',
    'Bola',
    'Sepatu',
    'Baju 1',
    'Baju 2',
    'Bola',
    'Sepatu',
  ];
  final List<String> imageUrls = [
    'https://tshirtbar.id/wp-content/uploads/2021/08/OVERSIZE-TSHIRT-SALEM-323x500.png',
    'https://www.paeko.id/storage/products/13834d31d4009716baffa2f5d6205a6c.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGKoeecsd2sAIejLVmgzOtXJ4iIbFcT4BqBg&usqp=CAU',
    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSrrCLW7ON-PThopSE6l8PnG314i4apha4AfQnoMd1moPaZ68-fH3qlQZrbAHUu8Y6JowB7H7SA7hT3fyoPpXj6m69pn4YOrVpZFzZjAuX-JZBGXceVfJY&usqp=CAE',
    'https://tshirtbar.id/wp-content/uploads/2021/08/OVERSIZE-TSHIRT-SALEM-323x500.png',
    'https://www.paeko.id/storage/products/13834d31d4009716baffa2f5d6205a6c.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGKoeecsd2sAIejLVmgzOtXJ4iIbFcT4BqBg&usqp=CAU',
    'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSrrCLW7ON-PThopSE6l8PnG314i4apha4AfQnoMd1moPaZ68-fH3qlQZrbAHUu8Y6JowB7H7SA7hT3fyoPpXj6m69pn4YOrVpZFzZjAuX-JZBGXceVfJY&usqp=CAE' 
  ];
  final List<String> harga = [
    'Rp. 65.000',
    'Rp. 78.500',
    'Rp. 35.000',
    'Rp. 30.000',
    'Rp. 50.000',
    'Rp. 56.700',
    'Rp. 99.000',
    'Rp. 84.500',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              ),
              itemCount: data.length,
              itemBuilder: ( (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: data[index],
                          harga: harga[index],
                          imageUrl: imageUrls[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    //menambahkan bayangan
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    imageUrls[index],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Column(
                              children: [
                                Text(data[index],
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                Text(harga[index])
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                );
              }),
          ),
        ),
      ));
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String harga;
  final String imageUrl;

  DetailPage(
    {required this.title, required this.harga, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Column(
        children: [
          Image.network(
            imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text(harga)
          
        ],
      ),
    );
  }
}