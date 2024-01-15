
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class TasbhiCounterPage extends StatefulWidget {
  const TasbhiCounterPage({super.key});

  @override
  State<TasbhiCounterPage> createState() => _TasbhiCounterPageState();
}

class _TasbhiCounterPageState extends State<TasbhiCounterPage> {
  int number=0;
  bool lock=false;

  GetStorage   box = GetStorage();

  @override
    void initState() {
    box.writeIfNull('data', 0);
    readData();

    super.initState();
  }

  readData(){
    number=box.read('data');
  }
  storeData(int value){
    box.write('data', value);
    


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Digital Tasbhi'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/display.png'),
                )
              ),
              child: Center(
                child: Text(number.toString(),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              ),

            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      lock=!lock;
                    });
                  } ,
                  child: Icon(lock?Icons.lock: Icons.lock_open,size: 30,),
                ),
                InkWell(
                onTap: (){
                  if(
                  lock==false
                  )

                 setState(() {
                   number++;
                   storeData(number);

                 });

                  },
                    child: Image.asset('images/shape.png',height: 80,width: 80,)),

                InkWell(
                  onTap: (){
                    setState(() {
                      number=0;
                    });
                  } ,
                  child: Icon(Icons.repeat,size: 30,),
                ),

                  ],
            )

          ],
        ),
      ),
    );
  }
}
