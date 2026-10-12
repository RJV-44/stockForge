import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/auth/domain/entities/user.dart';

void main() {
  group('User entity', () {
    test('instantiates correctly', () {
      const user = User(
        id: '1',
        name: 'Test User',
        email: 'test@example.com',
        role: 'Admin',
      );

      expect(user.id, '1');
      expect(user.name, 'Test User');
      expect(user.email, 'test@example.com');
      expect(user.role, 'Admin');
    });
  });
}
