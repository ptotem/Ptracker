class GuidelinesController < ApplicationController
  # GET /guidelines
  # GET /guidelines.json
  def index
    @guidelines = Guideline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
  end

end
