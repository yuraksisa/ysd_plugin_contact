require 'uri'
module Sinatra
  module YSD
    #
    # REST API for the contact module
    #
    module ContacteRESTApi
    
      def self.registered(app)
            
        # 
        # Send a message to the contact mailbox
        # 
        app.post "/contact" do
         
          request.body.rewind 
          data = JSON.parse(URI.unescape(request.body.read))    
  
          mail = MailDataSystem::Mail.new(data['mail']) 
          mail.post
          
        end       
              
      end
    
    end # ContacteRESTApi
  end # YSD
end # Sinatra