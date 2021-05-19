class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    # check rails routes
    # pets#show requires :id params
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    # param returns ActionController::Parameters object
    # represents the fields coming in from the forms
    # :pet --> has attributes that we are interested in
    # due to built-in security features of rails, you must specify which param to permit
    # and they are name, age and description in this case
    @pet = Pet.new(params.require(:pet).permit(:name, :age, :description))
    if @pet.save
      # redict to the pets#show
      # same as rediect_to pet_path(@pet)
      redirect_to @pet
    else
      # return the user back to the creation form.
      render 'new'
    end
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(params.require(:pet).permit(:name, :age, :description))
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to pets_path
  end
end
