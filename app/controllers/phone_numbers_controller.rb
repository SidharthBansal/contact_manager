class PhoneNumbersController < ApplicationController


  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.new(phone_params)
    if @phone_number.save
      flash[:success] = "New phone number added."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update
    @phone_number = PhoneNumber.find(params[:id])
    if @phone_number.update_attributes(phone_params)
      flash[:success] = "Phone number updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def delete
  end

  private

  def phone_params
      params.require(:phone_number).permit(:number)
  end
end
