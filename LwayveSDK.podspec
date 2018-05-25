Pod::Spec.new do |s|
  s.name         = "LwayveSDK"
  s.version      = "3.1.0"
  s.summary      = "iOS library"
  s.homepage     = "https://github.com/LWAYVE/ios-sdk"
  s.author       = { "Lixar, Inc" => "infra@lwayve.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/LWAYVE/ios-sdk.git", :tag => "3.1.0" }
  s.ios.deployment_target = '9.0'

  s.default_subspec = "Core"
  s.requires_arc = true
  s.license      = 'MIT'

  s.subspec "Core" do |ss|
    ss.dependency 'YapDatabase/Standard/Core', '3.0'
    ss.dependency 'Alamofire', '~> 4.5.0'
    ss.dependency 'SwiftyJSON', '~> 3.1.4'
    ss.dependency 'CocoaLumberjack', '~> 3'
    ss.dependency 'GoogleToolboxForMac/NSData+zlib', '~> 2.1.1'

    ss.vendored_frameworks = 'LwayveSDK/LwayveSDK.framework'

    ss.frameworks = 'AVFoundation', 'Foundation', 'MediaPlayer'
  end

  s.subspec "ProxSee" do |ss|
    ss.dependency 'LwayveSDK/Core'
    ss.dependency 'ProxSeeSDK', '3.0.2'
    ss.frameworks = 'CoreLocation'
  end
end
