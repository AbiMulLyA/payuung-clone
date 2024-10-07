import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
  Future<void> updateProfile(ProfileModel profile);
}

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final Database database;

  ProfileLocalDataSourceImpl(this.database);

  @override
  Future<ProfileModel> getProfile() async {
    final List<Map<String, dynamic>> maps = await database.query('profile');
    if (maps.isNotEmpty) {
      return ProfileModel.fromJson(maps.first);
    } else {
      // Return default profile if not exists
      return const ProfileModel(
        id: 1,
        fullName: 'John Doe',
        birthDate: '1990-01-01',
        sex: 'Male',
        ktpPath: '/path/to/ktp.jpg',
        nik: 1234567890123456,
        companyName: 'ABC Company',
        companyAddress: '123 Main St, City',
      );
    }
  }

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    await database.update(
      'profile',
      profile.toJson(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }
}
