Gem::Specification.new do |s|
  s.name    = "ysd_plugin_contact"
  s.version = "0.1"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-06-08"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Contact integration"
  s.summary = "Contact integration"
  
  s.add_runtime_dependency "ysd_core_plugins"
  s.add_runtime_dependency "ysd_md_mail"
  s.add_runtime_dependency "ysd_md_fieldset"
  s.add_runtime_dependency "ysd_plugin_yito_ui"
      
end