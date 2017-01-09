#
#  Be sure to run `pod spec lint AspectsCocoa.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "AspectsCocoa"
  s.version      = "1.0.0"
  s.summary      = "一个简单高效的实现AOP的库"
  s.description  = <<-DESC
                  一个简单高效的实现AOP的库
                   DESC
  s.homepage     = "https://longpengfei.com"
  s.platform     = :ios, '6.0'
  s.license      = "MIT"
  s.author             = { "longpengfei" => "466142249@qq.com" }
  s.source       = { :git => "https://github.com/LongPF/AspectsCocoa.git", :tag => s.version }
    s.source_files  = "AspectsCocoa/**/*.{h,m}"
  s.public_header_files = "AspectsCocoa/**/*.{h}"
  s.requires_arc = false


end
