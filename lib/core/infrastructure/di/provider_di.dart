import 'package:food_ninja/core/data/providers/entities/banner/api/banner_provider.dart';
import 'package:food_ninja/core/domain/entities/banner/port/provider/banner_provider_port.dart';

import 'package:food_ninja/core/data/providers/entities/auth/api/auth_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';
import 'package:food_ninja/core/domain/entities/option/port/provider/option_crud_provider_port.dart';
import 'package:food_ninja/core/infrastructure/enums/crud_enum.dart';

import 'di.dart';



class ProviderDi extends Di {
  static OptionCrudProviderPort getOptionReadProvider(){
    return Di.di<OptionCrudProviderPort>(instanceName: CrudEnum.read.toString());
  }

  static OptionCrudProviderPort getOptionUpdateProvider(){
    return Di.di<OptionCrudProviderPort>(instanceName: CrudEnum.update.toString());
  }

    
  static AuthProviderPort getAuthRegisterProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.register.toString());
  }

  
  static AuthProviderPort getAuthVerifyAndRegisterProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.verifyAndRegister.toString());
  }
  
  static AuthProviderPort getAuthAuthorizeProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.authorize.toString());
  }
  
  static AuthProviderPort getAuthSendAccessRecoveryVerificationCodeProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.sendAccessRecoveryVerificationCode.toString());
  }
  
  static AuthProviderPort getAuthVerifyResetCodeProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.verifyResetCode.toString());
  }
  
  static AuthProviderPort getAuthCreateNewPasswordProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.createNewPassword.toString());
  }

  static AuthProviderPort getIsAuthorizedProvider() {
    return Di.di<AuthProviderPort>(instanceName: AuthProviderActionsEnum.isAuthorized.toString());
  }
  
  static BannerProviderPort getBannerGetMainBannerProvider() {
    return Di.di<BannerProviderPort>(instanceName: BannerProviderActionsEnum.getMainBanner.toString());
  }
}