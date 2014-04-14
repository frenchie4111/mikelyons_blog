class Admin::HomeController < Admin::ApplicationController
  def index
    @actions = AdminAction.all( order: "created_at desc", limit: 10 )
  end
end
