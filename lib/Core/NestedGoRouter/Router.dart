// lib/Core/Router/app_router.dart
import 'package:go_router/go_router.dart';
import '../../Features/AppUILightMode/Home/HomeAvenueScreen.dart';
import '../../Features/AppUILightMode/Home/HomeLessonDetailScreen.dart';
import '../../Features/AppUILightMode/Home/HomeMapScreen.dart';
import '../../Features/AppUILightMode/Leaderboard/LeaderboardScreen.dart';
import '../../Features/AppUILightMode/Profile/ProfileScreen.dart';
import '../../Features/AppUILightMode/Quest/QuestMenuScreen.dart';
import '../../Features/AppUILightMode/Quiz/QuizBasicGreetingsScreen.dart';
import '../../Features/AppUILightMode/Quiz/QuizIntroYourselfScreen.dart';
import '../../Features/AppUILightMode/Quiz/QuizWhatsGoodScreen.dart';
import '../../Features/AppUILightMode/Shop/ShopScreen.dart';
import '../../Features/AppUILightMode/Speak/SpeakScreen.dart';
import '../BottomNavBar/MainScaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },
      branches: [

        // Index 0 — HomeMapScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeMapScreen(),
              routes: [
                GoRoute(
                  path: 'avenue',
                  builder: (context, state) => const HomeAvenueScreen(),
                  routes: [
                    GoRoute(
                      path: 'lesson-detail',
                      builder: (context, state) => const HomeLessonDetailScreen(),
                    )
                  ]
                ),
                GoRoute(
                  path: 'lesson-detail',
                  builder: (context, state) => const HomeLessonDetailScreen(),
                  routes: [
                    GoRoute(
                      path: 'basic-greetings',
                      builder: (context, state) => const QuizBasicGreetingsScreen(),
                    ),
                    GoRoute(
                      path: 'whats-good',
                      builder: (context, state) => const QuizWhatsGoodScreen(),
                    ),
                    GoRoute(
                      path: 'intro-yourself',
                      builder: (context, state) => const QuizIntroYourselfScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Index 1 — SpeakScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/speak',
              builder: (context, state) => const SpeakScreen(),
            ),
          ],
        ),

        // Index 2 — LeaderboardScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/leaderboard',
              builder: (context, state) => const LeaderboardScreen(),
            ),
          ],
        ),

        // Index 3 — QuestMenuScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/quest',
              builder: (context, state) => const QuestMenuScreen(),
            ),
          ],
        ),

        // Index 4 — ShopScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/shop',
              builder: (context, state) => const ShopScreen(),
            ),
          ],
        ),

        // Index 5 — ProfileScreen
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),

      ],
    ),
  ],
);