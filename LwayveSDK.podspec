Pod::Spec.new do |s|
  s.name         = "LwayveSDK"
  s.version      = "2.3.1"
  s.summary      = "iOS library"
  s.homepage     = "https://github.com/LWAYVE/ios-sdk"
  s.author       = { "Lixar, Inc" => "infra@lwayve.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/LWAYVE/ios-sdk.git", :tag => "2.3.1" }
  s.ios.deployment_target = '9.0'

  s.default_subspec = "Core"
  s.requires_arc = true
  s.license      = 'MIT'

  s.subspec "Core" do |ss|
    ss.dependency 'YapDatabase/Standard/Core', '3.0'
    ss.dependency 'Alamofire', '~> 4.5.0'
    ss.dependency 'SwiftyJSON', '~> 3.1.4'
    ss.dependency 'CocoaLumberjack', '~> 3.2.0'
    ss.dependency 'GoogleToolboxForMac/NSData+zlib', '~> 2.1.1'

    ss.vendored_frameworks = 'LwayveSDK/LwayveSDK.framework'

    ss.frameworks = 'AVFoundation', 'Foundation'
  end

  s.subspec "ProxSee" do |ss|
    ss.dependency 'LwayveSDK/Core'
    ss.dependency 'ProxSeeSDK', '3.0.0'
  end
end
