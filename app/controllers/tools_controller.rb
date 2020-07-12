class ToolsController < ApplicationController

before_action :find_tool, only: [:show]

def index
  @tools = Tool.all
end

def show; end

private

	def find_tool
	  @tool = Tool.find(params[:id])
	end

end
