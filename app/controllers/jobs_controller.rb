
class JobsController < ApplicationController
def index
  @jobs=Job.all
end

def new
  @job = Job.new

end

def create

  @job = Job.new (job_params)
  if @job.save
    redirect_to job_path(@job)
  else
    render 'new'
  end
end
def edit
  @job=Job.find(params[:id])
  @boats = Boat.find(@job.boat_ids)
end

def update
  @job = Job.find(params[:id])
  if @job.update(job_params)
    redirect_to job_path(@job)
  else
    render 'edit'
  end
end

  def show
   @job = Job.find(params[:id])
     @boats = Boat.find(@job.boat_ids)
  end
private
def job_params
    params.require(:job).permit(:description,:origin,:destination,:cost,:container_count, boat_ids:[])
  end
end
