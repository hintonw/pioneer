class TrailsController < ApplicationController
  
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def index
    @trail = Trail.all.order('created_at DESC')
  end

  def index
    @trail = Trail.all

    respond_to do |format|
      format.html
      format.json { render :json => @trail.to_json }
    end
  end


  def new
    @trail = current_user.trails.build
  end

  def create
    @trail = current_user.trails.build(trail_params)
    
    respond_to do |format|
      if @trail.save
        format.html { redirect_to @trail, notice: "Trail was sucessfully created." }
        format.json { render :show, status: :created, location: @trail }
        if current_user
          @trail.user << current_user
        end
      else 
        format.html { render :new }
        format.json { render json: @trail.errors, status: :unpocessable_entity }
      end
    end
  end

  def create_api
    @user = User.find(params[:id])
    @trail = Trail.create(:trail_name => params[:trail_name], :trail_info => params[:trail_info], :lat_lon => params[:lat_lon])
    @trail.user << @user
    render :json => @trail
  end

  def show
    @trail = Trail.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @trail.to_json }
    end
  end

  def show_api
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @user.trails.to_json }
    end
  end

  private
    def trail_params
      params.require(:trail).permit(:trail_name, :trail_info, :id, :lat_lon)
    end
end
