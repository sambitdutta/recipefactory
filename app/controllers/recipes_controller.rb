class RecipesController < ApplicationController
  def index
    params[:page] ||= 1
    render json: Contentful::Entries.new.fetch({ content_type: 'recipe', skip: (params[:page] - 1) * 100 })
  end
end
