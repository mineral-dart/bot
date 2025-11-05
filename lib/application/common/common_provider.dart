import 'dart:io';

import 'package:mineral/api.dart';
import 'package:mineral/container.dart';
import 'package:mineralbot/application/common/entities/voice_config.dart';
import 'package:mineralbot/application/common/events/voice_join.dart';
import 'package:mineralbot/application/common/events/voice_leave.dart';
import 'package:mineralbot/application/common/events/welcome_event.dart';
import 'package:mineralbot/application/common/states/voice_demand_state.dart';
import 'package:yaml/yaml.dart';

final class CommonProvider extends Provider with State {
  final Client _client;

  CommonProvider(this._client) {
    _client.register<VoiceDemandState>(VoiceDemandState.new);

    _client.register(VoiceJoin.new);
    _client.register(VoiceLeave.new);
    _client.register(WelcomeEvent.new);
  }

  @override
  void ready() {
    final configFile = File("config/common.yml");
    final payload = loadYaml(configFile.readAsStringSync());
    ioc.make<CommonConfig>(() => CommonConfig.fromYml(payload));

    print("Common provider is ready !");
  }
}