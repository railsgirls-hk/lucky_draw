class MainController < ApplicationController
  def index
    @users = User.where(is_admin: nil)
  end
end
