class EmailsController < ApplicationController

  def new
    @person = Person.find_by(id: params[:person])
    @email = Email.new
  end

  def create
    @person = Person.find_by(id: params[:email][:user_id])
    @email = @person.emails.build(email_params)
    if @email.save
      flash[:success] = "New email number added."
      redirect_to @person
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find_by(id: params[:person])
    @email = Email.find(params[:id])
  end

  def update
    @person = Person.find_by(id: params[:email][:user_id])
    @email = Email.find(params[:id])
    if @email.update_attributes(email_params)
      flash[:success] = "Email number updated."
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find_by(id: params[:person])
    Email.find(params[:id]).destroy
    flash[:success] = "Email number deleted."
    redirect_to request.env["HTTP_REFERER"]
  end

  private

  def email_params
      params.require(:email).permit(:email)
  end
end
