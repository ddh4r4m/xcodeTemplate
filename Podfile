# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'xcodeSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for xcodeSample
  pod 'Alamofire'
  pod 'FBSDKShareKit', '12.0.0'
#  pod 'FirebaseCrashlytics',

end

post_install do |installer|
  puts "Generating Pods.json"
  development_pods = installer.sandbox.development_pods
  mapped_pods = installer.analysis_result.specifications.reduce({}) { |result, spec|
    result[spec.name] = {
      name: spec.name,
      podspec: "#{spec.defined_in_file.to_s}",
      development_path: development_pods[spec.name]
    }
    result
  }
  File.open('Pods/Pods.json', 'w') { |file|
    file.write(JSON.pretty_generate(mapped_pods))
  }
end
