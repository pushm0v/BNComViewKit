Pod::Spec.new do |s|
  s.name         = "BNComViewKit"
  s.version      = "0.0.1"
  s.summary      = "Common View Reusable component."
  s.description  = <<-DESC
  Common View Reusable component. Just a simple library to lighten your day :)
                   DESC

  s.homepage     = "https://github.com/pushm0v/BNComViewKit"
  s.license      = 'MIT'
  s.author       = { "Bherly Novrandy" => "pushm0v.development@gmail.com" }
  s.platform     = :ios, "11.2"

  s.source       = { :git => "https://github.com/pushm0v/BNComViewKit.git", :tag => "#{s.version}" }
  s.source_files  = "BNComViewKit", "BNComViewKit/**/*.{h,m,swift,xib}"
  s.exclude_files = "Classes/Exclude"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }
end
