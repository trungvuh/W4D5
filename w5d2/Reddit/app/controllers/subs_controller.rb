class SubsController < ApplicationController

  before_action :require_login
  
  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ["Can't edit this sub"]
      render :edit
    end
  end

  def destroy
    @sub = current_user.subs.find_by(id: params[:id])
    @sub.destroy!
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
