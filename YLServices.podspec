#
# Be sure to run `pod lib lint YLServices.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                  = 'YLServices'
  s.version               = '0.1.0'
  s.summary               = 'iOS 开发工具'
  s.homepage              = 'https://github.com/a619668402/YLServices'
  s.author                = { 'DYL' => '15637195529@163.com' }
  s.source                = { :git => 'https://github.com/a619668402/YLServices.git', :tag => s.version.to_s }
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.requires_arc          = true

  s.ios.deployment_target = '8.0'
  s.source_files          = 'YLServices/Macros{Tools,Constant,Define,Singleton}.{h,m}'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks          = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
