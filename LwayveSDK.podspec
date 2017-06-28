Pod::Spec.new do |s|
  s.name         = "LwayveSDK"
  s.version      = "1.1.0"
  s.summary      = "iOS library"
  s.homepage     = "https://github.com/LWAYVE/ios-sdk"
  s.author       = { "Lixar, Inc" => "infra@lwayve.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/LWAYVE/ios-sdk.git", :tag => "1.1.0" }
  s.vendored_frameworks = 'LwayveSDK/LwayveSDK.framework'
  s.ios.deployment_target = '9.0'
  s.frameworks   = 'Foundation'

  s.dependency 'YapDatabase', '3.0'
  s.dependency 'Alamofire', '~> 4.5.0'
  s.dependency 'SwiftyJSON', '~> 3.1.4'
  s.dependency 'KeychainSwift', '~> 8.0.2'
  s.dependency 'CocoaLumberjack/Swift', '~> 3.2.0'

  s.dependency 'FirebaseMessaging', '2.0.0'

  s.requires_arc = true
  s.license      = 'MIT'
end
