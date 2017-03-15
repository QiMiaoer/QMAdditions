Pod::Spec.new do |s|
  s.name         = "QMAdditions"
  s.version      = "0.0.2"
  s.summary      = "MyAdditions"
  s.homepage     = "https://github.com/QiMiaoer/QMAdditions"
  s.license      = "MIT"
  s.author       = { "QiMiao" => "1228198159@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/QiMiaoer/QMAdditions.git", :tag => s.version }
  s.source_files  = "QMAdditions", "Qimiao-Demo/QMAdditions/*.{h,m}"
  s.requires_arc = true
end
