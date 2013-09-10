class SchedulesController < ApplicationController
  # before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all.order("date ASC").all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    # respond_to do |format|
    #   if @schedule.save
    #     format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @schedule }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @schedule.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    # respond_to do |format|
    #   if @schedule.update(schedule_params)
    #     format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @schedule.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  def score
    @game = Schedule.find(params[:gameID])
    @game.visitor_score = params[:vTeamScore]
    @game.home_score = params[:hTeamScore]
    @vScore = params[:vTeamScore].to_i
    @hScore = params[:hTeamScore].to_i

    if @vScore > @hScore
      @game.winning_team_id = params[:vTeamID]
      @wTeam = Team.find(params[:vTeamID])
      @lTeam = Team.find(params[:hTeamID])
    elsif @hScore > @vScore
      @game.winning_team_id = params[:hTeamID]
      @wTeam = Team.find(params[:hTeamID])
      @lTeam = Team.find(params[:vTeamID])
    elsif @hScore == @vScore
      @game.winning_team_id = nil
      @tie = true
      @wTeam = Team.find(params[:hTeamID])
      @lTeam = Team.find(params[:vTeamID])
    end

    if @tie == true
      @wTeam.ties += 1
      @lTeam.ties += 1
    else
      @wTeam.wins += 1
      @lTeam.losses += 1
    end

    @game.save
    @wTeam.save
    @lTeam.save

    @schedules = Schedule.all
    @schedule = @game

    respond_to do |format|
      format.js
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_schedule
    #   @schedule = Schedule.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def schedule_params
    #   params.require(:schedule).permit(:week, :date, :visitor_id, :home_id, :visitor_score, :home_score, :winning_team_id)
    # end
end
