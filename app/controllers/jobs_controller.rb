class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :validate_search_key, only: [:search]
  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result.where(is_hidden: false)

    if params[:workplace].blank?
      @jobs = Job.published.recent
    else
      @workplace_id = Workplace.find_by(name: params[:workplace]).id
      @jobs = Job.where(:workplace_id => @workplace_id).recent
    end
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      redirect_to root_path
    end
  end

  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 5)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

end
