#
# Be sure to run `pod lib lint Need.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Need"
  s.version          = "1.0.0"
  s.summary          = "Need is a swift-based dependency injection utility."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Need is a swift-based dependency injection utility for iOS apps. Whatever you need as a service, wherever you need it.
                       DESC

  s.homepage         = "https://github.com/leloupnicolas/Need"
  s.license          = 'MIT'
  s.author           = { "leloupnicolas" => "nicolasleloup.nl@gmail.com" }
  s.source           = { :git => "https://github.com/leloupnicolas/Need.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/leloupnicolas'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Need'
end
