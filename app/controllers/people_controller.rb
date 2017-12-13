class PeopleController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :find_person, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @person = Person.new
  end

  def create
    @user = current_user
    @person = @user.people.build(person_params)
    @phone_number = @person.phone_numbers.build(phone_number_params) unless @phone_number.blank?
    @email = @person.emails.build(email_params) unless @email.blank?
    if @person.save
      flash[:success] = "New contact created successfully."
      redirect_to root_path
    else
      # Errors handled by error_messages.html.erb partial
      render 'new'
    end
  end

  def edit

  end

  def update
    if @person.update_attributes(person_params)
      flash[:success] = "Contact updated successfully."
      redirect_to @person
    else
      # Errors handled by error_messages.html.erb partial
      render 'edit'
    end

  end

  def destroy
    @person.destroy
    flash[:success] = "#{@person.first_name} #{@person.last_name} deleted."
    redirect_to root_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

  def phone_number_params
    params.require(:phone_numbers).permit(:number)
  end

  def email_params
    params.require(:emails).permit(:email)
  end

  # Before action

  def correct_user
    @person = Person.find(params[:id])
    unless current_user.id == @person.user_id
      flash[:danger] = "#{@person.fist_name} doesn't belong to you"
      redirect_to root_path
    end
  end

  def find_person
    @person = Person.find(params[:id])
  end

end
