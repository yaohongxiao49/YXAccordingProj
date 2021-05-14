platform :ios, "10.0"
inhibit_all_warnings!


def pods
    pod 'RxSwift' #线程
    pod 'SnapKit' #适配
    pod 'SwiftyJSON' #json解析
    pod 'SwiftyUserDefaults' #NSUserdefaults
    pod 'Alamofire' #网络基础库
end

target 'YXAccordingProj' do
    pods

post_install do |installer|
  installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
    if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 10.0
       config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
   end
  end
end

end
