class WelcomeController < ApplicationController
  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result.published
    @bj = Job.where(workplace_id:'1').order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5)
    @sz = Job.where(workplace_id:'3').order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5)
    @sh = Job.where(workplace_id:'4').order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5)
    @hz = Job.where(workplace_id:'2').order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5)
  end
end
