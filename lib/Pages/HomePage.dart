import 'package:flutter/material.dart';
import '../Components/GreetingHeadBar.dart';
import '../Components/TaskListView.dart';
import '../Components/CustomSearchBar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Functions/ApiFunctions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final myController = TextEditingController();

  List<Map> TodayItems = [];
  List<Map> PastItems = [];
  bool isLoading = true;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    fetchTasks();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
  }

  void fetchTasks() async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> fetchedTasks = await getAllTasks();
    if (fetchedTasks["status"] == "200") {
      setState(() {
        TodayItems = fetchedTasks["todayTasks"];
        PastItems = fetchedTasks["pastTasks"];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something Went Wrong')),
      );
    }
    setState(() {
      isLoading = false;
    });
  }
  // Future<void> fetchTasks() async {
  //   print("sample");
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map<String, dynamic>? storedTasks;

  //   // Try to fetch stored tasks from SharedPreferences
  //   String? storedTasksJson = await prefs.getString('storedTasks');
  //   if (storedTasksJson != null &&
  //       storedTasksJson.isNotEmpty &&
  //       storedTasksJson != "") {
  //     storedTasks = jsonDecode(storedTasksJson);
  //     print(storedTasksJson);
  //     print("something");
  //     setState(() {
  //       TodayItems = storedTasks!["todayTasks"];
  //       PastItems = storedTasks!["pastTasks"];
  //     });
  //   } else {
  //     print("sample");
  //   }

  //   // Fetch new tasks from Firestore
  //   Map<String, dynamic> fetchedTasks = await getAllTasks();

  //   if (fetchedTasks["status"] == "200") {
  //     print("Fetch success");
  //     // Store fetched tasks in SharedPreferences
  //     prefs.setString('storedTasks', jsonEncode(fetchedTasks));

  //     // Show SnackBar for fetch success
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Fetch Success')),
  //     );

  //     // Update state with fetched tasks
  //     setState(() {
  //       TodayItems = fetchedTasks["todayTasks"];
  //       PastItems = fetchedTasks["pastTasks"];
  //     });
  //   } else {
  //     print("Some issues occurred");
  //     // Show SnackBar for issues
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Something Went Wrong')),
  //     );
  //   }
  // }

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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(255, 126, 126, 126),
                color: Color.fromARGB(194, 227, 227, 227),
              ))
            : TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Center(
                    child: TaskListView(
                      TaskList: TodayItems,
                      IsToday: true,
                    ),
                  ),
                  Center(
                    child: TaskListView(
                      TaskList: PastItems,
                      IsToday: false,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
