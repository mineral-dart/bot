import 'package:docker_test/application/common/common_provider.dart';
import 'package:mineral/api.dart';
import 'package:mineral_cache/providers/memory.dart';

void main(_, port) async {
  print('Hello 🚀');

  final client = ClientBuilder()
      .setCache(MemoryProvider.new)
      .registerProvider(CommonProvider.new)
      .setHmrDevPort(port).build();

  client.events.server.serverCreate((server) async {
    client.logger.info('${server.name} was created !');
  });

  await client.init();
}
