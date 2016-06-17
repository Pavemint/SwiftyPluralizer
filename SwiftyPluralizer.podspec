#
# Be sure to run `pod lib lint SwiftyPluralizer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyPluralizer'
  s.version          = '0.1.0'
  s.summary          = 'Simple string pluralization with Ruby on Rails rules.'

  s.description      = <<-DESC
You can pluralize or singularize nouns easily with Ruby on Rails rules.
This pod is referencing Ruby on Rails.
                       DESC

  s.homepage         = 'https://github.com/malt03/SwiftyPluralizer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koji Murata' => 'malt.koji@gmail.com' }
  s.source           = { :git => 'https://github.com/malt03/SwiftyPluralizer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftyPluralizer/Classes/**/*'
end
