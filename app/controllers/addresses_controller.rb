class AddressesController < ApplicationController
  before_action :find_person
  before_action :logged_in_user

  def new
    @address = Address.new
  end

  def create
    @address = @person.addresses.build(address_params)
    if @address.save
      message = "Address was successfully added to "
      message += "#{@person.first_name} #{@person.last_name}"
      flash[:success] =  message
      redirect_to @person
    else
      render 'new'
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      flash[:success] = "Address was updated."
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    flash[:success] = "Address was removed succesfully"
    redirect_to @person
  end

  private

    def address_params
      params.require(:address).permit(:address, :city, :state, :postcode, :country)
    end

    # Before action

    def find_person
      @person = Person.find(params[:person_id])
    end

end
