import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'feature/common/widget/simple_stream_builder.dart';
import 'game/main_game.dart';

export 'dart:async' hide Timer;
export 'dart:convert';
export 'dart:math' hide log, Rectangle;

export 'package:collection/collection.dart';
export 'package:extra_alignments/extra_alignments.dart';
export 'package:flame/components.dart';
export 'package:flame/flame.dart';
export 'package:flutter/foundation.dart' hide binarySearch, mergeSort;
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:gap/gap.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
export 'package:padding_extra/padding_extra.dart';
export 'package:rxdart/rxdart.dart' hide Notification;
export 'package:shared_preferences/shared_preferences.dart';
export 'package:watch_it/watch_it.dart';

export 'assets/assets.gen.dart';
export 'design/color/theme_colors.dart';
export 'design/theme.dart';
export 'design/typography/text_style.dart';
export 'feature/common/ui/widget/app_scaffold.dart';
export 'feature/common/util/duration_util.dart';
export 'feature/common/util/flame_extension.dart';
export 'feature/common/util/is.dart';
export 'feature/common/util/lifecycle_util.dart';
export 'feature/common/util/local_storage.dart';
export 'feature/common/util/snack_bar_extension.dart';
export 'feature/common/util/style_extension.dart';
export 'game/util/const.dart';
export 'service/di/singleton.dart';
export 'service/l10n/generated/l10n.dart';
export 'service/l10n/util/l10n_util.dart';
export 'service/router/route_extension.dart';

typedef VC = void Function();
typedef VAL<T> = ValueNotifier<T>;
typedef VL<T> = ValueListenableBuilder<T>;
typedef SB<T> = StreamBuilder<T>;
typedef SSB<T> = SimpleStreamBuilder<T>;
typedef BS<T> = BehaviorSubject<T>;
typedef TC = TextEditingController;
typedef Json = Map<String, dynamic>;
typedef V2 = Vector2;
typedef GRef = HasGameRef<MainGame>;
