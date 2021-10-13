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

  
}