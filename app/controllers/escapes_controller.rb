class EscapesController < ApplicationController

  def index
    @escapes = Escape.all.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @escape = Escape.find(params[:id])
  end
end
