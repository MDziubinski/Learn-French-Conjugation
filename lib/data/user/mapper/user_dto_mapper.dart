import 'package:french_conjugation_learn/data/common/data_mapper.dart';
import 'package:french_conjugation_learn/data/user/dto/custom_user_dto.dart';
import 'package:french_conjugation_learn/domain/user/model/custom_user.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomUserDtoMapper extends DataMapper<CustomUserDto, CustomUser> {
  @override
  CustomUser map(CustomUserDto data) {
    return CustomUser(
      email: data.email,
      name: data.name,
      profilePic: data.profilePic,
      progres: data.progres,
      dailyTaskDate: data.dailyTaskDate,
    );
  }
}
