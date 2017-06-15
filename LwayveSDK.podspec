Pod::Spec.new do |s|
  s.name         = "LwayveSDK"
  s.version      = "1.0.0"
  s.summary      = "iOS library"
  s.homepage     = "https://github.com/LWAYVE/ios-sdk"
  s.author       = { "Lixar, Inc" => "infra@lwayve.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/LWAYVE/ios-sdk.git", :tag => "1.0.0" }
  s.vendored_frameworks = 'LwayveSDK/LwayveSDK.framework'
  s.ios.deployment_target = '9.0'
  s.frameworks   = 'Foundation'

  s.dependency 'YapDatabase', '~> 3'
  s.dependency 'Alamofire', '~> 4.4'
  s.dependency 'SwiftyJSON', '~> 3.1'
  s.dependency 'KeychainSwift', '~> 8.0'
  s.dependency 'CocoaLumberjack/Swift', '~> 3.2'

  s.dependency 'GoogleToolboxForMac/NSData+zlib', '~> 2.1'
  s.dependency 'GoogleToolboxForMac/Logger'
  s.dependency 'Protobuf', '~> 3.1'

  s.requires_arc = true
  s.license      = 'MIT'
end
