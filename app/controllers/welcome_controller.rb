class WelcomeController < ApplicationController
  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result.where(is_hidden: false)
  end
end
