Pod::Spec.new do |s|

  s.name         = "PROJECT"
  s.version      = "0.0.1"
  s.summary      = "Fill with short description of PROJECT."

  s.description  = <<-DESC
                      Fill with detailed description of PROJECT.
                   DESC

  s.homepage     = "http://www.example.com"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "-{user name}" => "-{email}" }

  s.source       = { :git => "http://GIT/PROJECT.git", :tag => "#{s.version}" }

  s.source_files = "Source/**/*.swift"
  # s.resources = "Resources/*","Source/**/*.{xib}"

  s.ios.deployment_target = '9.0'
  # s.frameworks = "UIKit"

  s.pod_target_xcconfig = { "SWIFT_VERSION" => "4.0" }

end
