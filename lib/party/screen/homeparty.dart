import 'package:flutter/Cupertino.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'partyscreen.dart';



//Note:   do not remove any commented code 

class Homepageforparty extends StatefulWidget {
  const Homepageforparty({super.key});

  @override
  State<Homepageforparty> createState() => _HomepageforpartyState();
}

class _HomepageforpartyState extends State<Homepageforparty> {
  bool ispartyscreen=false;
  final _formkry=GlobalKey<FormState>();
  TextEditingController textconroller=TextEditingController();
  final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 300),
            InkWell(
              child: SizedBox(
                width: 50,
                height: 50,
                child: const Text("party"),
              ),
              onTap: () {
                setState(() {
                  ispartyscreen = !ispartyscreen;

                });
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              if (ispartyscreen)
                Positioned(
                  right: 50,
                  left: 50,
                  top: 50,
                  bottom: 50,
                  child: Container(
                    width: 500,
                    height: 500,
                    color: Colors.white,
                    child:Partyscreen(
                     // scrollController: _scrollController,
                      isParty: ispartyscreen,)
                  ),
                )
            ]),
          )

        ],
      ),
    );
  }

  // void scrollToContainer(int index)
  // {
  //   _scrollController.animateTo
  //     (
  //     index * 750,
  //     duration: const Duration(seconds: 1),
  //     curve: Curves.easeInOut,
  //   );
  // }


}
