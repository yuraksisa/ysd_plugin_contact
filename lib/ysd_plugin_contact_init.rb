require 'ysd-plugins' unless defined?Plugins::Plugin
require 'ysd_plugin_contact_extension'

Plugins::SinatraAppPlugin.register :contact do

   name=        'contact'
   author=      'yurak sisa'
   description= 'Integrate the contact application'
   version=     '0.1'
   sinatra_extension Sinatra::YSD::Contacte
   sinatra_extension Sinatra::YSD::ContacteRESTApi
   hooker            Huasi::ContactExtension
  
end