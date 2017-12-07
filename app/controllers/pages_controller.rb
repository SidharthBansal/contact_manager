class PagesController < ApplicationController

  def home
    @people = current_user.people.paginate(page: params[:page], per_page: 10) if logged_in?
  end


end
