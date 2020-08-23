Pod::Spec.new do |s|
  s.name = 'LeakDetector'
  s.version = '1.0.0'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'Memory Leak Dedetection in runtime for iOS'
  s.homepage = 'https://www.linkedin.com/in/steve-dao-259563147/'
  s.social_media_url = 'https://twitter.com/duyquang_91'
  s.authors = { "Steve Dao" => "daoduyquang91@gmail.com" }
  s.source = { :git => "https://github.com/duyquang91/LeakDetector.git", :tag  => "v"+s.version.to_s }
  s.platforms = { :ios => "9.0" }
  s.requires_arc = true
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.4.0'
  s.dependency 'RxSwift', '~> 5.0'
  s.dependency 'RxCocoa', '~> 5.0'

  s.default_subspec = "Core"
  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/**/*.swift"
    ss.framework  = "Foundation"
 end
end
