// server/lib/src/auth/app_scopes.dart
import 'package:serverpod/serverpod.dart';

class AppScope extends Scope {
  const AppScope(String super.name);

  // General user access
  static const user = AppScope('user');

  // Content management
  static const contentRead = AppScope('content:read');
  static const contentWrite = AppScope('content:write');
  static const contentDelete = AppScope('content:delete');

  // User management (beyond 'admin')
  static const userManagementView = AppScope('user_management:view');
  static const userManagementEdit = AppScope('user_management:edit');

  // Billing & finance
  static const billingView = AppScope('billing:view');
  static const billingManage = AppScope('billing:manage');

  // Example for a specific feature
  static const generateReports = AppScope('reports:generate');
}
