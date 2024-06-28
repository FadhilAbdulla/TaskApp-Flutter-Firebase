import 'package:flutter/material.dart';
import '../Components/GreetingHeadBar.dart';
import '../Components/TaskListView.dart';
import '../Components/CustomSearchBar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final myController = TextEditingController();

  final List<Map> Todayitems = [
    {
      "Category": "Ui Ux Design",
      "Name": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Today 10:00AM",
      "Duration": "5",
      "Status": "Completed"
    },
    {
      "Category": "Mobile Developing",
      "Name": "Ios Mobile Application",
      "Description": "sample Redesign fashion app for up dribble",
      "Date": "Today 5:00AM",
      "Duration": "4",
      "Status": "InProgress"
    },
    {
      "Category": "Web developing",
      "Name": "Web Application deployment",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Today 9:00AM",
      "Duration": "4.5",
      "Status": "ToDo"
    },
  ];
  final List<Map> Pastitems = [
    {
      "Category": "Ui Ux Design",
      "Name": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Apr 20-2024 , 10:00 am",
      "Points": "5",
      "Duration": "5",
      "Status": "Completed"
    },
    {
      "Category": "Mobile Developing",
      "Name": "Ios Mobile Application",
      "Description": "sample Redesign fashion app for up dribble",
      "Date": "Apr 20-2024 , 10:00 am",
      "Duration": "4",
      "Points": "5",
      "Status": "InProgress"
    },
    {
      "Category": "Web developing",
      "Name": "Web Application deployment",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Apr 20-2024 , 10:00 am",
      "Duration": "4.5",
      "Points": "5",
      "Status": "ToDo"
    },
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: GreetingHeadBar(
              UserName: "fadhil", Active: true, NotificationActive: true),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(_tabController?.index == 1
                ? 100.0
                : 50), // Adjust the preferred height

            child: Column(
              children: [
                if (_tabController?.index == 1) CustomSearchBar(),
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(
                            255, 0, 0, 0), // color of the underline
                        width: 2.0, // thickness of the underline
                      ),
                    ),
                  ),
                  // dividerColor: Colors.amberAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black, // Color of the underline
                  labelColor: Colors.black, // Color of the selected tab text
                  unselectedLabelColor:
                      Colors.grey, // Color of the unselected tab text
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        8,
                        0,
                        8,
                      ), // Adjust bottom padding for gap
                      child: Text(
                        "Today",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        8,
                        0,
                        8,
                      ), // Adjust bottom padding for gap
                      child: Text(
                        "History",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: TaskListView(
                TaskList: [Todayitems[0], Todayitems[1], Todayitems[2]],
                IsToday: true,
              ),
            ),
            Center(
              child: TaskListView(
                TaskList: [Pastitems[0], Pastitems[1]],
                IsToday: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
