module Sinatra
  module YSD
    #
    # Accepted options :
    #
    #  - prefix        : If the module is attending requests from a path (/mycontacts/contact).
    #                    It allows using multiple mailbox in the site
    #  - show_wellcome : Show description message (false | true)  
    #  - show_company  : Show the company in the template (false | true)
    #  - show_email    : Show a line with the email address for contacting (false | true)
    #  - email         : The email address (String)
    #  - mailbox       : The mailbox to put the message (String default 'contact')    
    #
    module Contacte
    
      def self.registered(app)
                          
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))       
                   
        #
        # Show the contact form
        #
        app.get "/contact" do  
          
          welcome_message = t.contacteform.header
          
          locals = { :mailbox => SystemConfiguration::Variable.get_value('contact.mailbox'),
                     :show_company => SystemConfiguration::Variable.get_value('contact.show_company').to_s.to_bool,
                     :email => SystemConfiguration::Variable.get_value('contact.email',''),
                     :phone_number => SystemConfiguration::Variable.get_value('contact.phone_number','') }
          
          if SystemConfiguration::Variable.get_value('contact.show_welcome').to_s.to_bool
            locals.store(:welcome_message, welcome_message)
          else
            locals.store(:welcome_message, '')
          end
                    
          load_page('contacte', :locals => locals)
          
        end
          
        #
        # Serves static content from the extension
        #
        app.get "/contact/*" do
            
           serve_static_resource(request.path_info.gsub(/^\/contact/,''), File.join(File.dirname(__FILE__), '..', '..', 'static'), 'contact')          
            
        end          
      
      end
    
    end # Contacte
  end # YSD
end # Sinatra