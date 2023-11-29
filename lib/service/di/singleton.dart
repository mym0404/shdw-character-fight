import 'package:local_file_preferences/local_file_preferences.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide LocalStorage;

import '../../export.dart';
import '../../game/socket/channel_manager.dart';
import '../../game/state/game_manager.dart';
import '../../game/util/user_thumbnail_util.dart';
import '../l10n/util/l10n_manager.dart';
import '../layout/layout_manager.dart';

Future<void> registerSingletons() async {
  di.registerSingleton(UserThumbnailUtil());

  var sharedPreferences = await SharedPreferences.getInstance();
  registerGlobalStorage(SharedPreferencesStorage(sharedPreferences: sharedPreferences));
  di.registerSingleton<LocalStorage>(SharedPreferencesLocalStorage(sharedPreferences));
  di.registerSingleton(L10NManager());
  di.registerSingleton(
    Logger(
      printer: PrefixPrinter(
        PrettyPrinter(colors: false, methodCount: 0, errorMethodCount: 20),
        error: '⛔',
        info: '💡',
        debug: '🌙',
      ),
    ),
  );
  di.registerSingleton(LayoutManager());

  di.registerSingleton(GameManager());
  di.registerSingleton(Supabase.instance.client);
  di.registerSingleton(ChannelManager());
}

Logger get log => di();
SupabaseClient get supabase => di();
GameManager get manager => di();
ChannelManager get channelManager => di();
