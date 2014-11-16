class WindowsController < ApplicationController
  before_action :set_window, only: [:show, :edit, :update, :destroy]

  # GET /windows
  # GET /windows.json
  def index
    @windows = Window.all
  end

  # GET /windows/1
  # GET /windows/1.json
  def show
  end

  # GET /windows/new
  def new
    @window = Window.new
  end

  # GET /windows/1/edit
  def edit
  end

  # POST /windows
  # POST /windows.json
  def create
    @window = Window.new(window_params)

    if @window.save
      redirect_to @window, notice: 'Window was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /windows/1
  # PATCH/PUT /windows/1.json
  def update
    if @window.update(window_params)
      redirect_to @window, notice: 'Window was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /windows/1
  # DELETE /windows/1.json
  def destroy
    @window.destroy
    redirect_to windows_url, notice: 'Window was successfully destroyed.'
  end

  
  # POST /windows/:ID
  # How clunky is this DB success check? There's got to be a DRYer way to do this.
  def assign_user
    if !Window.find(params[:id]).filled_up && Window.find(params[:id]).get_slot.update_attributes(user_id: current_user.id)
      redirect_to events_url, notice: 'You got yourself a slot.'
    else
      redirect_to events_url, notice: 'You done fucked up.'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_window
      @window = Window.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def window_params
      params.require(:window).permit(:event_id, :start_time, :duration, :capacity)
    end

end








