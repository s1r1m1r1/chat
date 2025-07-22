//   O
//  /|\
//  / \

class RemoteConfig {
  RemoteConfig({required this.requiredVersion});
  final String requiredVersion;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) {
    final requiredVersion = json['config']?['required_version'];
    if (requiredVersion == null) {
      throw FormatException('required_version not found in JSON: $json');
    }
    return RemoteConfig(requiredVersion: requiredVersion);
  }
}
