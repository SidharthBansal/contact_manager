class EmailsController < ApplicationController
  before_action :find_person

  def new
    @person = Person.find(params[:person_id])
    @email = Email.new
  end

  def create
    @email = @person.emails.build(email_params)
    if @email.save
      flash[:success] = "New email number added."
      redirect_to @person
    else
      render 'new'
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update_attributes(email_params)
      flash[:success] = "Email number updated."
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    Email.find(params[:id]).destroy
    flash[:success] = "Email number deleted."
    redirect_to @person
  end

  private

  def email_params
      params.require(:email).permit(:email)
  end

  def find_person
    @person = Person.find(params[:person_id])
  end
end
