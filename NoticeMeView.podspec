#
# Be sure to run `pod lib lint NoticeMeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NoticeMeView'
  s.version          = '0.1.0'
  s.summary          = 'Make new features more vibrant'
  s.swift_version = '5.0'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mouhammedali/NoticeMeView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mouhammedali' => 'mouhammedaliamer@gmail.com' }
  s.source           = { :git => 'https://github.com/mouhammedali/NoticeMeView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'NoticeMeView/Classes/**/*'
  

end
