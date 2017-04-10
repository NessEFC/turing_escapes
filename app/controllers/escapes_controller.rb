class EscapesController < ApplicationController

  def index
    @escapes = Escape.all
  end

end
