import 'package:http/http.dart' as http;

abstract class RequestPerpustakaan {
  Future<dynamic> login({
    required String email,
    required String password,
  });
  Future<dynamic> getAllBook();
  Future<dynamic> getAllMember();
  Future<dynamic> storeNewBorrow({
    required int memberId,
    required int bookId,
  });
}

class ServiceProvider implements RequestPerpustakaan {
  @override
  Future getAllBook() async {
    var client = http.Client();
    try {
      Uri url = Uri.parse("http://127.0.0.1:8000/api/v1/books");
      var response = await client.get(url);
      return response.body;
    } catch (e) {
      return "false";
    } finally {
      client.close();
    }
  }

  @override
  Future getAllMember() async {
    var client = http.Client();
    try {
      Uri url = Uri.parse("http://127.0.0.1:8000/api/v1/members");
      var response = await client.get(url);
      return response.body;
    } catch (e) {
      return "false";
    } finally {
      client.close();
    }
  }

  @override
  Future login({
    required String email,
    required String password,
  }) async {
    var client = http.Client();
    try {
      Uri url = Uri.parse("http://127.0.0.1:8000/api/v1/login");
      var response =
          await client.post(url, body: {"email": email, "password": password});
      return response.body;
    } catch (e) {
      return "false";
    } finally {
      client.close();
    }
  }

  @override
  Future storeNewBorrow({
    required int memberId,
    required int bookId,
  }) async {
    var client = http.Client();
    try {
      Uri url = Uri.parse("http://127.0.0.1:8000/api/v1/borrows/store");
      var response = await client.post(url, body: {
        "member_id": memberId.toString(),
        "book_id": bookId.toString(),
      });
      return response.body;
    } catch (e) {
      return "false";
    } finally {
      client.close();
    }
  }
}
