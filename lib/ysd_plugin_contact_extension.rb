require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Forum Extension
#
module Huasi

  class ContactExtension < Plugins::ViewListener
             
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
  
  end #ContactExtension
end #Huasi