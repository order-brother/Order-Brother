# frozen_string_literal: true
module Admin
  module MessageHelper
    def flash_message(msg_type)
      return if msg_type.nil?
        %Q(<p class="#{msg_type} error_messages">#{flash[msg_type]}</p>).html_safe
    end

    def error_block(messages)
      # msg = ['<p class="error_messages">TEST message_helper</p>']
      msg = []
      if messages.errors.any?
        msg << '<ul class="error_messages">'
        messages.errors.full_messages.each do |message|
          msg << "<li class='alert alert-danger'>#{message}</li>"
        end
        msg << '</ul>'
      end
      sanitize(msg.join(''))
    end
  end
end