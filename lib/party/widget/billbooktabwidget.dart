import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';



//Tempory commented scrollcontroller , do not remove any commebted code 


class Billbooltab extends StatefulWidget {
 // ScrollController scrollController=ScrollController();
   Billbooltab({super.key,
  // required this.scrollController
   });

  @override
  State<Billbooltab> createState() => _BillbooltabState();
}

class _BillbooltabState extends State<Billbooltab> {

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [

            InkWell(
                child: Container(decoration: BoxDecoration(color: const Color(0xff0E1D3E),border: Border.all()),
                  child: const Text("contact details",style: TextStyle(color: Colors.white),),
                ),
              //  onTap: () => scrollToContainer(0)
            ),
            const SizedBox( width: 30,),
            InkWell(
              child: Container(
                color: const Color(0xff0E1D3E),
                child: const Text("Registration details",style: TextStyle(color: Colors.white)),
              ),
             // onTap: () =>scrollToContainer(1),
            ),
            const SizedBox( width: 30,),
            InkWell(
                child: Container(
                  child: const Text("Address",style: TextStyle(color: Colors.white)),
                ),
               // onTap: () =>scrollToContainer(2)
            ),
            const SizedBox( width: 30,),
            InkWell(
                child: Container(
                  child: const Text("bank details",style: TextStyle(color: Colors.white)),
                ),
               // onTap: () =>scrollToContainer(3)
            ),
            const SizedBox(width: 30,),
            InkWell(
                child: Container(
                  child: const Text("Opening",style: TextStyle(color: Colors.white)),
                ),
               // onTap: () =>scrollToContainer(4)
            )
          ],
        ),
      ),
    );
  }

  // void scrollToContainer(int index)
  // {
  //   widget.scrollController.animateTo
  //     (
  //     index * 750,
  //     duration: const Duration(seconds: 1),
  //     curve: Curves.easeInOut,
  //   );
  // }

}
