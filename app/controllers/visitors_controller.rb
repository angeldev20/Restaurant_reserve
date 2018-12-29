class VisitorsController < ApplicationController

   
        def index
            @restaurants = Restaurant.all
          end

end
