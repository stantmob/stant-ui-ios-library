#
# Be sure to run `pod lib lint StantUiIosLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StantUiIosLibrary'
  s.version          = '1.0'
  s.summary          = 'Stant Ios Library for UI Elements.'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Stant Ios Library containing UI Elements.'

  s.homepage         = 'https://github.com/stantmob/stant-ui-ios-library'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stant' => 'developer@stant.com.br' }
  s.source           = { :git => 'https://github.com/stantmob/stant-ui-ios-library.git', :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.3'
  s.swift_version = '4.2'

  s.source_files = 'StantUiIosLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'StantUiIosLibrary' => ['StantUiIosLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
