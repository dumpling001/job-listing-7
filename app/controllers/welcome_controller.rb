class WelcomeController < ApplicationController
  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result.where(is_hidden: false)
    # @bj = Job.where(workplace_id:'1') local
    # @sz = Job.where(workplace_id:'2') local
    # @sh = Job.where(workplace_id:'3') local
    # @hz = Job.where(workplace_id:'4') local
    @bj = Job.where(workplace_id:'1')
    @sz = Job.where(workplace_id:'3')
    @sh = Job.where(workplace_id:'4')
    @hz = Job.where(workplace_id:'2')
  end
end
