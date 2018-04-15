module ApplicationHelper
    def login_helper(style = "")
        str = "<span class='#{style}'> /</span>"
        if current_user.is_a?(GuestUser)
            (link_to "Login", new_user_session_path, class: style) + (str).html_safe  + 
            " ".html_safe +
            (link_to "Register", new_user_registration_path, class: style)
        else 
            link_to "Logout", destroy_user_session_path, method: :delete, class: style  
        end 
    end
    
    def source_helper
        if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class: "source-gretting")
        end
    end
    
    #For custom Petrid gem fix it later
    #def copyright_generator
        #PetridViewTool::Renderer.copyright("Dimitri Williams", "All rights reserved")
    #end
    
    
end
