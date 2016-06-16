Pod::Spec.new do |s|
  s.name             = "SlateVideo360"
  s.version          = "0.1.0"
  s.summary          = "SlateVideo360"

  s.description      = <<-DESC
                        SlateVideo360
                       DESC

  s.homepage         = "https://github.com/islate/SlateVideo360"
  s.license          = 'Apache 2.0'
  s.author           = { "林溢泽" => "linyize@gmail.com" }
  s.source           = { :git => "https://github.com/islate/SlateVideo360.git", :branch => "master" }

  s.ios.deployment_target = '7.0'

  s.source_files = "SlateVideo360/*.{h,m}"
  s.resource = 'SlateVideo360/Resources/HTY360PlayerVC.xib', 'SlateVideo360/Resources/Assets.xcassets', 'SlateVideo360/Resources/Shader.{fsh,vsh}'
  s.dependency = 'HTY360Player'
  s.dependency = 'CardboardSDK'
  
end