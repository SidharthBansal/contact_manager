class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    Person.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end
end
