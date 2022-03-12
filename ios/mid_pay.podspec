#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'mid_pay'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
Midtrans Payment Gateway for Flutter.
                       DESC
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Creactive Indonesia' => 'creactive-indo@gmail.com' }
  s.source           = { :path => '.' }
  s.homepage = "https://creactive-indo.com"
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'MidtransKit', '1.20.1'
  s.dependency 'MidtransCoreKit', '1.20.1'
  s.ios.deployment_target = '9.0'
  s.static_framework = true
end

