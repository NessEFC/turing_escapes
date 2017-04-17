class Admin::EscapesController < Admin::BaseController

  def index
    @escapes = Escape.all
  end

  def new
    @escape = Escape.new
  end

  def create
    @escape = Escape.new(escape_params)
    if @escape.save
      flash[:success] = "Nice package!"
      redirect_to admin_escapes_path
    else
      flash[:failure] = "Nopes. You're not very good at this."
      render :new
    end
  end

private

  def escape_params
    params.require(:escape).permit(:name, :city, :description, :price, :image, :category_id)
  end

end
