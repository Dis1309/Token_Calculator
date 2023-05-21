 import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
 import 'dart:convert';
 import 'package:url_launcher/url_launcher.dart';
 import 'premium.dart';
 import 'package:flutter/services.dart';
 import 'dart:io';
 bool premiumword = false;
   class RadialGradientApp extends StatefulWidget {
	
  
  @override
  State<RadialGradientApp> createState() => _RadialGradientAppState();
}

class _RadialGradientAppState extends State<RadialGradientApp> {
      bool isSwitch = false;

    String textValue = "Get response here by switching on the switch";

    void toggleSwitch(value) {
      if(isSwitch == true){
      setState((){
        isSwitch = false;
        textValue = "Get response here by switching on the switch";
      });}
      else {
        setState((){
        isSwitch = true;
        textValue = "Here is the response";
      });}
      }
      
       String model = "1";
       
       List<DropdownMenuItem<String>> get models{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("gpt-3.5-turbo"),value: '1'),
    DropdownMenuItem(child: Text("gpt-3.5-turbo-0301"),value: '2'),
    
  ];
  return menuItems;
}

String currency = 'JPY';
       
       List<DropdownMenuItem<String>> get currencies{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("JPY"),value: 'JPY'),
    DropdownMenuItem(child: Text("USD"),value: 'USD'),
    DropdownMenuItem(child: Text("EUR"),value: 'EUR'),
    DropdownMenuItem(child: Text("GBP"),value: 'GBP'),
    DropdownMenuItem(child: Text("CHF"),value: 'CHF'),
    DropdownMenuItem(child: Text("INR"),value: 'INR'),
    DropdownMenuItem(child: Text("CNY"),value: 'CNY'),
    DropdownMenuItem(child: Text("RUB"),value: 'RUB'),
  ];
  return menuItems;
}
 
 late String url;

  var Data;
  var r = 0;
  String user = 'input';
  String assistant = 'answer';
  String system = 'empty';
  String assistant1 = "input";
  
  int system_total_token = 0;
  int user_total_token = 0;
  int assistant_total_token = 0;
  int total_token = 0;
  double cost = 0.00;
  
      @override 
       void initState(){
        super.initState();
         user = "";
  assistant = "Get Response Here";
  system = "";
  model = '1';
  currency = 'JPY';
  assistant1 = "";
  r = 0;
  system_total_token = 0;
  user_total_token = 0;
  assistant_total_token = 0;
  total_token = 0;
  cost = 0.00;
  
  url = 'https://onenew-token-today11.onrender.com/?model=' +model+"&Query2="+system+"&Query="+user+"&Query1="+assistant1+"&lang="+currency;
       }
 
    @override
	  
    Widget build(BuildContext context) {
	  final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenMid = screenWidth+screenHeight;
    Future Getdata(url) async {
      print(url);
  http.Response Response = await http.get(
    Uri.parse(url),
  headers: {
  "content-type": "application/json" ,
  "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "GET, POST,OPTIONS"
 } );
  var decodeData = await jsonDecode(Response.body);
  //check dt = check.fromJson(decodeData);
  return  decodeData;
}
    
    Widget size(x,y){
      return SizedBox(
        width: screenWidth/x,
        height: screenHeight/y,
      );
    }
    Widget size1(x,y){
      return SizedBox(
        width: screenMid/x,
        height: screenMid/y,
      );
    }
    Widget txt(txt,fs){
      return Text(
                              txt,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255,0.6),
                                fontSize: screenMid/fs,
                                fontWeight: FontWeight.w600,
                             
                              ),
                              
                            );
    }
    Widget txt2(txt,fs){
      return Text(
                              txt,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255,0.6),
                                fontSize: screenMid/fs,
                                fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double
                              ),
                              
                            );
    }
    Widget txt1(txt,fs){
      return Text(
                              txt,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255,1),
                                fontSize: screenMid/fs,
                                fontWeight: FontWeight.w600,

                              ),
                            );
    }
    Widget fld(hnttxt,check) {
      return TextField(
        
        onChanged: (value) {
          setState((){
            check ?user = value.toString() : system = value.toString();
          });
        },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color:Color.fromRGBO(142, 142, 142, 1),

                          icon: Icon(Icons.content_copy),
                          onPressed: () async{
                               Clipboard.setData(ClipboardData(text: check ? user : system)).then(
                                (value) {
                                  return ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                 content: Text('Text Copied'),
                                 ),
                                  );
                                }
                               );
                          }
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                        border: InputBorder.none,
                        hintText: hnttxt,
                        hintStyle: 
                          
                        TextStyle(
                          
                                color: Color.fromRGBO(255, 255, 255,0.6),
                                fontSize: screenMid/70,
                                fontWeight: FontWeight.w600,
                              ),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(
                               
                                color: Color.fromRGBO(255, 255, 255,1),
                                fontSize: screenMid/70,
                                fontWeight: FontWeight.w600,
                              ),
                      maxLines: 6,
                      minLines: 1,
                    );
    }
    Widget fld1(hnttxt) {
      return TextField(
        
        onChanged: (value) {
          setState((){
            assistant1 = value.toString();
          });
        },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color:Color.fromRGBO(142, 142, 142, 1),

                          icon: Icon(Icons.content_copy),
                          onPressed: () async{
                               Clipboard.setData(ClipboardData(text:assistant1)).then(
                                (value) {
                                  return ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                 content: Text('Text Copied'),
                                 ),
                                  );
                                }
                               );
                          }
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                        border: InputBorder.none,
                        hintText: hnttxt,
                        hintStyle: 
                          
                        TextStyle(
                          
                                color: Color.fromRGBO(255, 255, 255,0.6),
                                fontSize: screenMid/70,
                                fontWeight: FontWeight.w600,
                              ),
                      ),
                      cursorColor: Colors.white,
                      style: TextStyle(
                               
                                color: Color.fromRGBO(255, 255, 255,1),
                                fontSize: screenMid/70,
                                fontWeight: FontWeight.w600,
                              ),
                      maxLines: 6,
                      minLines: 1,
                    );
    }
    Widget premium() {
  return Column(
    children: [
      size(20,40),
                    Row(
                      children: [
                        size(20,30),
                        txt("Model",95),
                        size(400,30)
                      ],
                    ),
                    size(20,40),
                    Container(
                      width:screenWidth/1.1,
                      //height: screenHeight/6.3415,
                      child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.1), width: 2),
                 
                                      ),
                                      disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.1), width: 2),
                 
                                      ),
                                      border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.1), width: 2),
                                       
                                      ),
                                      focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0), width: 2),
                                     
                                            ),
                                      filled: true,
                                      fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                                    ),
                                    dropdownColor: Color.fromRGBO(43, 40, 40, 1),
                                    style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255,1),
                                fontSize: screenMid/70,
                                fontWeight: FontWeight.w600,
                              ),
                              icon: Icon(Icons.arrow_circle_down,
                              color: Color.fromRGBO(255, 255, 255,1)),
                                    value: model,
                                    onChanged: (newValue) {
                                      setState(() {
                        model = newValue!.toString();
                                      });
                        },
                        items: models),
                    ),
          
                    size(20,40),
                    Row(
                      children: [
                        size(20,30),
                        txt("Currency",95),
                        size(400,30)
                      ],
                    ),
                    size(20,40),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            width:screenWidth/3,
                            //height: screenHeight/6.3415,
                            child: DropdownButtonFormField(
                                          //dropdownFieldDecoration:InputDecoration(border: InputBorder.none),
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0), width: 2),
                                     
                                            ),
                                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0), width: 2),
                                     
                                            ),
                                            disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0), width: 2),
                                     
                                            ),
                                            border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0), width: 2),
                                             
                                            ),
                                            filled: true,
                                            fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                                          ),
                                          dropdownColor: Color.fromRGBO(43, 40, 40, 1),
                                          style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255,1),
                                      fontSize: screenMid/70,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    icon: Icon(Icons.arrow_circle_down,
                                    color: Color.fromRGBO(255, 255, 255,1)),
                                          value: currency,
                                          onChanged: (newValue) {
                                            setState(() {
                            //currency = newValue!.toString();
                                            });
                              },
                              items: currencies),
                          ),
                          size(20,40),
                        ],
                      ),
                    ),
                    size(20,40),
    ],
  );
}
	  Widget role(){
      return Container(
        width:screenWidth/1.1,
        
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            txt("Role", 60),
                                            txt("System",95),
                                            txt1("${system_total_token}",95),
                                          ],
                                        ),
                                        size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,29),
                                      size(20,95),
                                      txt1("+",95),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                      txt("assistant",95),
                                      txt1("${assistant_total_token}",95),
                                    ],
                                  ),
                                   size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,29),
                                      size(20,95),
                                      txt1("+",95),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                      txt("user",95),
                                       txt1("${user_total_token}",95),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,29),
                                      size(20,95),
                                      txt1("=",95),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                      txt("total",95),
                                      txt1("${total_token}",95),
                                    ],
                                  ),
                                  size(50,35),
                                      ],
                                    ),
                                  );
    }
    Widget role1(){
      return Container(
        width:screenWidth/1.1,
        height:screenHeight/10,
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            txt("Role", 80),
                                            size(30,90),
                                            txt("System",80),
                                            size(30,90),
                                            txt1("${system_total_token}",80),
                                          ],
                                        ),
                                        size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,25),
                                      size(30,90),
                                      size(20,95),
                                      size(30,90),
                                      txt1("+",80),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                       size(30,90),
                                      txt("assistant",80),
                                      size(30,90),
                                      txt1("${assistant_total_token}",80),
                                    ],
                                  ),
                                   size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,29),
                                      size(30,90),
                                      size(20,95),
                                      size(30,90),
                                      txt1("+",80),
                                    ],
                                  ),
                                  size(30,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                      size(30,90),
                                      txt("user",80),
                                      size(30,90),
                                       txt1("${user_total_token}",80),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,29),
                                      size(30,90),
                                      size(20,95),
                                      size(30,90),
                                      txt1("=",80),
                                    ],
                                  ),
                                  size(50,35),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      size(20,35),
                                      size(30,90),
                                      txt("total",80),
                                      size(30,90),
                                      txt1("${total_token}",80),
                                    ],
                                  ),
                                  //size(15,35),
                                      ],
                                    ),
                                  );
    }
      return Scaffold(
	
        body: Center(
	
          child: SafeArea(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
            
                gradient:  LinearGradient(
          colors: [Color(0xff23272a), Color(0xff3d3d3d)],
          stops: [0.5, 0.8],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
              ),
            
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size(20,100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        size1(5000,50),
                        
                        Text(
                                  
                          'ChatGPT Token Calc',
                                  
                          style: TextStyle(
                                  
                            color: Colors.white,
                                  
                            fontSize: screenMid/45,
                                  
                            fontWeight: FontWeight.bold,
                                  
                          ),
                                  
                        ),
                        size1(20,20),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: screenMid/40,
                              height: screenMid/40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 4.0,right: 4.0),
                                child: GestureDetector(
                                  onTap: (){Navigator.pushNamed(context, '/first');},
                                  onDoubleTap: (){
                                    setState((){
                                      premiumword = false;
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth/200,
                                    height: screenHeight/100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('asset/Vector.png'),
                                      fit: BoxFit.fill),
                                    ),
                                        
                                    ),
                                ),
                              ),
                            ),
                          ))
                      ],
                    ),
                    size(20,60),
                    Container(
                      width: screenWidth/1.1,
                      height: screenHeight/6 ,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15) )
                      ),
                      child: Container(
                        
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              premiumword ?
                              
                              
                              Padding(
                                padding: const EdgeInsets.only(left:16.0),
                                child: Column(
                                  children: [
                                    role(),
                                    
                                    Divider(
                                      color: Colors.white,
                                    
                                    ),
                                    Container(
                                      width: screenWidth/1.1,
                                      
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              
                                              txt("Cost",95),
                                              txt1("${cost} ${currency}",95),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ):role1(),
                               
                               
                            ],
                          ),
                        ),
                      ),
                    ),
                    size(20,40),
                    Row(
                      children: [
                        size(20,30),
                       Tooltip(
                        message: 'Input Previous response',
                        decoration: BoxDecoration(
                          color: Colors.white,
                          
                        ),
                        height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
                        child: txt("system:role",95)),
                        size(400,30)
                      ],
                    ),
                    size(20,40),
                    SizedBox(
                      width: screenWidth/1.1,
                      
                      child: fld("Check for previous input",false),
                    ),
                    
                    size(20,40),
                    Row(
                      children: [
                        size(20,30),
                        Tooltip(
                        message: 'Input User response',
                        decoration: BoxDecoration(
                          color: Colors.white,
                          
                        ),
                        height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
                        child: txt("system:user",95),
                        ),
                        size(400,30)
                      ],
                    ),
                    size(20,40),
                    SizedBox(
                      width: screenWidth/1.1,
                      
                      child: fld("User input here",true),
                    ),
                    size(20,40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //size(20,30),
                        Tooltip(
                        message: 'Input assistant response',
                        decoration: BoxDecoration(
                          color: Colors.white,
                          
                        ),
                        height: 50,
      padding: const EdgeInsets.all(8.0),
      preferBelow: false,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Colors.black
      ),
      showDuration: const Duration(seconds: 2),
      waitDuration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.only(left :20.0),
                          child: txt("system:assistant",95),
                        ),
                        ),
                        
                       // size(1.8,30),
                        Switch(
                          value: isSwitch, onChanged: ((value) {
                         toggleSwitch(value); 
                        }),
                        activeColor: Colors.white,  
              activeTrackColor: Color.fromRGBO(14, 131, 117, 1),    
                        ),
                      ],
                    ),
                    size(20,40),
                    isSwitch?SizedBox(width: screenWidth/1.1,child: fld1("Give the response of the of your GPT")):Container(),//
                    premiumword ? premium():Container(),
                    size(20,40),
                    SizedBox(
                      height: screenHeight/20,
                      width:  screenWidth/3,
                      child: ElevatedButton(onPressed: ()async{
                       
                        setState((){
                          
                          url = 'https://onenew-token-today11.onrender.com/?model=' +model+"&Query2="+system+"&Query="+user+"&Query1="+assistant1+"&lang="+currency;
                        });
                        Data = await Getdata(url);
                          setState(() {
                            
                            system_total_token = Data['system_tokens'];
                            user_total_token = Data['user_tokens'];
                            assistant_total_token = Data['assistant_tokens'];
                            total_token = Data['total_tokens'];
                            cost = Data['cost'];
                            
                          });
                          
                      }, child: 
                      Text("Calc",
                      style: TextStyle(
                        fontSize: screenHeight/40,
                      )),
                      style:  ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(14, 131, 117, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),),
                    ),        
                    size(20,40),
                    SizedBox(
                      width: screenWidth/1.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          size(20,40),
                          InkWell(
                            child: txt2("Go to ChatGPT", 75),
                            onTap: () async {await launchUrl(Uri.parse("https://chat.openai.com/"));},
                          )
                        ]
                      ),
                    ),size(20,40),
                      
                     ],
                   
                ),
              ),
            
            ),
          )
	
        ),
        bottomNavigationBar: Container(
                      width: screenWidth,
                      height: screenHeight/10,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        shape: BoxShape.rectangle
      
                      ),
                      child: Center(
                        child: Text("banner ads",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: screenHeight/30,
                          fontWeight: FontWeight.bold,
                        )),
                      )),
	
      );
    }
	
  }
