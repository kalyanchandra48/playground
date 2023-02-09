// // Home page

// // Block
// // States
// // Events

// //states.dart
// class HomepageState {}

// class HomePageDataLoading extends HomepageState {
//   String loadingMessage = '';
// }
// class HomePageDataLoaded extends HomepageState {
//   List<Course> courses;
// }

// class HomePageDataupdated extends HomepageState {}

// //events.dart
// class HomePageEvents {}

// class HomePagereRefresh extends HomePageEvents {}

// //bloc.dart  similar to Viewmodel file
// class HomePageBloc {
// // receive events and emit states to the UI

// // emit(HomePageDataLoading)
//   /// After Firebase data is received -> emit(HomePageDataLoaded(coursesList))
// }



// // UI FILE

// // Widget build(BuildContext context){

// //   (state is HomePageDataLoading)
// //   { return LoadingWidget()}
// //   (state is HomePageDataLoaded){
// //     return ListView of courses
// //   }
// // }