class WorksController < ApplicationController
    
    def select
    end

    def draw
        if params['m'].blank?
            @mode = 'sand'
        elsif params['m'] == '1'
            @mode = 'sand'
        elsif params['m'] == '2'
            @mode = 'window'
        elsif params['m'] == '3'
            @mode = 'sky'
        end
    end

end
