class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all
  end

  private

  def check_admin
    render_404 unless current_user.admin?
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html",  :status => 404
  end
end
