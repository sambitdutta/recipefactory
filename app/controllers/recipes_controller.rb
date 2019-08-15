class RecipesController < ApplicationController
  def index
    response = File.read(Rails.root.join('spec', 'dummy', 'sample_response.json'))
    render json: JSON.parse(response)
  end
end
