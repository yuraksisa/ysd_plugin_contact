require 'ui/ysd_ui_fieldset_render' unless defined?UI::FieldSetRender

module Huasi
  #
  # Location aspect
  #
  class ContactAspectDelegate
    include ContentManagerSystem::Support

    #
    # Custom representation (the attachments)
    #
    # @param [Hash] the context
    # @param [Object] the element
    #
    def custom(context={}, element, aspect_model)
    
      app = context[:app]
      
      if element.contact_website.empty? and element.contact_email.empty? and element.contact_phone_number.empty? and
         element.contact_mobile.empty?
        ''
      else
        renderer = ::UI::FieldSetRender.new('contact', app)
        renderer.render('view','',{:element => element})
      end
      
    end    

    # ========= Entity Management extension ========= 
    
    #
    # Information
    #
    def element_info(context={})
      app = context[:app]
      {:id => 'contact', :description => "#{app.t.content.content_contact.description}"} 
    end

    #
    # Renders the tab
    #
    def element_form_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_form", info[:description])
    end

    #
    # Add fields to edit the photo information in the content form
    #
    def element_form(context={}, aspect_model)
      
      app = context[:app]
      
      renderer = ::UI::FieldSetRender.new('contact', app)      
      contact_form = renderer.render('form', 'em')    
      
    end
        
    #
    # Renders the tab
    #
    def element_template_tab(context={}, aspect_model)
      app = context[:app]
      info = element_info(context)
      render_tab("#{info[:id]}_template", info[:description])
    end    
    
    #
    # Show the photo information in the content render
    #
    def element_template(context={}, aspect_model)
    
       app = context[:app]
    
       renderer = ::UI::FieldSetRender.new('contact', app)      
       contact_template = renderer.render('view', 'em')
                
    end

  
  end
end