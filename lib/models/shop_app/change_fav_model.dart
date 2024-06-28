class ChangeFavModel
{
 late bool status;
 late String message;

 ChangeFavModel.FromJson(Map<String,dynamic> json)
 {
   status = json['status'];
   message = json['message'];
 }
}