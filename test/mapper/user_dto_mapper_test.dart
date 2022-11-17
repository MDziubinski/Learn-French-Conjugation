import 'package:flutter_test/flutter_test.dart';
import 'package:french_conjugation_learn/data/user/dto/custom_user_dto.dart';
import 'package:french_conjugation_learn/data/user/mapper/user_dto_mapper.dart';

void main() {
  const customUserDto = CustomUserDto(
    email: 'email',
    name: 'name',
    profilePic: 'profilePic',
    progres: {},
    dailyTaskDate: 'dailyTaskDate',
  );

  final customUserDtoMapper = CustomUserDtoMapper();

  test('Test CustomUserDtoMapper', () {
    final mappedUser = customUserDtoMapper.map(customUserDto);

    expect(mappedUser.dailyTaskDate, customUserDto.dailyTaskDate);
    expect(mappedUser.email, customUserDto.email);
    expect(mappedUser.progres, customUserDto.progres);
  });
}
