class UsersController < ApplicationController
  def index
  end

  def show
    @user = Hash.new
    if params[:username] == 'totz'
      @user[:username] = 'totz'
    elsif params[:username] = 'yuta'
      @user[:username] = 'yuta'
    end
  end
end
