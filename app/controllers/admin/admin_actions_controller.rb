class Admin::AdminActionsController < Admin::ApplicationController
    def index
        @actions = AdminAction.all.order("created_at desc")
    end
end
