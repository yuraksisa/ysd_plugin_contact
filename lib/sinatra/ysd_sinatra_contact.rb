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
          
        # Configuration
        app.set :show_wellcome, true
        app.set :show_company, true
        app.set :show_email, true
        app.set :email, ''
        app.set :mailbox, 'contact'
                
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))       
                   
        #
        # Show the contact form
        #
        app.get "/contact" do  
          load_page('contacte')
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