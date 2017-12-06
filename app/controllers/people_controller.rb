class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

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
end
