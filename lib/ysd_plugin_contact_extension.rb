require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Forum Extension
#
module Huasi

  class ContactExtension < Plugins::ViewListener

    # ========= Page Building ============
    
    #
    # It gets the scripts used by the module
    #
    # @param [Context]
    #
    # @return [Array]
    #   An array which contains the css resources used by the module
    #
    def page_script(context={})
    
      ["/js/ysd.forms.js"]    
    
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
  
  end #ContactExtension
end #Huasi