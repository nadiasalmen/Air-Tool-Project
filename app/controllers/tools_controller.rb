class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :new]

  def index
    @tools = policy_scope(Tool)
    @user = current_user
    @tool_geo = policy_scope(Tool).where.not(latitude: nil, longitude: nil)

    if params[:term].present?
      @tools = policy_scope(Tool).search_by_name(params[:term])
    else
      if params[:search]
        @filter = params[:search][:category]
        @tools = @filter.empty? ?  @tools = policy_scope(Tool).all : policy_scope(Tool).where(category: @filter)
      else
         @tools = policy_scope(Tool).all
      end
    end

    @markers = @tool_geo.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { tool: tool })
      }
    end
  end

  def my_tools
    @tools = policy_scope(Tool).where(user: current_user)
  end

  def show
    @tool = policy_scope(Tool).find(params[:id])
    @review = policy_scope(Review).new
    skip_authorization
  end

  def new
    @tool = policy_scope(Tool).new
    authorize @tool
  end

  def create
    @tool = policy_scope(Tool).new(tool_params)
    @tool.user = current_user
    @tool.status = true
    @tool.rating = 0
    authorize @tool
    if @tool.save!
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def edit
    @tool = policy_scope(Tool).find(params[:id])
    authorize @tool
  end

  def update
    @tool = policy_scope(Tool).find(params[:id])
    authorize @tool
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = policy_scope(Tool).find(params[:id])
    authorize @tool
    @tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :description, :category, :status, :price, :adress, :photo)
  end
end
