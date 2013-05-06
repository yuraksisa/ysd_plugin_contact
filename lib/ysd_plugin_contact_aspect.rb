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
      
      if (not element.contact_website or element.contact_website.empty?) and 
         (not element.contact_email or element.contact_email.empty?) and 
         (not element.contact_phone_number or element.contact_phone_number.empty?) and 
         (not element.contact_mobile or element.contact_mobile.empty?)
        ''
      else
        aspect = aspect_model.aspect('contact')
        locals = {:contact_style_class => aspect.get_aspect_attribute_value('style_class')}        
        renderer = ::UI::FieldSetRender.new('contact', app)
        renderer.render('view','',locals.merge({:element => element}))
      end
      
    end    

    #
    # The aspect configuration form
    #
    def config(context={}, aspect_model)
      
      app = context[:app]
      template_path = File.expand_path(File.join(File.dirname(__FILE__),'..',
        'views','contact_aspect_config.erb'))
      template = Tilt.new(template_path)
      the_render = template.render(app)    
                
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