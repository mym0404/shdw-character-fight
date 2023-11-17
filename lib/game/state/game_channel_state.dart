import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'player_state.dart';

part 'game_channel_state.g.dart';

@JsonSerializable()
class GameChannelState extends ChangeNotifier {
  GameChannelState();

  List<PlayerState> _players = [];
  List<PlayerState> get players => _players;
  set players(List<PlayerState> value) {
    _players = value;
    notifyListeners();
  }

  factory GameChannelState.fromJson(Map<String, dynamic> json) => _$GameChannelStateFromJson(json);
}
