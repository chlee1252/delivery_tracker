class APIPath {
  static String carrier() => 'https://apis.tracker.delivery/carriers';
  static String track(String cid, String tid) => 'https://apis.tracker.delivery/carriers/$cid/tracks/$tid';
}