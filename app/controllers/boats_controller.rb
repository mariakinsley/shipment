class BoatsController < ApplicationController
  def index
    @boats = Boat.all
   end

   def new
     @boat = Boat.new
     @message = "my new boat"
   end

   def create

     @boat = Boat.new(boat_params)
     if @boat.save
       respond_to do |format|
         format.js
         format.html
       end
       redirect_to boat_path(@boat)
     else
       render 'new'
     end
end
def edit
  @boat=Boat.find(params[:id])
end
def show
@boat =Boat.find(params[:id])
end



def update
  @boat = Boat.find(params[:id])
  if @boat.update(boat_params)
    redirect_to boat_path(@boat)
  else
    render 'edit'
  end
end

def destroy
  @boat =Boat.find(params[:id])
  @boat.destroy
  redirect_to '/boats'
end


private
def boat_params
params.require(:boat).permit(:name,:containers,:location)
end
end
