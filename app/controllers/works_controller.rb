class WorksController < ApplicationController
        
    def index
        @works = Work.order('id DESC').limit(3 * 4)
    end
    
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

    def view
        if params['id'].blank?
            return redirect_to root_path, alert: 'パラメータがありません'
        end
    
        @work = Work.find_by_id(params['id'])
        if @work.blank?
            return redirect_to root_path, alert: '投稿が存在しません'
        end
        @user = User.find_by_id(@work.user_id)
    end

    def list
        @works = Work.order('id DESC')
    end

end
