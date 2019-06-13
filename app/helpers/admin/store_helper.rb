module Admin
  module StoreHelper
    def error_block(store)
      msg = []
      if store.errors.any? 
        msg << '<ul>'
        store.errors.full_messages.each do |message|
          msg << "<li>#{message}</li>"
        end
        msg << "</ul>"
      end
      sanitize(msg.join(''))
    end
  end
end