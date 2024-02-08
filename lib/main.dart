import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/core/network/dio_settings.dart';
import 'package:form/data/repositories/post_email_repo.dart';
import 'package:form/presentation/bloc/form_bloc.dart';
import 'package:form/presentation/pages/home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioSettings>(create: (context) => DioSettings()),
        RepositoryProvider<PostEmailRepo>(
            create: (context) => PostEmailRepo(
                dio: RepositoryProvider.of<DioSettings>(context).dio))
      ],
      child: BlocProvider(
        create: (context) =>
            FormBloc(repository: RepositoryProvider.of<PostEmailRepo>(context)),
        child: const MaterialApp(supportedLocales: [
          Locale('en'),
          Locale('el'),
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
        ], localizationsDelegates: [
          CountryLocalizations.delegate,
        ], debugShowCheckedModeBanner: false, home: HomePage()),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}
