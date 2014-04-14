class Admin::ApplicationController < ActionController::Base
    http_basic_authenticate_with name: "mike", password: "mike9"
    protect_from_forgery

    layout "admin/admin"
end
