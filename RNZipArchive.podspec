require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|

  s.name           = 'RNZipArchive'
  s.version        = package['version']
  s.summary        = package['description']
  s.author         = package['author']
  s.license        = package['license']
  s.homepage       = package['homepage']
  s.source         = { :git => 'https://github.com/plrthink/react-native-zip-archive.git', :tag => "v#{s.version}"}
  s.platform       = :ios, '7.0'
  s.preserve_paths = '*.js'
  s.library        = 'z'

  s.dependency 'React'

  s.subspec 'Core' do |ss|
    ss.source_files = 'ios/*.{h,m}'
    ss.public_header_files = ['ios/RNZipArchive.h']
  end

  s.subspec 'SSZipArchive' do |ss|
    ss.source_files = 'ios/SSZipArchive/*.{h,m}', 'ios/SSZipArchive/aes/*.{h,c}', 'ios/SSZipArchive/minizip/*.{h,c}'
    ss.private_header_files = 'ios/SSZipArchive/*.h', 'ios/SSZipArchive/aes/*.h', 'ios/SSZipArchive/minizip/*.h'
  end

end
