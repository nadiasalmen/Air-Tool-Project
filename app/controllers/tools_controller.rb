class ToolsController < ApplicationController

  def index
    @tools = Tool.all
    @user = current_user
    @tool_geo = Tool.where.not(latitude: nil, longitude: nil)

    @markers = @tool_geo.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { tool: tool })
      }
    end
  end

  def my_tools
    @tools = Tool.where(user: current_user)
  end

  def show
    @tool = Tool.find(params[:id])
    @review = Review.new
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.status = true
    @tool.rating = 0
    if @tool.save!
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :category, :status, :price)
  end
end
