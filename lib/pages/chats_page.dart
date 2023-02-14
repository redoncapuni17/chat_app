//Package

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
//Provider
import '../providers/authentication_provider.dart';
import '../providers/chats_page_provider.dart';
//Widgets
import '../widgets/top_bar.dart';
import '../widgets/custom_list_view_tiles.dart';

class ChatsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatsPageState();
  }
}

class _ChatsPageState extends State<ChatsPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;
  late ChatsPageProvider _pageProvider;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatsPageProvider>(
            create: (_) => ChatsPageProvider(_auth)),
      ],
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(
      builder: (BuildContext _context) {
        _pageProvider = _context.watch<ChatsPageProvider>();
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03,
            vertical: _deviceHeight * 0.02,
          ),
          height: _deviceHeight * 0.98,
          width: _deviceWidth * 0.97,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBar(
                "Chats",
                primaryAction: IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Color.fromRGBO(0, 82, 218, 1.0),
                  ),
                  onPressed: () {
                    _auth.logout();
                  },
                ),
              ),
              _chatTile(),
            ],
          ),
        );
      },
    );
  }

  Widget _chatsList() {
    return Expanded(
      child: _chatTile(),
    );
  }

  Widget _chatTile() {
    return CustomListViewTileWithActivity(
        height: _deviceHeight * 0.10,
        title: "Neymar",
        subtitle: "Hello!",
        imagePath:
            "https://imageio.forbes.com/specials-images/imageserve/627bd53a3a4d3cd7729717cc/0x0.jpg?format=jpg&crop=1069,1070,x707,y83,safe&height=416&width=416&fit=bounds",
        isActive: true,
        isActivity: false,
        onTap: () {});
  }
}
