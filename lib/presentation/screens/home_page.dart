import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:note_app/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/presentation/screens/add_note_page.dart';
import 'package:note_app/presentation/screens/user_onboarding/sign_up_page.dart';
import 'package:note_app/presentation/screens/view_note_page.dart';
import 'package:note_app/presentation/widgets/snackbar.dart';
import 'package:note_app/utils/const.dart';

import '../../models/note_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).fetchNotes();
  }

  List<NoteModel> arrNotes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Greeting,",
                        style: TextStyle(fontSize: 21, color: whiteColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "UserName",
                        style:
                            TextStyle(fontSize: 25, color: Colors.amberAccent),
                      ),
                    )
                  ],
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthUserLogOutState) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                      snackbarMessenger(context,
                          "You're now logged out. We're grateful for your time. Until we meet again!");
                    } else if (state is AuthErrorState) {
                      snackbarMessenger(context, state.errorMsg);
                    }
                  },
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).logOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: whiteColor,
                      )),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.white,
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: BlocBuilder<NoteCubit, NoteState>(
                builder: (context, state) {
                  if (state is NotesLoadingStates) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NotesLoadedStates) {
                    arrNotes = state.arrNotes;
                    return MasonryGridView.builder(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: arrNotes.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewNoteScreen(noteModel: arrNotes[index]),
                              ));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: goldColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    arrNotes[index].title.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    arrNotes[index].desc.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: blackColor.withOpacity(0.8)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    " ${DateTime.parse(arrNotes[index].dateTime!).day.toString()}-${DateTime.parse(arrNotes[index].dateTime!).month.toString()}-${DateTime.parse(arrNotes[index].dateTime!).year.toString()} ",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            )),
                      ),
                    );
                  } else if (state is NoteErrorState) {
                    return Center(child: Text(state.errorMsg));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNoteScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
