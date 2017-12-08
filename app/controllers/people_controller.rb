class PeopleController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]


  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @user = current_user
    @person = @user.people.build(person_params)
    if @person.save
      flash[:success] = "New contact created successfully."
      redirect_to root_path
    else
      # Errors handled by error_messages.html.erb partial
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      flash[:success] = "Contact updated successfully."
      redirect_to root_path
    else
      # Errors handled by error_messages.html.erb partial
      render 'edit'
    end

  end

  def destroy
    Person.find(params[:id]).destroy
    flash[:success] = "Contact deleted."
    redirect_to root_path
  end


  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

<<<<<<< HEAD
  def number_params
    params.require(:phone_numbers).permit(:number, :person_id)
=======
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_path
    end
  end

  def correct_user
    @person = Person.find(params[:id])
    unless current_user.id == @person.user_id
      redirect_to root_path
    end
>>>>>>> 6869304ab95a8824b73b4a1a0e62b91f335f03ed
  end
end
