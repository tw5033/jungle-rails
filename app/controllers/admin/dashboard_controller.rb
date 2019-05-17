class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['basic_auth'], password: ENV['basic_password']

  def show
  end
end
