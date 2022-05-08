part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState({
    required this.members,
    required this.books,
    required this.selectedUser,
    required this.selectedBook,
  });

  final List<User> members;
  final List<Book> books;
  final User selectedUser;
  final Book selectedBook;

  AdminState copyWith(
      {List<User>? members,
      List<Book>? books,
      User selectedUser,
      Book selectedBook}) {
    return AdminState(
      members: members ?? this.members,
      books: books ?? this.books,
      selectedUser: selectedUser ?? this.selectedUser,
      selectedBook: selectedBook ?? this.selectedBook,
    );
  }

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {
  const AdminInitial() : super(List.empty(), List.empty(), ..., ...);
}
