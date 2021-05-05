import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId => "ca-app-pub-9453023764752891/5168612104";
// test ca-app-pub-3940256099942544/6300978111 real ca-app-pub-9453023764752891/5168612104
  AdListener get adListener => _adListener;

  AdListener _adListener = AdListener(
      onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}'),
      onAdClosed: (ad) => print('Ad loaded: ${ad.adUnitId}'),
      onAdFailedToLoad: (ad, error) =>
          print('Ad loaded: ${ad.adUnitId}, $error'),
      onAdOpened: (ad) => print('Ad loaded: ${ad.adUnitId}'),
      onAppEvent: (ad, name, data) =>
          print('Ad loaded: ${ad.adUnitId}, $name, $data'),
      onApplicationExit: (ad) => print('Ad loaded: ${ad.adUnitId}'),
      onNativeAdClicked: (nativeAd) => print('Ad loaded: ${nativeAd.adUnitId}'),
      onNativeAdImpression: (nativeAd) =>
          print('Ad loaded: ${nativeAd.adUnitId}'),
      onRewardedAdUserEarnedReward: (ad, reward) =>
          print('Ad loaded: ${ad.adUnitId}, ${reward.amount}, ${reward.type}'));
}
