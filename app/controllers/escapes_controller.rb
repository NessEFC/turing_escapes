class EscapesController < ApplicationController

  def index
    @escapes = Escape.all
  end

  def show
    @escape = Escape.find(params[:id])
  end
end
