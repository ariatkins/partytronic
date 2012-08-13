class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :show]
  before_filter :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
  	if User.find(params[:id])
  		@user = User.find(params[:id])
  	else
  		
  	end
  end

  def callback
  	name = request.env['omniauth.auth'][:info][:name]
  	email = request.env['omniauth.auth'][:info][:email]
  	fbid = request.env['omniauth.auth'][:uid]
  	image = request.env['omniauth.auth'][:info][:image]
  	fbtoken = request.env['omniauth.auth'][:credentials][:token]
  	@user = User.new(email: email, name: name, fbid: fbid, fbtoken: fbtoken, image: image)
  	
    if @user.save
    else
      @user = User.find_by_fbid(fbid)
      sign_in @user
      redirect_to @user
    end

  end

  def create
  end

  def index
    @users = User.all
  end

  def edit
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
