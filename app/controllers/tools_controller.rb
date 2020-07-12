class ToolsController < ApplicationController

before_action :find_cocktail, only: [:show]

def index
  @tools = Tool.all
end

def show; end

private

	def find_cocktail
	  @cocktail = Cocktail.find(params[:id])
	end

end
