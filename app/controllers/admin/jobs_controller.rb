class Admin::JobsController < ApplicationController
  class Admin::JobsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_action :require_is_admin
    layout "admin"


    def show
      @job = Job.find(params[:id])
    end

    def index
      @jobs = Job.all
      @jobs = current_user.jobs.all
    end

    def new
      @job = Job.new
      @workplaces = Workplace.all.map { |c| [c.name, c.id] } #这一行为加入的代码
    end

    def create
      @job = Job.new(job_params)
      @job.workplace_id = params[:workplace_id]
      @job.user = current_user

      if @job.save
        redirect_to admin_jobs_path
      else
        render :new
      end
    end

    def edit
      @job = Job.find(params[:id])
      @job.workplace_id = params[:workplace_id]
      @workplaces = Workplace.all.map { |c| [c.name, c.id] } #这一行为加入的代码
    end

    def update
      @job = Job.find(params[:id])
      @job.workplace_id = params[:workplace_id]

      if @job.update(job_params)
        redirect_to admin_jobs_path
      else
        render :edit
      end
    end

    def destroy
      @job = Job.find(params[:id])

      @job.destroy

      redirect_to admin_jobs_path
    end

    def publish
      @job = Job.find(params[:id])
      @job.publish!
      redirect_to :back
    end

    def hide
      @job = Job.find(params[:id])
      @job.hide!
      redirect_to :back
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :workplace_id, :company, :address, :phone, :source)
    end
  end
end
