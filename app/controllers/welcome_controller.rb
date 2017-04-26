class WelcomeController < ApplicationController
  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result.published
    # @bj = Job.where(workplace_id:'1') local
    # @sz = Job.where(workplace_id:'2') local
    # @sh = Job.where(workplace_id:'3') local
    # @hz = Job.where(workplace_id:'4') local
    @bj = Job.where(workplace_id:'1').order('wage_lower_bound DESC')
    @sz = Job.where(workplace_id:'3').order('wage_lower_bound DESC')
    @sh = Job.where(workplace_id:'4').order('wage_lower_bound DESC')
    @hz = Job.where(workplace_id:'2').order('wage_lower_bound DESC')
  end
end
