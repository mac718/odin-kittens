class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @kittens }
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @kitten }
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save 
      flash[:success] = "Kitten saved!"
      redirect_to kittens_path
    else
      flash.now[:danger] = "Could not save this kitten to the database."
      render :new
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.save
      flash[:succes] = "Kittin info updated!"
      redirect_to root_url
    else
      flash.now[:danger] = "Could not update kitten info."
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:success] = "Kitten deleted from datebase."
    redirect_to '/kittens'
  end

  private 
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
