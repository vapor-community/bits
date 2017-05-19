Pod::Spec.new do |spec|
  spec.name         = 'Bits'
  spec.version      = '0.1.2'
  spec.license      = 'MIT'
  spec.homepage     = 'https://github.com/vapor/bits'
  spec.authors      = { 'Vapor' => 'contact@vapor.codes' }
  spec.summary      = 'A bite sized library for dealing with bytes.'
  spec.source       = { :git => 'https://github.com/vapor/bits.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.requires_arc = true
  spec.social_media_url = 'https://twitter.com/codevapor'
  spec.default_subspec = "Default"

  spec.subspec "Default" do |ss|
    ss.source_files = 'Sources/**/*.{swift}'
  end
end
