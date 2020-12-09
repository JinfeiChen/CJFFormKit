#
# Be sure to run `pod lib lint CJFFormKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CJFFormKit'
  s.version          = '1.0.1'
  s.summary          = '常用的各种Form表单控件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
常用的各种Form表单控件.包括编辑状态、查看状态。
                       DESC

  s.homepage         = 'https://github.com/JinfeiChen/CJFFormKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jinfei_chen@icloud.com' => 'jinfei_chen@icloud.com' }
  s.source           = { :git => 'https://github.com/JinfeiChen/CJFFormKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.2'

  s.source_files = 'CJFFormKit/Classes/**/*'
  
  s.resource_bundles = {
#      'CJFFormKit' => ['CJFFormKit/Assets/*.png']
    'CJFFormKit' => ['CJFFormKit/Assets/*.xcassets']
  }

  s.prefix_header_contents = '#import <UIKit/UIKit.h>', '#import <CJFFormKit/macros.h>'
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Masonry' # 如果需要多个依赖库依次往下写即可
  s.dependency 'YYModel'
  s.dependency 'YYText'
  s.dependency 'YYWebImage'
end
