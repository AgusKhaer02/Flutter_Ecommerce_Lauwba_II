import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

String buildMessage({required List<Map<String, dynamic>> data, String? note}){
  var message = "Permisi saya ingin membeli : \n";

  for (var row in data) {
    message += "--------------------- \n";
    message += "Produk : ${row['product_name']} \n";
    message += "Qty : ${row['quantity']} \n";
  }
  message += "--------------------- \n\n";
  if (note != null && note != "") {
    message += "**note* : $note";
  }

  return message;
}

sendWa({required String message}) async {
  final link = WhatsAppUnilink(
    phoneNumber: "+62895342273759",
    text: message,
  );

  await launchUrl(link.asUri());
}