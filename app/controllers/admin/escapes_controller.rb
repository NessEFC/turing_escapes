class Admin::EscapesController < Admin::BaseController
  before_action :set_escape, only: [:edit, :update]

  def index
    @escapes = Escape.all
  end

  def new
    @escape = Escape.new
  end

  def create
    @escape = Escape.new(escape_params)
    if params[:escape][:category_ids].nil?
      flash[:notice] = "You must select at least one category"
      render :new
    else
      if @escape.save
        params[:escape][:category_ids].each do |category_id|
          @escape.escape_categories.create(category_id: category_id)
        end
        flash[:success] = "Nice package!"
        redirect_to admin_escapes_path
      else
        flash[:failure] = "Nopes. You're not very good at this."
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @escape.update(escape_params)
      @escape.update_status(params[:escape][:status])
      flash[:success] = "Successfully updated escape"
      redirect_to admin_escapes_path
    else
      render :edit
    end
  end

private

  def set_escape
    @escape = Escape.find(params[:id])
  end

  def escape_params
    params.require(:escape).permit(:name, :city, :description, :price, :photo)
  end

end
