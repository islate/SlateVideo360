Pod::Spec.new do |s|
  s.name             = "SlateVideo360"
  s.version          = "0.1.5"
  s.summary          = "iOS VR Player support 360 Degree Video and Google Cardboard."

  s.description      = <<-DESC
                        Open Source iOS VR Player support 360 Degree Video and Google Cardboard.
                       DESC

  s.homepage         = "https://github.com/islate/SlateVideo360"
  s.license          = 'Apache 2.0'
  s.author           = { "林溢泽" => "linyize@gmail.com" }
  s.source           = { :git => "https://github.com/islate/SlateVideo360.git", :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = "SlateVideo360/*.{h,m}"
  s.resource = 'SlateVideo360/Resources/HTY360PlayerVC.xib', 'SlateVideo360/Resources/Assets.xcassets', 'SlateVideo360/Resources/Shader.{fsh,vsh}'
  s.dependency 'HTY360PlayerLite', '0.1.2'
  s.dependency 'CardboardiOSSDK', '0.7.2.2'
  
end