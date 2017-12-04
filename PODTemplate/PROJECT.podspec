Pod::Spec.new do |s|

  s.name         = "PROJECT"
  s.version      = "0.0.1"
  s.summary      = "A short description of PROJECT."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://www.example.com"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "-{user name}" => "-{email}" }

  s.source       = { :git => "http://EXAMPLE/PROJECT.git", :tag => "#{s.version}" }


  s.ios.deployment_target = '9.0'

  s.source_files = 'PROJECT/**/*.swift'
  # s.resources = 'Resources/*','PROJECT/**/*.{xib}'

  # s.frameworks = 'UIKit'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
