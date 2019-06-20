class PageController < ApplicationController
    def index
        @stores = Store.all
    end
end
