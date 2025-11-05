final class CommonConfig {
  final String parentId;
  final String initChannelId;
  final String welcomeChannelId;

  CommonConfig({
    required this.parentId,
    required this.initChannelId,
    required this.welcomeChannelId
  });

  factory CommonConfig.fromYml(final payload) {
    return CommonConfig(parentId: payload['parentId'], initChannelId: payload['initChannelId'], welcomeChannelId: payload['welcomeChannelId']);
  }
}
