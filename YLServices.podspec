#
# Be sure to run `pod lib lint YLServices.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                  = 'YLServices'
  s.version               = '0.4.0'
  s.summary               = 'iOS 开发工具'
  s.homepage              = 'https://github.com/a619668402/YLServices'
  s.author                = { 'DYL' => '15637195529@163.com' }
  s.source                = { :git => 'https://github.com/a619668402/YLServices.git', :tag => s.version.to_s }
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.requires_arc          = true

  s.ios.deployment_target = '8.0'
  s.source_files          = 'YLServices/YLServices.h'
  s.public_header_files   = 'YLServices/YLServices.h'
  s.dependency 'MJRefresh', '~> 3.1.15.7'
  s.dependency 'YTKNetwork', '~> 2.0.4'
  s.dependency 'ReactiveObjC', '~> 3.1.0'
  s.dependency 'YYWebImage', '~> 1.0.5'
  s.dependency 'MJExtension',  '~> 3.0'

  s.subspec 'YLMacros' do |ss|
  ss.source_files         = 'YLServices/YLMacros/*.{h,m}'
  ss.public_header_files  = 'YLServices/YLMacros/*.h'
  end
  s.subspec 'YLMBProgress' do |ss|
  ss.source_files         = 'YLServices/YLMBProgress/*.{h,m}'
  ss.public_header_files  = 'YLServices/YLMBProgress/*.h'
  ss.ios.frameworks       = 'Foundation', 'UIKit', 'CoreGraphics'
  end
  s.subspec 'YLCategory' do |ss|
  ss.source_files         = 'YLServices/YLCategory/*.{h,m}'
  ss.public_header_files  = 'YLServices/YLCategory/*.h'
  ss.ios.frameworks       = 'Foundation', 'UIKit', 'CoreGraphics'
  ss.dependency 'YLServices/YLMacros'
  ss.dependency 'YLServices/YLMBProgress'
  end
  s.subspec 'YLTools' do |ss|
  ss.source_files         = 'YLServices/YLTools/*.{h,m}'
  ss.public_header_files  = 'YLServices/YLTools/*.h'
  end
end
