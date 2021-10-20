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

}