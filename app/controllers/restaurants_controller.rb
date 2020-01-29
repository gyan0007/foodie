class RestaurantsController < ApplicationController
  #before_action :logged_in_user, only: [:show]
  before_action :admin_user,     only: [:new, :create, :update, :destroy]

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.paginate(page: params[:page])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @rating_n_reviews = @restaurant.rating_n_reviews.paginate(page: params[:page])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:info] = "Restaurant created successfully."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted"
    redirect_to restaurants_url
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :location)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless logged_in? && current_user.admin?
    end
end
