// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/adapters.dart' as _i5;
import 'package:hive_flutter/hive_flutter.dart' as _i37;
import 'package:image_picker/image_picker.dart' as _i24;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i27;

import '../core/app_providers.dart' as _i3;
import '../features/account/data/data_sources/account_data_source.dart' as _i41;
import '../features/account/data/model/account_model.dart' as _i12;
import '../features/account/data/repository/account_repository_impl.dart'
    as _i43;
import '../features/account/domain/repository/account_repository.dart' as _i42;
import '../features/account/domain/use_case/account_use_case.dart' as _i77;
import '../features/account/domain/use_case/add_account_use_case.dart' as _i44;
import '../features/account/domain/use_case/delete_account_use_case.dart'
    as _i53;
import '../features/account/domain/use_case/get_account_use_case.dart' as _i64;
import '../features/account/domain/use_case/get_accounts_use_case.dart' as _i65;
import '../features/account/domain/use_case/update_account_use_case.dart'
    as _i87;
import '../features/account/presentation/bloc/accounts_bloc.dart' as _i90;
import '../features/account/presentation/cubit/accounts_cubit.dart' as _i91;
import '../features/category/data/data_sources/category_data_source.dart'
    as _i13;
import '../features/category/data/model/category_model.dart' as _i11;
import '../features/category/data/repository/category_repository_impl.dart'
    as _i47;
import '../features/category/domain/repository/category_repository.dart'
    as _i46;
import '../features/category/domain/use_case/add_category_use_case.dart'
    as _i92;
import '../features/category/domain/use_case/category_use_case.dart' as _i76;
import '../features/category/domain/use_case/delete_category_use_case.dart'
    as _i54;
import '../features/category/domain/use_case/get_category_use_case.dart'
    as _i66;
import '../features/category/domain/use_case/get_default_categories_use_case.dart'
    as _i69;
import '../features/category/domain/use_case/update_category_use_case.dart'
    as _i88;
import '../features/category/presentation/bloc/category_bloc.dart' as _i97;
import '../features/debit/data/data_sources/debit_local_data_source_impl.dart'
    as _i16;
import '../features/debit/data/models/debit_model.dart' as _i10;
import '../features/debit/data/repository/debit_repository_impl.dart' as _i50;
import '../features/debit/domain/repository/debit_repository.dart' as _i49;
import '../features/debit/domain/use_case/add_debit_use.case.dart' as _i94;
import '../features/debit/domain/use_case/debit_use_case.dart' as _i99;
import '../features/debit/domain/use_case/delete_debit_use_case.dart' as _i57;
import '../features/debit/domain/use_case/get_debit_use_case.dart' as _i68;
import '../features/debit/domain/use_case/update_debit_use.case.dart' as _i89;
import '../features/debit/presentation/cubit/debts_bloc.dart' as _i98;
import '../features/debit_transaction/data/data_source/debit_transactions_data_store.dart'
    as _i17;
import '../features/debit_transaction/data/model/debit_transactions_model.dart'
    as _i9;
import '../features/debit_transaction/data/repository/debit_transaction_repo_impl.dart'
    as _i52;
import '../features/debit_transaction/domain/repository/debit_transaction_repository.dart'
    as _i51;
import '../features/debit_transaction/domain/use_case/add_debit_transaction_use_case.dart'
    as _i93;
import '../features/debit_transaction/domain/use_case/delete_debit_transaction_use_case.dart'
    as _i55;
import '../features/debit_transaction/domain/use_case/delete_debit_transactions_by_debit_id_use_case.dart'
    as _i56;
import '../features/debit_transaction/domain/use_case/get_debit_transactions_use_case.dart'
    as _i67;
import '../features/goals/data/data_source/goal_data_source.dart' as _i21;
import '../features/goals/data/models/goal_model.dart' as _i6;
import '../features/goals/data/repository/goal_repo_impl.dart' as _i23;
import '../features/goals/domain/repository/goal_repository.dart' as _i22;
import '../features/home/presentation/controller/summary_controller.dart'
    as _i34;
import '../features/home/presentation/pages/home/home_cubit.dart' as _i74;
import '../features/intro/data/repository/country_repository_impl.dart' as _i15;
import '../features/intro/domain/repository/country_repository.dart' as _i14;
import '../features/intro/domain/use_case/get_contries_user_case.dart' as _i19;
import '../features/intro/domain/use_case/get_selected_country_use_case.dart'
    as _i20;
import '../features/intro/domain/use_case/save_selected_country_use_case.dart'
    as _i30;
import '../features/intro/presentation/cubit/country_picker_cubit.dart' as _i48;
import '../features/profile/data/repository/profile_repository_impl.dart'
    as _i29;
import '../features/profile/domain/repository/profile_repository.dart' as _i28;
import '../features/profile/domain/use_case/image_picker_use_case.dart' as _i78;
import '../features/profile/domain/use_case/profile_use_case.dart' as _i82;
import '../features/profile/presentation/cubit/profile_cubit.dart' as _i81;
import '../features/recurring/data/data_sources/local_recurring_data_manager.dart'
    as _i25;
import '../features/recurring/data/data_sources/local_recurring_data_manager_impl.dart'
    as _i26;
import '../features/recurring/data/model/recurring.dart' as _i7;
import '../features/recurring/data/repository/recurring_repository_impl.dart'
    as _i84;
import '../features/recurring/domain/repository/recurring_repository.dart'
    as _i83;
import '../features/recurring/domain/use_case/add_recurring_use_case.dart'
    as _i95;
import '../features/recurring/domain/use_case/recurring_use_case.dart' as _i101;
import '../features/recurring/presentation/cubit/recurring_cubit.dart' as _i100;
import '../features/search/domain/use_case/filter_expense_use_case.dart'
    as _i85;
import '../features/search/presentation/cubit/search_cubit.dart' as _i102;
import '../features/settings/data/authenticate.dart' as _i4;
import '../features/settings/data/repository/csv_export_impl.dart' as _i62;
import '../features/settings/data/repository/json_export_import_impl.dart'
    as _i63;
import '../features/settings/data/repository/settings_repository_impl.dart'
    as _i32;
import '../features/settings/domain/repository/import_export.dart' as _i61;
import '../features/settings/domain/repository/settings_repository.dart'
    as _i31;
import '../features/settings/domain/use_case/csv_file_export_use_case.dart'
    as _i96;
import '../features/settings/domain/use_case/json_file_export_use_case.dart'
    as _i79;
import '../features/settings/domain/use_case/json_file_import_use_case.dart'
    as _i80;
import '../features/settings/domain/use_case/setting_use_case.dart' as _i35;
import '../features/settings/domain/use_case/settings_use_case.dart' as _i33;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i103;
import '../features/transaction/data/data_sources/local/transaction_data_manager.dart'
    as _i36;
import '../features/transaction/data/model/transaction_model.dart' as _i8;
import '../features/transaction/data/repository/transaction_repository_impl.dart'
    as _i39;
import '../features/transaction/domain/repository/transaction_repository.dart'
    as _i38;
import '../features/transaction/domain/use_case/add_transaction_use_case.dart'
    as _i45;
import '../features/transaction/domain/use_case/delete_transaction_from_category_id_use_case.dart'
    as _i60;
import '../features/transaction/domain/use_case/delete_transaction_use_case.dart'
    as _i58;
import '../features/transaction/domain/use_case/delete_transactions_by_account_id_use_case.dart'
    as _i59;
import '../features/transaction/domain/use_case/get_transaction_use_case.dart'
    as _i70;
import '../features/transaction/domain/use_case/get_transactions_by_account_id_use_case.dart'
    as _i71;
import '../features/transaction/domain/use_case/get_transactions_by_category_id_use_case.dart'
    as _i72;
import '../features/transaction/domain/use_case/get_transactions_use_case.dart'
    as _i73;
import '../features/transaction/domain/use_case/transaction_use_case.dart'
    as _i75;
import '../features/transaction/domain/use_case/update_expense_use_case.dart'
    as _i40;
import '../features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i86;
import 'module/hive_module.dart' as _i104;
import 'module/service_module.dart' as _i105;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final hiveBoxModule = _$HiveBoxModule();
  final serviceBoxModule = _$ServiceBoxModule();
  gh.lazySingleton<_i3.AppProviders>(() => _i3.AppProviders());
  gh.lazySingleton<_i4.Authenticate>(() => _i4.Authenticate());
  await gh.lazySingletonAsync<_i5.Box<_i6.GoalModel>>(
    () => hiveBoxModule.goalBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<dynamic>>(
    () => hiveBoxModule.boxDynamic(),
    instanceName: 'settings',
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i7.RecurringModel>>(
    () => hiveBoxModule.recurringBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i8.TransactionModel>>(
    () => hiveBoxModule.expenseBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i9.DebitTransactionsModel>>(
    () => hiveBoxModule.transactionsBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i10.DebitModel>>(
    () => hiveBoxModule.debtsBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i11.CategoryModel>>(
    () => hiveBoxModule.categoryBox(),
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i5.Box<_i12.AccountModel>>(
    () => hiveBoxModule.accountBox(),
    preResolve: true,
  );
  gh.lazySingleton<_i13.CategoryDataSource>(() =>
      _i13.LocalCategoryManagerDataSourceImpl(
          gh<_i5.Box<_i11.CategoryModel>>()));
  gh.lazySingleton<_i14.CountryRepository>(() => _i15.CountryRepositoryImpl(
      gh<_i5.Box<dynamic>>(instanceName: 'settings')));
  gh.lazySingleton<_i16.DebtDataSource>(
      () => _i16.DebitDataSourceImpl(debtBox: gh<_i5.Box<_i10.DebitModel>>()));
  gh.lazySingleton<_i17.DebtTransactionDataSource>(() =>
      _i17.DebitTransactionDataStoreImpl(
          transactionsBox: gh<_i5.Box<_i9.DebitTransactionsModel>>()));
  gh.lazySingleton<_i18.DeviceInfoPlugin>(
      () => serviceBoxModule.providesDeviceInfoPlugin());
  gh.factory<_i19.GetCountriesUseCase>(
      () => _i19.GetCountriesUseCase(repository: gh<_i14.CountryRepository>()));
  gh.lazySingleton<_i20.GetSelectedCountryUseCase>(() =>
      _i20.GetSelectedCountryUseCase(repository: gh<_i14.CountryRepository>()));
  gh.lazySingleton<_i21.GoalDataSource>(() => _i21.GoalDataSourceImpl(
        goalBox: gh<_i5.Box<_i6.GoalModel>>(),
        transactionBox: gh<_i5.Box<_i9.DebitTransactionsModel>>(),
      ));
  gh.lazySingleton<_i22.GoalRepository>(() => _i23.GoalRepositoryImpl());
  gh.lazySingleton<_i24.ImagePicker>(
      () => serviceBoxModule.providesImagePicker());
  gh.factory<_i25.LocalRecurringDataManager>(() =>
      _i26.LocalRecurringDataManagerImpl(gh<_i5.Box<_i7.RecurringModel>>()));
  await gh.lazySingletonAsync<_i27.PackageInfo>(
    () => serviceBoxModule.providesPackageInfoPlugin(),
    preResolve: true,
  );
  gh.lazySingleton<_i28.ProfileRepository>(() => _i29.ProfileRepositoryImpl(
        gh<_i24.ImagePicker>(),
        gh<_i5.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.lazySingleton<_i30.SaveSelectedCountryUseCase>(() =>
      _i30.SaveSelectedCountryUseCase(
          repository: gh<_i14.CountryRepository>()));
  gh.factory<_i31.SettingsRepository>(() => _i32.SettingsRepositoryImpl(
      gh<_i5.Box<dynamic>>(instanceName: 'settings')));
  gh.lazySingleton<_i33.SettingsUseCase>(
      () => _i33.SettingsUseCase(gh<_i31.SettingsRepository>()));
  gh.lazySingleton<_i34.SummaryController>(
      () => _i34.SummaryController(gh<_i35.SettingsUseCase>()));
  gh.factory<_i36.TransactionDataSource>(() =>
      _i36.LocalTransactionManagerImpl(gh<_i37.Box<_i8.TransactionModel>>()));
  gh.lazySingleton<_i38.TransactionRepository>(() =>
      _i39.ExpenseRepositoryImpl(dataSource: gh<_i36.TransactionDataSource>()));
  gh.lazySingleton<_i40.UpdateTransactionUseCase>(() =>
      _i40.UpdateTransactionUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i41.AccountDataSource>(() =>
      _i41.AccountDataSourceImpl(accountBox: gh<_i5.Box<_i12.AccountModel>>()));
  gh.lazySingleton<_i42.AccountRepository>(() =>
      _i43.AccountRepositoryImpl(dataSource: gh<_i41.AccountDataSource>()));
  gh.lazySingleton<_i44.AddAccountUseCase>(() =>
      _i44.AddAccountUseCase(accountRepository: gh<_i42.AccountRepository>()));
  gh.lazySingleton<_i45.AddTransactionUseCase>(() => _i45.AddTransactionUseCase(
      expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i46.CategoryRepository>(() => _i47.CategoryRepositoryImpl(
        dataSources: gh<_i13.CategoryDataSource>(),
        expenseDataManager: gh<_i36.TransactionDataSource>(),
      ));
  gh.factory<_i48.CountryPickerCubit>(() => _i48.CountryPickerCubit(
        gh<_i19.GetCountriesUseCase>(),
        gh<_i20.GetSelectedCountryUseCase>(),
        gh<_i30.SaveSelectedCountryUseCase>(),
      ));
  gh.lazySingleton<_i49.DebitRepository>(
      () => _i50.DebtRepositoryImpl(dataSource: gh<_i16.DebtDataSource>()));
  gh.lazySingleton<_i51.DebitTransactionRepository>(() =>
      _i52.DebitTransactionRepoImpl(
          dataStore: gh<_i17.DebtTransactionDataSource>()));
  gh.lazySingleton<_i53.DeleteAccountUseCase>(() => _i53.DeleteAccountUseCase(
      accountRepository: gh<_i42.AccountRepository>()));
  gh.lazySingleton<_i54.DeleteCategoryUseCase>(() => _i54.DeleteCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.lazySingleton<_i55.DeleteDebitTransactionUseCase>(() =>
      _i55.DeleteDebitTransactionUseCase(
          debtRepository: gh<_i51.DebitTransactionRepository>()));
  gh.lazySingleton<_i56.DeleteDebitTransactionsByDebitIdUseCase>(() =>
      _i56.DeleteDebitTransactionsByDebitIdUseCase(
          debtRepository: gh<_i51.DebitTransactionRepository>()));
  gh.lazySingleton<_i57.DeleteDebitUseCase>(() =>
      _i57.DeleteDebitUseCase(debtRepository: gh<_i49.DebitRepository>()));
  gh.lazySingleton<_i58.DeleteTransactionUseCase>(() =>
      _i58.DeleteTransactionUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i59.DeleteTransactionsByAccountIdUseCase>(() =>
      _i59.DeleteTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i60.DeleteTransactionsByCategoryIdUseCase>(() =>
      _i60.DeleteTransactionsByCategoryIdUseCase(
          transactionRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i61.Export>(
    () => _i62.CSVExport(
      gh<_i18.DeviceInfoPlugin>(),
      gh<_i41.AccountDataSource>(),
      gh<_i13.CategoryDataSource>(),
      gh<_i36.TransactionDataSource>(),
    ),
    instanceName: 'csv',
  );
  gh.lazySingleton<_i61.Export>(
    () => _i63.JSONExportImpl(
      gh<_i41.AccountDataSource>(),
      gh<_i13.CategoryDataSource>(),
      gh<_i36.TransactionDataSource>(),
      gh<_i16.DebtDataSource>(),
      gh<_i17.DebtTransactionDataSource>(),
      gh<_i27.PackageInfo>(),
    ),
    instanceName: 'json_export',
  );
  gh.lazySingleton<_i64.GetAccountUseCase>(() =>
      _i64.GetAccountUseCase(accountRepository: gh<_i42.AccountRepository>()));
  gh.lazySingleton<_i65.GetAccountsUseCase>(() =>
      _i65.GetAccountsUseCase(accountRepository: gh<_i42.AccountRepository>()));
  gh.lazySingleton<_i66.GetCategoryUseCase>(() => _i66.GetCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.lazySingleton<_i67.GetDebitTransactionsUseCase>(() =>
      _i67.GetDebitTransactionsUseCase(
          debtRepository: gh<_i51.DebitTransactionRepository>()));
  gh.lazySingleton<_i68.GetDebitUseCase>(
      () => _i68.GetDebitUseCase(debtRepository: gh<_i49.DebitRepository>()));
  gh.lazySingleton<_i69.GetDefaultCategoriesUseCase>(() =>
      _i69.GetDefaultCategoriesUseCase(
          categoryRepository: gh<_i46.CategoryRepository>()));
  gh.lazySingleton<_i70.GetTransactionUseCase>(() => _i70.GetTransactionUseCase(
      transactionRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i71.GetTransactionsByAccountIdUseCase>(() =>
      _i71.GetTransactionsByAccountIdUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i72.GetTransactionsByCategoryIdUseCase>(() =>
      _i72.GetTransactionsByCategoryIdUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.lazySingleton<_i73.GetTransactionsUseCase>(() =>
      _i73.GetTransactionsUseCase(
          expenseRepository: gh<_i38.TransactionRepository>()));
  gh.factory<_i74.HomeCubit>(() => _i74.HomeCubit(
        gh<_i75.GetTransactionsUseCase>(),
        gh<_i76.GetDefaultCategoriesUseCase>(),
        gh<_i77.GetAccountUseCase>(),
        gh<_i76.GetCategoryUseCase>(),
        gh<_i75.GetTransactionsByCategoryIdUseCase>(),
        gh<_i75.GetTransactionsByAccountIdUseCase>(),
      ));
  gh.lazySingleton<_i78.ImagePickerUseCase>(
      () => _i78.ImagePickerUseCase(gh<_i28.ProfileRepository>()));
  gh.lazySingleton<_i61.Import>(
    () => _i63.JSONImportImpl(
      gh<_i18.DeviceInfoPlugin>(),
      gh<_i41.AccountDataSource>(),
      gh<_i13.CategoryDataSource>(),
      gh<_i36.TransactionDataSource>(),
      gh<_i16.DebtDataSource>(),
      gh<_i17.DebtTransactionDataSource>(),
    ),
    instanceName: 'json_import',
  );
  gh.lazySingleton<_i79.JSONFileExportUseCase>(() => _i79.JSONFileExportUseCase(
        gh<_i31.SettingsRepository>(),
        gh<_i61.Export>(instanceName: 'json_export'),
      ));
  gh.lazySingleton<_i80.JSONFileImportUseCase>(() => _i80.JSONFileImportUseCase(
        gh<_i31.SettingsRepository>(),
        gh<_i61.Import>(instanceName: 'json_import'),
      ));
  gh.factory<_i81.ProfileCubit>(() => _i81.ProfileCubit(
        gh<_i82.ImagePickerUseCase>(),
        gh<_i5.Box<dynamic>>(instanceName: 'settings'),
      ));
  gh.lazySingleton<_i83.RecurringRepository>(() => _i84.RecurringRepositoryImpl(
        gh<_i25.LocalRecurringDataManager>(),
        gh<_i36.TransactionDataSource>(),
      ));
  gh.lazySingleton<_i85.SearchUseCase>(
      () => _i85.SearchUseCase(gh<_i38.TransactionRepository>()));
  gh.factory<_i86.TransactionBloc>(() => _i86.TransactionBloc(
        gh<_i33.SettingsUseCase>(),
        getTransactionUseCase: gh<_i75.GetTransactionUseCase>(),
        accountUseCase: gh<_i77.GetAccountUseCase>(),
        addTransactionUseCase: gh<_i75.AddTransactionUseCase>(),
        deleteTransactionUseCase: gh<_i75.DeleteTransactionUseCase>(),
        updateTransactionUseCase: gh<_i75.UpdateTransactionUseCase>(),
        accountsUseCase: gh<_i77.GetAccountsUseCase>(),
        getDefaultCategoriesUseCase: gh<_i76.GetDefaultCategoriesUseCase>(),
      ));
  gh.lazySingleton<_i87.UpdateAccountUseCase>(() => _i87.UpdateAccountUseCase(
      accountRepository: gh<_i42.AccountRepository>()));
  gh.lazySingleton<_i88.UpdateCategoryUseCase>(() => _i88.UpdateCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.lazySingleton<_i89.UpdateDebitUseCase>(() =>
      _i89.UpdateDebitUseCase(debtRepository: gh<_i49.DebitRepository>()));
  gh.factory<_i90.AccountBloc>(() => _i90.AccountBloc(
        getAccountUseCase: gh<_i77.GetAccountUseCase>(),
        deleteAccountUseCase: gh<_i77.DeleteAccountUseCase>(),
        addAccountUseCase: gh<_i77.AddAccountUseCase>(),
        getCategoryUseCase: gh<_i66.GetCategoryUseCase>(),
        deleteExpensesFromAccountIdUseCase:
            gh<_i75.DeleteTransactionsByAccountIdUseCase>(),
        updateAccountUseCase: gh<_i77.UpdateAccountUseCase>(),
      ));
  gh.factory<_i91.AccountsCubit>(() => _i91.AccountsCubit(
        gh<_i75.GetTransactionsByAccountIdUseCase>(),
        gh<_i77.GetAccountUseCase>(),
      ));
  gh.lazySingleton<_i92.AddCategoryUseCase>(() => _i92.AddCategoryUseCase(
      categoryRepository: gh<_i46.CategoryRepository>()));
  gh.lazySingleton<_i93.AddDebitTransactionUseCase>(() =>
      _i93.AddDebitTransactionUseCase(
          debtRepository: gh<_i51.DebitTransactionRepository>()));
  gh.lazySingleton<_i94.AddDebitUseCase>(
      () => _i94.AddDebitUseCase(debtRepository: gh<_i49.DebitRepository>()));
  gh.lazySingleton<_i95.AddRecurringUseCase>(
      () => _i95.AddRecurringUseCase(gh<_i83.RecurringRepository>()));
  gh.lazySingleton<_i96.CSVFileExportUseCase>(() => _i96.CSVFileExportUseCase(
        gh<_i31.SettingsRepository>(),
        gh<_i61.Export>(instanceName: 'csv'),
      ));
  gh.factory<_i97.CategoryBloc>(() => _i97.CategoryBloc(
        getCategoryUseCase: gh<_i76.GetCategoryUseCase>(),
        addCategoryUseCase: gh<_i76.AddCategoryUseCase>(),
        deleteCategoryUseCase: gh<_i76.DeleteCategoryUseCase>(),
        deleteExpensesFromCategoryIdUseCase:
            gh<_i75.DeleteTransactionsByCategoryIdUseCase>(),
        updateCategoryUseCase: gh<_i76.UpdateCategoryUseCase>(),
      ));
  gh.factory<_i98.DebitBloc>(() => _i98.DebitBloc(
        addDebtUseCase: gh<_i99.AddDebitUseCase>(),
        getDebtUseCase: gh<_i99.GetDebitUseCase>(),
        getTransactionsUseCase: gh<_i67.GetDebitTransactionsUseCase>(),
        addTransactionUseCase: gh<_i93.AddDebitTransactionUseCase>(),
        updateDebtUseCase: gh<_i99.UpdateDebitUseCase>(),
        deleteDebtUseCase: gh<_i99.DeleteDebitUseCase>(),
        deleteDebitTransactionUseCase: gh<_i55.DeleteDebitTransactionUseCase>(),
        deleteDebitTransactionsByDebitIdUseCase:
            gh<_i56.DeleteDebitTransactionsByDebitIdUseCase>(),
      ));
  gh.factory<_i100.RecurringCubit>(
      () => _i100.RecurringCubit(gh<_i101.AddRecurringUseCase>()));
  gh.factory<_i102.SearchCubit>(
      () => _i102.SearchCubit(gh<_i85.SearchUseCase>()));
  gh.factory<_i103.SettingCubit>(() => _i103.SettingCubit(
        gh<_i75.GetTransactionsUseCase>(),
        gh<_i76.GetDefaultCategoriesUseCase>(),
        gh<_i75.UpdateTransactionUseCase>(),
        gh<_i35.JSONFileImportUseCase>(),
        gh<_i35.JSONFileExportUseCase>(),
        gh<_i35.SettingsUseCase>(),
        gh<_i35.CSVFileExportUseCase>(),
      ));
  return getIt;
}

class _$HiveBoxModule extends _i104.HiveBoxModule {}

class _$ServiceBoxModule extends _i105.ServiceBoxModule {}
