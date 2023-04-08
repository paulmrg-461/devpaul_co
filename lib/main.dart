import 'package:devpaul_co/infrastructure/datasources/local_collaborator_datasource_impl.dart';
import 'package:devpaul_co/infrastructure/repositories/collaborator_repository_impl.dart';
import 'package:devpaul_co/presentation/providers/collaborators_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:devpaul_co/config/routes/router.dart';
import 'package:devpaul_co/core/helpers/custom_scroll_behavior.dart';
import 'package:devpaul_co/infrastructure/datasources/local_tech_stack_datasource_impl.dart';
import 'package:devpaul_co/infrastructure/repositories/tech_stack_repository_impl.dart';
import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/providers/tech_stack_provider.dart';
import 'package:devpaul_co/presentation/screens/web/home_screen.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TechStackRepositoryImpl techStackRepository = TechStackRepositoryImpl(
        techStackDatasource: LocalTechStackDatasourceImpl());

    final CollaboratorRepositoryImpl collaboratorRepository =
        CollaboratorRepositoryImpl(
            collaboratorDatasource: LocalCollaboratorDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        ),
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                TechStackProvider(techStackRepository: techStackRepository)
                  ..getTechStack()),
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => CollaboratorsProvider(
                collaboratorRepository: collaboratorRepository)
              ..getCollaborators()),
      ],
      child: MaterialApp(
        title: 'DevPaul',
        home: const HomePage(),
        initialRoute: 'home',
        onGenerateRoute: Flurorouter.router.generator,
        scrollBehavior: CustomScrollBehavior(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
      ),
    );
  }
}
