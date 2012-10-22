require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Forum Extension
#
module Huasi

  class ContactExtension < Plugins::ViewListener

    # ========= Installation =================

    # 
    # Install the plugin
    #
    def install(context={})
            
        SystemConfiguration::Variable.first_or_create({:name => 'contact.show_company'}, 
                                                      {:value => 'false', :description => 'show the company input field (values true or false)', :module => :contact}) 

        SystemConfiguration::Variable.first_or_create({:name => 'contact.show_welcome'}, 
                                                      {:value => 'false', :description => 'show the welcome message (values true or false)', :module => :contact}) 

        SystemConfiguration::Variable.first_or_create({:name => 'contact.email'}, 
                                                      {:value => '', :description => 'The email address', :module => :contact}) 

        SystemConfiguration::Variable.first_or_create({:name => 'contact.phone_number'}, 
                                                      {:value => '', :description => 'The phone number', :module => :contact}) 

        SystemConfiguration::Variable.first_or_create({:name => 'contact.mailbox'}, 
                                                      {:value => 'admin', :description => 'mail box where messages are post', :module => :contact}) 


    end    
             
    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => "/contact",
                 :regular_expression => /^\/contact/,
                 :title => 'Contact',
                 :description => 'The contact page',
                 :fit => 1,
                 :module => :contact}]
    
    end
    
    # ========= Aspects ==================
    
    #
    # Retrieve an array of the aspects defined in the plugin
    #
    # The attachment aspect (complement)
    #
    def aspects(context={})
      
      app = context[:app]
      
      aspects = []
      aspects << ::Plugins::Aspect.new(:contact, app.t.aspect.contact, [:entity], ContactAspectDelegate.new)
                                               
      return aspects
       
    end     
  
  end #ContactExtension
end #Huasi