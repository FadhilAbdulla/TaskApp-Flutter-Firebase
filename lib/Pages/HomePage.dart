import 'package:flutter/material.dart';
import '../Components/GreetingHeadBar.dart';
import '../Components/TaskListView.dart';
import '../Components/CustomSearchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const GreetingHeadBar(UserName: "fadhil"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // Adjust the preferred height

            child: const TabBar(
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        Color.fromARGB(255, 0, 0, 0), // color of the underline
                    width: 2.0, // thickness of the underline
                  ),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.black, // Color of the underline
              labelColor: Colors.black, // Color of the selected tab text
              unselectedLabelColor:
                  Colors.grey, // Color of the unselected tab text
              labelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0), // Adjust bottom padding for gap
                  child: Text("Today"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0), // Adjust bottom padding for gap
                  child: Text("History"),
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: TaskListView(),
            ),
            Center(
              child: Text("It's rainy here"),
            )
          ],
        ),
      ),
    );
  }
}
