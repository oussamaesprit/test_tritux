import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tritux/data/list_repository.dart';
import 'package:flutter_tritux/domain/list.dart';
import 'package:flutter_tritux/presentation/list_bloc.dart';
import 'package:flutter_tritux/presentation/list_event.dart';
import 'package:flutter_tritux/presentation/list_state.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ListRepository listRepository = ListRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ListBloc>(
        create: (context) => ListBloc(listRepository: listRepository)..add(FetchList()),
        child: ListScreen(),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  String title = "";
  String image = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Set the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('List'),
          bottom: TabBar(
            // Add TabBar widget
            tabs: [
              Tab(text: 'Aujourd\'hui'),
              Tab(text: 'Tous'),
            ],
          ),
        ),
        body: TabBarView(
          // Add TabBarView widget
          children: [


        BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ListLoaded) {
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  Listt list = state.list[index];

                  DateTime inputDate = DateTime.parse(list.year);
                  DateFormat outputDateFormat = DateFormat('dd-MM-yyyy');
                  DateFormat outputTimeFormat = DateFormat.Hm();

                  String formattedDate = outputDateFormat.format(inputDate);
                  String formattedTime = outputTimeFormat.format(inputDate);

                  String outputdateString = "$formattedDate à $formattedTime";



                  if (list.year.contains("2023-07-13")) {
                    if (list.director.toString() == "TRANSFER_PINS") {
                      title = "transfert de pain";
                      image = "assets/image/Pin_Out.svg";
    }
                    else{
    title = "Mes gains";
    image = "assets/image/Pin_IN.svg";
    }


                      return

                        Container(
                        decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                    ),
                  borderRadius: BorderRadius.circular(8.0),
                  ),
                        child :
                  Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust the vertical spacing as needed
                  child:
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: SvgPicture.asset(image),
                        ),
                        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),



                        subtitle: Text(outputdateString),
                      )));
                    }
                  else{
                    return Container();
    }
                  }

              );
            } else if (state is ListError) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return Container();
            }
          },
        ),
  BlocBuilder<ListBloc, ListState>(
  builder: (context, state) {
  if (state is ListLoading) {
  return Center(
  child: CircularProgressIndicator(),
  );
  } else if (state is ListLoaded) {
  return ListView.builder(
  itemCount: state.list.length,
  itemBuilder: (context, index) {
  Listt list = state.list[index];


  DateTime inputDate = DateTime.parse(list.year);
  DateFormat outputDateFormat = DateFormat('dd-MM-yyyy');
  DateFormat outputTimeFormat = DateFormat.Hm();

  String formattedDate = outputDateFormat.format(inputDate);
  String formattedTime = outputTimeFormat.format(inputDate);

  String outputdateString = "$formattedDate à $formattedTime";

  if (list.director.toString() == "TRANSFER_PINS") {
  title = "transfert de pain";
  image = "assets/image/Pin_Out.svg";
  }
  else{
  title = "Mes gains";
  image = "assets/image/Pin_IN.svg";
  }


  return
    Container(
      decoration: BoxDecoration(
      border: Border.all(
      color: Colors.grey,
      width: 1.0,
  ),
    borderRadius: BorderRadius.circular(8.0),
    ),
    child :
    Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust the vertical spacing as needed
    child:
    ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      leading: ConstrainedBox(
  constraints: BoxConstraints(
  minWidth: 44,
  minHeight: 44,
  maxWidth: 64,
  maxHeight: 64,
  ),
  child: SvgPicture.asset(image),
  ),
  title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
  subtitle: Text(outputdateString),
  )));
  }
  );
  } else if (state is ListError) {
  return Center(
  child: Text('Error: ${state.error}'),
  );
  } else {
  return Container();
  }
},
)

          ],
        ),
      ),
    );
  }



}

