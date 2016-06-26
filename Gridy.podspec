#
# Be sure to run `pod lib lint Gridy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Gridy'
  s.version          = '0.1.0'
  s.summary          = 'Gridy performs all the calculations related to grid layout.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	There are many situations when you need to manually calculate 2d grid layout (
	suppose you're writing game like chess or 2048). Gridy performs all necessary
    calculations so you don't have to. It's written in Swift, highly customizable
	but easy to use because it provides reasonable defaults for unused parameters. 
	Also Gridy is tested with XCTest test suite.
                       DESC

  s.homepage         = 'https://github.com/alexdoloz/Gridy'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexander Doloz' => 'doloz@outlook.com' }
  s.source           = { :git => 'https://github.com/alexdoloz/Gridy.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Pod/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Gridy' => ['Gridy/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
