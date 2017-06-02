Pod::Spec.new do |s|
  s.name          = "EasyRequest"
  s.version       = "0.1.0"
  s.summary       = "A simple framework that makes easy the communication with your Backend"
  s.homepage      = "https://github.com/EasyRequestSwift/EasyRequest"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Eduardo Vital Alencar Cunha" => "vitaldu@gmail.com" }
  s.author        = { "Guilherme Baldissera" => "guilhermebaldissera@hotmail.com" }
  s.platform      = :ios, "10.3"
  s.source        = { :git => "https://github.com/EasyRequestSwift/EasyRequest.git", :tag => 'v0.1.0' }
  s.source_files  = "EasyRequest", "EasyRequest/**/*.{h,m}"
  s.exclude_files = "EasyRequest/Exclude"
end
