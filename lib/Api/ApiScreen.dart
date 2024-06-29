import 'package:flutter/material.dart';
import 'package:youtubeapi/Api/Service/ApiService.dart';
import 'Model/ItemModel.dart';

class Apiscreen extends StatefulWidget {
  const Apiscreen({super.key});

  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
  late Future<ItemList> futurePosts;
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchPosts();
  }

  void _showItem(){
    setState(() {
      currentIndex++;
    });
  }

  void _showImage(Datum datum,String newUrl){
    setState(() {
      datum.snippet.thumbnails.maxres.url=newUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YouTube",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
      ),
      body: FutureBuilder<ItemList>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            ItemList itemList = snapshot.data!;
                Datum datum = itemList.data.data[currentIndex % itemList.data.data.length];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID :${datum.id}',style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Text('Channel Id :${datum.snippet.channelId}',style: TextStyle(fontSize: 16)),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                if(datum.snippet.thumbnails.maxres.url != null)


                                  Center(
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        child: Image.network(
                                            datum.snippet.thumbnails.maxres.url),
                                      )
                                )
                              ],
                            ),
                            SizedBox(width: 50),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    _showImage(datum, datum.snippet.thumbnails
                                        .thumbnailsDefault.url);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    child: Image.network(datum.snippet.thumbnails
                                        .thumbnailsDefault.url),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: (){
                                    _showImage(datum,datum.snippet.thumbnails.medium.url);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    child: Image.network(
                                        datum.snippet.thumbnails.medium.url),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: (){
                                    _showImage(datum,datum.snippet.thumbnails.high.url );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    child: Image.network(
                                        datum.snippet.thumbnails.high.url),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: (){
                                    _showImage(datum, datum.snippet.thumbnails.standard.url);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                   child: Image.network(
                                        datum.snippet.thumbnails.standard.url),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        ElevatedButton(
                            onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.red[900],
                                    
                          ),
                                    
                            child: Text(
                              "Snippet",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),),
                        SizedBox(height: 10),
                         Text('${datum.snippet.description}',style: TextStyle(fontSize: 16)),
                        SizedBox(height: 10),
                        Divider(),
                        ElevatedButton(
                          onPressed: () {},
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                             backgroundColor: Colors.red[900],
                           ),
                                    
                          child: Text(
                            "Localized",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),),
                        SizedBox(height: 10),
                        Text('${datum.snippet.localized.description}'),
                        SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _showItem();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.red[900]
                            ),
                                    
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),),
                        ),
                                    
                                    
                      ],
                    ),
                  ),
                );

          } else {
            return Center(child: Text("No data found."));
          }
        },
      ),
    );
  }
}
