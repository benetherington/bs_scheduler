class TimeslotsController < ApplicationController
  before_action :set_timeslot, only: [:show, :edit, :update, :destroy]

  # GET /timeslots
  # GET /timeslots.json
  def index
    @timeslots = Timeslot.all
  end

  # GET /timeslots/1
  # GET /timeslots/1.json
  def show
  end

  # GET /timeslots/new
  def new
    @timeslot = Timeslot.new
  end

  # GET /timeslots/1/edit
  def edit
  end

  # POST /timeslots
  # POST /timeslots.json
  def create
    @timeslot = Timeslot.new(timeslot_params)

    if @timeslot.save
      redirect_to @timeslot, notice: 'Timeslot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timeslots/1
  # PATCH/PUT /timeslots/1.json
  def update
    if @timeslot.update(timeslot_params)
      redirect_to @timeslot, notice: 'Timeslot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timeslots/1
  # DELETE /timeslots/1.json
  def destroy
    @timeslot.destroy
    redirect_to timeslots_url, notice: 'Timeslot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeslot_params
      params.require(:timeslot).permit(:window_id, :user_id)
    end

end










