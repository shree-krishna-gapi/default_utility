import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/nav.dart';
class AppColor {
  static const Color secondaryPrimary = Color(0xFFFF8F3F);
  static const Color newColor = Color(0xFFFF8F3F);
  static const Color lightnewColor = Color(0xFFFFC797);
  static const Color splashColor = Color(0xFFFFC797);
  static const Color warningColor = Color(0xFFFF8F3F);
  static const Color newLightColor = Color(0xFFFFE3CF);
  static const Color colorPrimary = Color(0xFF984408);// Color(0xFFDD2C66);
  static const Color colorPrimaryDark = Color(0xFFDD7C3D);// Color(0xFFDD2C66);
  static const Color lightPrimary = Color(0xFFdfdfdf);
  static const Color inputFocusColor = Color(0xFF3BFEBB);
  static const Color verylightPrimary = Color(0xFFcdcdcd);
  static const Color splashColorPrimary = Color(0xFF343434);
  static const Color blackBg = Color(0xFF343434);
  static const Color onLineColor = Color(0xFF00C853);
  static const Color offLineColor = Color(0xFFDD2C00);
  static const Color greenGrey = Color(0xFFdfdfdf);
  static const Color noticeColor = Color(0xFF1F5DEC);
}
class DefaultBtn extends StatelessWidget {
  const DefaultBtn({super.key,required this.title,required this.onTap,this.isBusy = false,this.btnHeight = 40.0, this.color = AppColor.colorPrimary,
    this.icon,this.borderColor = AppColor.newColor,this.backgroundColor = Colors.transparent,
  this.borderWidth=0});
  final String title;
  final Function onTap;
  final bool isBusy;
  final double btnHeight;
  final Color color;
  final Color borderColor;
  final Color backgroundColor;
  final IconData? icon;
  final double borderWidth;
  @override
  Widget build(BuildContext context) {
    final decoration_ = borderWidth == 0 ? BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.colorPrimary
    ) :
    BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: backgroundColor,
      border: Border.all(
        color: borderColor, // 👉 change to your desired color
        width: borderWidth, // 👉 border width
      ),
      boxShadow: [
        BoxShadow(
          color: borderColor, // 👉 shadow color
          blurRadius: 6, // 👉 softening of the shadow
          offset: Offset(2, 2), // 👉 horizontal & vertical offset
        ),
      ],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: ()=> isBusy ? null : onTap(),
        child: Container(
          height: btnHeight,
          decoration: decoration_,
          child: Center(child: isBusy ? SizedBox(
            height: btnHeight,width: btnHeight,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0),
            ),
          ) :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: icon == null ?  Text(title,style: TextStyle(fontSize: 15,color: borderWidth == 0 ? Colors.white : borderColor,fontWeight: FontWeight.w600,letterSpacing: 0.06)) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: borderWidth == 0 ? Colors.white : borderColor,size: 28,),
                SizedBox(width: 10,),
                Text(title,style: TextStyle(fontSize: 15,color: borderWidth == 0 ? Colors.white : borderColor,fontWeight: FontWeight.w600,letterSpacing: 0.06))
              ],
            ),
          )),
        ),
      ),
    );
  }
}




class DefaultBtnGeneric extends StatelessWidget {
  const DefaultBtnGeneric({super.key,required this.title,required this.onTap,this.isBusy = false,this.btnHeight = 40.0,
  });
  final String title;
  final Function onTap;
  final bool isBusy;
  final double btnHeight;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: ()=> isBusy ? null : onTap(),
        child: Container(
          height: btnHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColor.colorPrimary
          ),
          child: Center(child: isBusy ? SizedBox(
            height: btnHeight,width: btnHeight,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0),
            ),
          ) :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title,style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.06)),
          )),
        ),
      ),
    );
  }
}

class DefaultBtnWithLongPress extends StatelessWidget {
  const DefaultBtnWithLongPress({super.key,required this.title,required this.onTap,this.isBusy = false,this.btnHeight = 40.0,required this.onLongPress,this.color = AppColor.colorPrimary});
  final String title;
  final Function onTap;
  final bool isBusy;
  final double btnHeight;
  final Function onLongPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: ()=> isBusy ? null : onTap(),
        onLongPress:()=>onLongPress(),
        child: Container(
          height: btnHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color
          ),
          child: Center(child: isBusy ? SizedBox(
            height: btnHeight,width: btnHeight,
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0),
            ),
          ) :Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title,style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 0.06)),
          )),
        ),
      ),
    );
  }
}
class InnerButton extends StatelessWidget {
  const InnerButton({super.key,required this.title,required this.onTap,this.isActiveBtn = false});
  final String title;
  final Function onTap;
  final bool isActiveBtn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(8),

             color: isActiveBtn ? AppColor.noticeColor : AppColor.newColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(title,
            style: TextStyle(
                color:
                Colors.white),
          )),
    );
  }
}

var aa = Icon(Icons.arrow_back);

class BtnBorderBtn extends StatelessWidget {
  final String title;
  final Function onTap;
  const BtnBorderBtn({super.key, required this.title,required this.onTap,this.height = 38.0,this.radius = 4.0,this.color = AppColor.colorPrimary,
    this.withIcon = false,this.icon = Icons.arrow_back,this.iconSize = 24.0,this.fontSize = 15.0, });
  final double height;
  final double iconSize;
  final double fontSize;
  final double radius;
  final Color color;
  final bool withIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: color,
        child: InkWell(
          onTap: (){onTap();},
          splashColor: AppColor.splashColorPrimary,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Container(width: double.infinity,
                height: height-2.0,
                color: Colors.white,child: withIcon ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon,color: color,size: iconSize,),SizedBox(width: 5,),
                  Text(title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.06,color: color),)
                  ],
                ) : Align(alignment: Alignment.center ,child: Text(title,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600,letterSpacing: 0.06,
                    color: color),)),),
            ),
          ),
        ),
      ),
    );
  }
}
Future confirmationDialog(BuildContext context,Function onTap,{String confirmationTitle = 'Confirmation!!',
String confirmationTitleSubTitle = "Are You sure",String confirmText = 'Confirm',String cancelText = 'Cancel'}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(confirmationTitle),
          content: Text(confirmationTitleSubTitle),
          actions: <Widget>[
            GestureDetector(
              child:  dialogButtonYes(title: confirmText),
              onTap: ()=>onTap(),
            ),
            GestureDetector(
              child:  dialogButtonNo(title: cancelText),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ); });
}
cancelConfirmationDialog0(BuildContext context,Function onTap,{String confirmationTitle = 'Confirmation!!',
  String confirmationTitleSubTitle = "Are You sure",String confirmText = 'Confirm',String cancelText = 'Cancel'}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(confirmationTitle),
          // content: Text(confirmationTitleSubTitle),
          content: Column(
            children: [
              Text(confirmationTitleSubTitle),
              SizedBox(height: 5,),
              Text('late vao'),
              Text('late vao'),
              Text('late vao'),
            ],
          ),

          actions: <Widget>[
            GestureDetector(
              child:  dialogButtonYes(title: confirmText),
              onTap: ()=>onTap(),
            ),
            GestureDetector(
              child:  dialogButtonNo(title: cancelText),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ); });
}
class GroupModel {
  String text;
  int index;

  GroupModel({required this.text, required this.index});
}


Widget deleteDialog(BuildContext context,onTap,{confirmationTitle = "Confirmation!!",confirmationTitleSubTitle = "Are you sure to delete ?",showConfirmation = false}) {
  return GestureDetector(
      onTap: () {
        if(showConfirmation) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(confirmationTitle),
                  content: Text(confirmationTitleSubTitle),
                  actions: <Widget>[
                    GestureDetector(
                      child:  dialogButtonYes(title: 'Delete'),
                      onTap: ()=>onTap(),
                    ),
                    GestureDetector(
                      child:  dialogButtonNo(title: 'Cancel'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ); });
        } else {
          onTap();
        }
      }
      ,child: const Icon( Icons.delete_forever,color: AppColor.colorPrimary,size: 22,) );
}
Widget confirmDialog(BuildContext context,onTap,{confirmationTitle = "",confirmationTitleSubTitle = "",showConfirmation = false,isActive = true}) {
  return GestureDetector(
      onTap: () {
        if(showConfirmation) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(isActive ? "Staff Temporary Block!!" : "Staff Block Remove!!"),
                  content: RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: isActive ? 'Are you sure to disable ' : 'Are you sure to enable permission ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,letterSpacing: 0.2,color: Colors.black87)),
                          TextSpan(text:confirmationTitleSubTitle,style: TextStyle(
                              fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 0.2,color: Colors.black87
                          )),
                        ]),
                  ),
                  actions: <Widget>[
                    GestureDetector(
                      child:  dialogButtonYes(title:isActive?'Disable': 'Enable'),
                      onTap: ()=>onTap(),
                    ),
                    GestureDetector(
                      child:  dialogButtonNo(title:"Cancel"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ); });
        } else {
          onTap();
        }
      }
      ,child: Icon( isActive ? Icons.verified_user : Icons.verified_user_outlined,color: isActive ? Colors.green : Colors.black38,) );
}
Widget updateDialog(BuildContext context,onTap,{confirmationTitle = "Confirmation!!",
  confirmationTitleSubTitle = "Are you sure to update ?",showConfirmation = false}) {
  return GestureDetector(
      onTap: () {
        if(showConfirmation) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(confirmationTitle),
                  content: Text(confirmationTitleSubTitle),
                  actions: <Widget>[
                    GestureDetector(
                      child:  dialogButtonYes(title:'Update'),
                      onTap: ()=>onTap(),
                    ),
                    GestureDetector(
                      child:  dialogButtonNo(title:"Cancel"),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ); });
        } else {
          onTap();
        }
      }
      ,child: const Icon( Icons.edit_note,color: AppColor.colorPrimary,) );
}
Widget buildIconTextButton(String title, IconData icon, VoidCallback onTap) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      onTap: onTap,
      splashColor: AppColor.colorPrimary.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColor.colorPrimary),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );
}
Widget buildIconText(String title, IconData icon, VoidCallback onTap,
    {Color color = Colors.grey}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

Widget dialogButtonYes({title = 'yes'}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(6)
    ),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Text(title,style: TextStyle(color: AppColor.newColor.withValues(alpha: 0.9),
            fontSize: 15,letterSpacing: 0.4,fontWeight: FontWeight.w600),)),
  );
}
Widget dialogButtonNo({title = 'No'}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text(" $title  ",style: TextStyle(color: Colors.black38,fontSize: 15),),
  );
}
Widget dialogTitle(String title) {
  return Text(title,style: TextStyle(color: Colors.black38,fontSize: 15),);
}



Align closeBackButton(BuildContext context,{hasBackground = false}) {
  return Align(alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(right: 15,top: 35),
      child: GestureDetector(
        onTap: () {
          pageBack();
        },
        child: Container(
          height: 36,width: 36,
          decoration: BoxDecoration(
              color: hasBackground ? Colors.black26 : Colors.transparent,
              shape: BoxShape.circle
          ),
          child: const Icon(Icons.close),
        ),
      ),
    ),
  );
}
void pageBack({bool isDelay = false,int delayValue = 200})async {
  BuildContext context = NavigationService.defaultKey.currentState!.overlay!.context;
  if(isDelay) {
    Timer(Duration(milliseconds: delayValue), () {
      Navigator.of(context).pop();
    });
  } else {
    Navigator.of(context).pop();
  }
}