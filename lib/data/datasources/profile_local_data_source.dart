import 'package:training_project/storage/storage.dart';

class ProfileLocalDataSource {
  Future<String?> getAccessToken() async {
    return await Storage().getAccessToken();
  }
} 