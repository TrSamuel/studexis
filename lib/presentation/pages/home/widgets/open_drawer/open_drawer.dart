import 'package:flutter/material.dart';
import 'package:studdataapp/core/constants/imgcost.dart';
import 'package:studdataapp/presentation/pages/home/widgets/open_drawer/widgets/delete_account_button.dart';
import 'package:studdataapp/presentation/pages/home/widgets/open_drawer/widgets/sign_out_button.dart';

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          DrawerHeader(child: logo),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignOutButton(),
              DeleteAccountButton(),
            ],
          )
        ],
      ),
    );
  }
}
