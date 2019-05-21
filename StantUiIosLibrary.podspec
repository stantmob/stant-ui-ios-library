Pod::Spec.new do |s|
  s.name             = 'StantUiIosLibrary'
  s.version          = '1.0'
  s.summary          = 'Stant Ios Library for UI Elements.'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }

  s.description      = 'Stant Ios Library containing UI Elements.'

  s.homepage         = 'https://github.com/stantmob/stant-ui-ios-library'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stant' => 'developer@stant.com.br' }
  s.source           = { :git => 'https://github.com/stantmob/stant-ui-ios-library.git', :tag => "#{s.version}" }

  s.ios.deployment_target = '10.3'
  s.swift_version = '4.2'

  s.source_files = 'StantUiIosLibrary/Classes/**/*'
end
