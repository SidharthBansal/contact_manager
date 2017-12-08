class PhoneNumbersController < ApplicationController


  def new
    @person = Person.find(params[:person_id])
    @phone_number = PhoneNumber.new
  end

  def create
    @person = Person.find(params[:person_id])
    @phone_number = @person.phone_numbers.build(phone_params)
    if @phone_number.save
      flash[:success] = "New phone number added."
      redirect_to @person
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @phone_number = PhoneNumber.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id])
    @phone_number = PhoneNumber.find(params[:id])
    if @phone_number.update_attributes(phone_params)
      flash[:success] = "Phone number updated."
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find_by(id: params[:person])
    PhoneNumber.find(params[:id]).destroy
    flash[:success] = "Phone number deleted."
    redirect_to request.env["HTTP_REFERER"]
  end

  private

  def phone_params
      params.require(:phone_number).permit(:number)
  end
end
