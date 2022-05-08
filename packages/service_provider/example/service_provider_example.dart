import 'package:service_provider/service_provider.dart';

Future<void> main() async {
  final serviceProvider = ServiceProvider();

  await serviceProvider
      .login(
        email: "ricky.schuster@gerhold.com",
        password: "memberperpus",
      )
      .then((value) => print(value));
  print("===============");
  await serviceProvider
      .login(
        email: "admin@test.com",
        password: "memberperpus",
      )
      .then((value) => print(value));
  print("===============");
  await serviceProvider.getAllMember().then((value) => print(value));
  print("===============");
  await serviceProvider
      .storeNewBorrow(
        memberId: 3,
        bookId: 3,
      )
      .then((value) => print(value));
}
