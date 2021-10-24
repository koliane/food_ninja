import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';

import 'package:get_it/get_it.dart';
import 'package:food_ninja/core/infrastructure/event_dispatching/event_dispatcher.dart';
import 'package:food_ninja/core/domain/entities/option/port/provider/option_crud_provider_port.dart';
import 'package:food_ninja/core/data/providers/entities/option/sqlite/option_crud_provider.dart';
import 'package:food_ninja/core/infrastructure/enums/crud_enum.dart';



class DiBootstrap {
  static final GetIt _di = GetIt.instance;

  static void providersToAppInit() {
    _di
      ..registerLazySingleton<OptionCrudProviderPort>(() => const OptionCrudProvider.read(), instanceName: CrudEnum.read.toString())
      ..registerLazySingleton<OptionCrudProviderPort>(() => const OptionCrudProvider.update(), instanceName: CrudEnum.update.toString());

    
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.register(), instanceName: AuthProviderActionsEnum.register.toString());
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.verifyAndRegister(), instanceName: AuthProviderActionsEnum.verifyAndRegister.toString());
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.authorize(), instanceName: AuthProviderActionsEnum.authorize.toString());
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.sendAccessRecoveryVerificationCode(), instanceName: AuthProviderActionsEnum.sendAccessRecoveryVerificationCode.toString());
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.verifyResetCode(), instanceName: AuthProviderActionsEnum.verifyResetCode.toString());
    _di.registerLazySingleton<AuthProviderPort>(() => const AuthProvider.createNewPassword(), instanceName: AuthProviderActionsEnum.createNewPassword.toString());
  }

  static void eventDispatcherToAppInit() {
    _di.registerSingleton<EventDispatcher>(EventDispatcher());
  }
}