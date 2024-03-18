

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulersan/Model/CustomHoverTextWidget.dart';
import 'package:gulersan/contans/app_color.dart';
import 'package:video_player/video_player.dart';

import 'Model/CustomAltTextWidget.dart';
import 'Model/CustomButton.dart';
import 'Model/CustomButtonMobil.dart';
import 'Model/CustomOrtaTextWidget.dart';
import 'Model/CustomTextWidget.dart';
class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late VideoPlayerController _controller;
   late Future<void> _initializeVideoPlayerFuture;
   bool kurumsal_text=false;
   bool hizmet_text=false;
   bool politika_text=false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _controller=VideoPlayerController.asset('assets/videos/anasayfa_video.mp4');
    _initializeVideoPlayerFuture=_controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.play();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  void _scrollToPosition(int index) {
    // ScrollController'ı kullanarak belirli bir pozisyona kaydırma işlemi
    _scrollController.animateTo(
      index * 100.0, // Kaydırılacak pozisyon (örneğin, 100.0 ile çarparak her öğenin yüksekliğini hesaplayabilirsiniz)
      duration: Duration(milliseconds: 500), // Animasyon süresi
      curve: Curves.easeInOut, // Animasyon eğrisi
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // Web için tasarım
              return SingleChildScrollView(
                controller: _scrollController,
                child:Column(
                  children: [
                    Stack(
                      children: [
                        // Video player
                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: SizedBox(
                                    width: _controller.value.size?.width ?? 0,
                                    height:_controller.value.size?.height ?? 0,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                        // Yazılar
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.profilBackground, // Hafif mavi renkli solma efekti
                                  Colors.transparent, // Tamamen saydam renk
                                ],
                                stops: [0.0, 0.9], // Durdurma değerleri
                              ),
                            ),
                            child: Positioned(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: CustomTextWidget(text: "ANASAYFA", fontSize: screenWidth*0.011),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "KURUMSAL", fontSize: screenWidth*0.011,leftwid: screenWidth*0.043,
                                        onHover: (value){
                                          setState(() {
                                            kurumsal_text==false?kurumsal_text=true:kurumsal_text=false;
                                          });
                                        },),
                                        kurumsal_text?Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "GÜLERSAN HAKKINDA", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "TARİHÇE", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "DEĞERLER", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "SÜRDÜREBİLİRLİK", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "MARKALARIMIZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal,onTap: (){
                                              _scrollToPosition(11);
                                            },),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "HİZMETLERİMİZ", fontSize: screenWidth*0.011,leftwid: screenWidth*0.03,onHover: (value){
                                          setState(() {
                                            hizmet_text==false?hizmet_text=true:hizmet_text=false;
                                          });
                                        }),
                                        hizmet_text?Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "SENTETİK ÇUVAL", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "FLEXIBLE AMBALAJ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "BIGBAG", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "UN", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "İTHALAT", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "İHRACAT", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      width: screenWidth * 0.17,
                                      height: screenHeight * 0.17,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "POLİTİKAMIZ", fontSize: screenWidth*0.011,leftwid: screenWidth*0.039,
                                          onHover: (value){
                                            setState(() {
                                              politika_text==false?politika_text=true:politika_text=false;
                                            });
                                          }, ),

                                        politika_text?Column(crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "ÇUVAL GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "FLEXIBLE GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "BIGBAG GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "UN GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "SERTİFİKALARIMIZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "ÖDÜLLERİMİZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),

                                  Flexible(
                                    child: CustomTextWidget(text: "KARİYER", fontSize: screenWidth*0.011),
                                  ),
                                  Flexible(
                                    child: CustomTextWidget(text: "İLETİŞİM", fontSize: screenWidth*0.011),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Padding(
                            padding:  EdgeInsets.only(left: screenWidth*0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomOrtaTextWidget(text: "Gülersan olarak", fontSize: screenWidth*0.02,fontWeight: FontWeight.bold,),
                                CustomOrtaTextWidget(text: "Sektörün lideri konumundayız.", fontSize: screenWidth*0.012,fontWeight: FontWeight.normal,),
                                SizedBox(height: screenWidth*0.012,),
                                CustomButton(
                                  text: 'BİZİ YAKINDAN TANIYIN',
                                  icon: Icons.arrow_right_alt,
                                  buttonColor: AppColors.profilBackground,
                                  onPressed: () {
                                    // Düğmeye tıklandığında gerçekleşecek işlemleri burada tanımlayabilirsiniz
                                    print('Düğmeye tıklandı!');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(children: [
                      Image.asset( 'assets/images/markalarimiz.jpeg',width: screenWidth ,
                        height: screenHeight,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,)
                    ],),
                    Column(children: [
                      Image.asset( 'assets/images/cuval.jpeg',width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,)
                    ],)
                  ],
                ),


              );

            }
   else if (constraints.maxWidth > 700) {
              return SingleChildScrollView(
                controller: _scrollController,
                child:Column(
                  children: [
                    Stack(
                      children: [
                        // Video player
                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: SizedBox(
                                    width: _controller.value.size?.width ?? 0,
                                    height:_controller.value.size?.height ?? 0,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                        // Yazılar
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.profilBackground, // Hafif mavi renkli solma efekti
                                  Colors.transparent, // Tamamen saydam renk
                                ],
                                stops: [0.0, 0.9], // Durdurma değerleri
                              ),
                            ),
                            child: Positioned(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: CustomTextWidget(text: "ANASAYFA", fontSize: screenWidth*0.011),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "KURUMSAL", fontSize: screenWidth*0.011,leftwid: screenWidth*0.043,
                                          onHover: (value){
                                            setState(() {
                                              kurumsal_text==false?kurumsal_text=true:kurumsal_text=false;
                                            });
                                          },),
                                        kurumsal_text?Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "GÜLERSAN HAKKINDA", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "TARİHÇE", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "DEĞERLER", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "SÜRDÜREBİLİRLİK", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "MARKALARIMIZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal,onTap: (){
                                              _scrollToPosition(11);
                                            },),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "HİZMETLERİMİZ", fontSize: screenWidth*0.011,leftwid: screenWidth*0.03,onHover: (value){
                                          setState(() {
                                            hizmet_text==false?hizmet_text=true:hizmet_text=false;
                                          });
                                        }),
                                        hizmet_text?Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "SENTETİK ÇUVAL", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "FLEXIBLE AMBALAJ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "BIGBAG", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "UN", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "İTHALAT", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "İHRACAT", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      width: screenWidth * 0.15,
                                      height: screenHeight * 0.15,
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        CustomHoverTextWidget(text: "POLİTİKAMIZ", fontSize: screenWidth*0.011,leftwid: screenWidth*0.039,
                                          onHover: (value){
                                            setState(() {
                                              politika_text==false?politika_text=true:politika_text=false;
                                            });
                                          }, ),

                                        politika_text?Column(crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: screenWidth*0.011),
                                            CustomAltTextWidget(text: "ÇUVAL GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "FLEXIBLE GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "BIGBAG GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "UN GÜVEN POLİTİKASI", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "SERTİFİKALARIMIZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                            SizedBox(height: 10),
                                            CustomAltTextWidget(text: "ÖDÜLLERİMİZ", fontSize: screenWidth*0.008,fontWeight: FontWeight.normal),
                                          ],
                                        ):Container(),

                                      ],
                                    ),
                                  ),

                                  Flexible(
                                    child: CustomTextWidget(text: "KARİYER", fontSize: screenWidth*0.011),
                                  ),
                                  Flexible(
                                    child: CustomTextWidget(text: "İLETİŞİM", fontSize: screenWidth*0.011),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Padding(
                            padding:  EdgeInsets.only(left: screenWidth*0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomOrtaTextWidget(text: "Gülersan olarak", fontSize: screenWidth*0.02,fontWeight: FontWeight.bold,),
                                CustomOrtaTextWidget(text: "Sektörün lideri konumundayız.", fontSize: screenWidth*0.012,fontWeight: FontWeight.normal,),
                                SizedBox(height: screenWidth*0.012,),
                                CustomButton(
                                  text: 'BİZİ YAKINDAN TANIYIN',
                                  icon: Icons.arrow_right_alt,
                                  buttonColor: AppColors.profilBackground,
                                  onPressed: () {
                                    // Düğmeye tıklandığında gerçekleşecek işlemleri burada tanımlayabilirsiniz
                                    print('Düğmeye tıklandı!');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(children: [
                      Image.asset( 'assets/images/markalarimiz.jpeg',width: screenWidth ,
                        height: screenHeight,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,)
                    ],),
                    Column(children: [
                      Image.asset( 'assets/images/cuval.jpeg',width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,)
                    ],)
                  ],
                ),


              );

            }

            else {
              // Mobil için tasarım
              return   SingleChildScrollView(
                controller: _scrollController,
                child:Column(
                  children: [
                    Stack(
                      children: [
                        // Video player
                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: SizedBox(
                                    width: _controller.value.size?.width ?? 0,
                                    height:_controller.value.size?.height ?? 0,
                                    child: VideoPlayer(_controller),
                                  ),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                        // Yazılar
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.profilBackground, // Hafif mavi renkli solma efekti
                                  Colors.transparent, // Tamamen saydam renk
                                ],
                                stops: [0.0, 0.9], // Durdurma değerleri
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02),
                              child: Positioned(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: CustomTextWidget(text: "ANASAYFA", fontSize: screenWidth*0.015),
                                    ),
                                    Flexible(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          CustomHoverTextWidget(text: "KURUMSAL", fontSize: screenWidth*0.015,leftwid: screenWidth*0.043,
                                            onTap: (){
                                              setState(() {
                                                kurumsal_text==false?kurumsal_text=true:kurumsal_text=false;
                                              });
                                            },),
                                          kurumsal_text?Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: screenWidth*0.015),
                                              CustomAltTextWidget(text: "GÜLERSAN HAKKINDA", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "TARİHÇE", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "DEĞERLER", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "SÜRDÜREBİLİRLİK", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "MARKALARIMIZ", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal,onTap: (){
                                                _scrollToPosition(11);
                                              },),
                                            ],
                                          ):Container(),

                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          CustomHoverTextWidget(text: "HİZMETLERİMİZ", fontSize: screenWidth*0.015,leftwid: screenWidth*0.03,onTap: (){
                                            setState(() {
                                              hizmet_text==false?hizmet_text=true:hizmet_text=false;
                                            });
                                          }),
                                          hizmet_text?Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: screenWidth*0.015),
                                              CustomAltTextWidget(text: "SENTETİK ÇUVAL", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "FLEXIBLE AMBALAJ", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "BIGBAG", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "UN", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "İTHALAT", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "İHRACAT", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                            ],
                                          ):Container(),

                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        width: screenWidth * 0.08,
                                        height: screenHeight * 0.08,
                                        fit: BoxFit.contain,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          CustomHoverTextWidget(text: "POLİTİKAMIZ", fontSize: screenWidth*0.015,leftwid: screenWidth*0.039,
                                            onHover: (value){
                                              setState(() {
                                                politika_text==false?politika_text=true:politika_text=false;
                                              });
                                            }, ),

                                          politika_text?Column(crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: screenWidth*0.015),
                                              CustomAltTextWidget(text: "ÇUVAL GÜVEN POLİTİKASI", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "FLEXIBLE GÜVEN POLİTİKASI", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "BIGBAG GÜVEN POLİTİKASI", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "UN GÜVEN POLİTİKASI", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "SERTİFİKALARIMIZ", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                              SizedBox(height: 10),
                                              CustomAltTextWidget(text: "ÖDÜLLERİMİZ", fontSize: screenWidth*0.010,fontWeight: FontWeight.normal),
                                            ],
                                          ):Container(),

                                        ],
                                      ),
                                    ),

                                    Flexible(
                                      child: CustomTextWidget(text: "KARİYER", fontSize: screenWidth*0.015),
                                    ),
                                    Flexible(
                                      child: CustomTextWidget(text: "İLETİŞİM", fontSize: screenWidth*0.015),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned.fill(
                          child: Padding(
                            padding:  EdgeInsets.only(left: screenWidth*0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomOrtaTextWidget(text: "Gülersan olarak", fontSize: screenWidth*0.015,fontWeight: FontWeight.bold,),
                                CustomOrtaTextWidget(text: "Sektörün lideri konumundayız.", fontSize: screenWidth*0.015,fontWeight: FontWeight.normal,),
                                SizedBox(height: screenWidth*0.011,),
                                CustomButtonMobil(
                                  text: 'BİZİ YAKINDAN TANIYIN',
                                  icon: Icons.arrow_right_alt,
                                  buttonColor: AppColors.profilBackground,
                                  onPressed: () {
                                    // Düğmeye tıklandığında gerçekleşecek işlemleri burada tanımlayabilirsiniz
                                    print('Düğmeye tıklandı!');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(children: [
                      Image.asset( 'assets/images/markalarimiz.jpeg',width: screenWidth ,
                        height: screenHeight,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,),
                      Image.asset( 'assets/images/cuval.jpeg',width: screenWidth,
                        height: screenHeight,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,)
                    ],),


                  ],
                ),


              );
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { setState(() {
      //     if(_controller.value.isPlaying){
      //       _controller.pause();
      //     }
      //     else{
      //       _controller.play();
      //     }
      //   }); },
      //   child: Icon(_controller.value.isPlaying? Icons.pause : Icons.play_arrow),
      // ),
    );
  }
}

