import '../../domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../datasources/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> getProfile() async {
    final accessToken = await localDataSource.getAccessToken();
    if (accessToken == null) throw Exception('No access token');
    return await remoteDataSource.getProfile(accessToken);
  }

  @override
  Future<void> deleteAccount() async {
    final accessToken = await localDataSource.getAccessToken();
    if (accessToken == null) throw Exception('No access token');
    await remoteDataSource.deleteAccount(accessToken);
  }
} 