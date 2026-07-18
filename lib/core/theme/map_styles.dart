/// Light / dark Google Map style JSON for Terrava branding.
abstract final class TerravaMapStyles {
  static const light = '''
[
  {"elementType":"geometry","stylers":[{"color":"#f3f6f4"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#5c6b64"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#f3f6f4"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#e8eee9"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#b7d0c2"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},
  {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#dfe8e3"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#c9d9d2"}]}
]
''';

  static const dark = '''
[
  {"elementType":"geometry","stylers":[{"color":"#0c1411"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#9aaba3"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#0c1411"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#16201c"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#1b3a2f"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#1a2621"}]},
  {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#24332d"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#102820"}]}
]
''';
}
