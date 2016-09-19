Pod::Spec.new do |s|
  s.name         = "YYRandomCodes"
  s.version      = "0.1.0"
  s.summary      = "这是一个随机的图片验证码,可用于用户注册时的校验"
  s.description  = <<-DESC
                    这是一个随机的图片验证码,可用于用户注册时的校验.
                   DESC
  s.homepage     = "https://github.com/Kejiasir" 
  s.license      = "MIT" 
  s.author       = { "Arvin" => "yasir86@126.com" }  
  s.platform     = :ios, "7.0" 
  s.ios.deployment_target = "7.0" 
  s.source       = { :git => "https://github.com/Kejiasir/iOS-RandomCodes-demo.git", :tag => s.version }
  s.source_files = "iOS-RandomCodes-demo/iOS-RandomCodes-demo/YYRandomCodes/*.{h,m,plist}"  
  s.requires_arc = true  
end
