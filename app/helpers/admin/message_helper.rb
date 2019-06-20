# frozen_string_literal: true
module Admin
  module MessageHelper
    def flash_message(msg_type)
      %Q(<p class="#{msg_type} error_messages">#{flash[msg_type]}</p>).html_safe
    end

    def error_block(store)
      # msg = ['<p class="error_messages">TEST message_helper</p>']
      msg = []
      if store.errors.any?
        msg << '<ul class="error_messages">'
        store.errors.full_messages.each do |message|
          msg << "<li class='alert alert-danger'>#{message}</li>"
        end
        msg << '</ul>'
      end
      sanitize(msg.join(''))
    end
  end
end