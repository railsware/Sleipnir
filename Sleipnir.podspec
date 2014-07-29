Pod::Spec.new do |s|
  s.name         = "Sleipnir"
  s.version      = "0.2.0"
  s.summary      = "BDD-style framework in Swift"
  s.description  = "Sleipnir is a BDD-style framework for Swift highly inspired by Cedar"
  s.homepage     = "https://github.com/railsware/Sleipnir"
  s.license      = { :type => 'MIT', :file => 'Sleipnir/LICENSE' }
  s.source       = { :http => "https://github.com/railsware/Sleipnir/releases/download/v#{s.version}/Sleipnir-#{s.version}.zip" }
  s.authors      =  {'AlexDenisov' => '1101.debian@gmail.com', 'Artur Termenji' => 'atermenji@gmail.com' }
  s.social_media_url = 'https://twitter.com/railsware'
  s.screenshot  = "https://raw.githubusercontent.com/railsware/Sleipnir/master/logo.png"

  s.ios.platform          = :ios, '7.0'
  s.ios.preserve_paths = "Sleipnir/iOS/Sleipnir.framework"
  s.ios.vendored_frameworks = 'Sleipnir/iOS/Sleipnir.framework'

  s.osx.platform          = :osx, '10.9'
  s.osx.preserve_paths = "Sleipnir/OSX/Sleipnir.framework"
  s.osx.vendored_frameworks = 'Sleipnir/OSX/Sleipnir.framework'
  
  s.requires_arc = false
  s.frameworks = 'Foundation'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-all_load' }
end
