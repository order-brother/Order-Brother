module Admin
  module StoreHelper
    def flash_message(msg_type)
      %Q(<p class="#{msg_type} error_messages">#{flash[msg_type]}</p>).html_safe
    end

    def error_block(store)
      msg = []
      if store.errors.any? 
        msg << '<ul class="error_messages">'
        store.errors.full_messages.each do |message|
          msg << "<li>#{message}</li>"
        end
        msg << "</ul>"
      end
      sanitize(msg.join(''))
    end
  end
end