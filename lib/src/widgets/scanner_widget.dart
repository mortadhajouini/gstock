import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gstock/src/models/reservationModel.dart';
import 'package:gstock/src/services/reservationServices.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerWidget extends StatefulWidget {
 final reservation resrv ;
  const QrCodeScannerWidget({super.key , required this.resrv});

  @override
  State<QrCodeScannerWidget> createState() => _QrCodeScannerWidgetState();
}

class _QrCodeScannerWidgetState extends State<QrCodeScannerWidget> {
   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
   @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      child: Container(
        width: Get.width*0.8,
        height: Get.height*0.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            Container(
              width: Get.width*0.6,
              height: Get.height*.3,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , border: Border.all(color: Colors.green)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Expanded(
                  flex: 1,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(result?.code ==null ? "Pas de Qr code" : result!.code! == widget.resrv.id! ? "Votre Qr Code est Valide !\nVous pouvez Accepter !" : "Votre Qr Code n'est pas valide",textAlign: TextAlign.center,  ),
            SizedBox(height: 20.h,),
            GestureDetector(
                      onTap: (){
                        if(result?.code != null){
                          if(result!.code == widget.resrv.id){
                              ReservationServer.updateReservation(reservation(id: widget.resrv.id! ,idComposant: widget.resrv.idComposant, dateEmprunt:  widget.resrv.dateEmprunt, idUser:  widget.resrv.idUser, status: 1));
                               Get.back();
                          }else{
                            Get.snackbar("Erreur d'invalidité", "Ce Qr code n'est pas valide pour cette reservation", backgroundColor: Colors.red);
                          }
                          
                        }else{
                          Get.snackbar('Erreur', "Entrer un QR Code" , backgroundColor: Colors.red);
                        }
                      
                      },
                       child: Container(width: 200.w, height: 50.h, decoration: BoxDecoration( border: Border.all( color: Colors.greenAccent)  , borderRadius: BorderRadius.circular(100)) , child: Row(mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                        const  Icon(Icons.done , color: Colors.green, ),
                         SizedBox(width: 10.w,),
                           Text("Accepter" , style:  Theme.of(context).textTheme.bodyLarge,),
                         ],
                       ),),
                     ),
          ],
        ),
      ),
    );
  }
   void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}