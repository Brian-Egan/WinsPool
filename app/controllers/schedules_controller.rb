class SchedulesController < ApplicationController
  include UsersHelper
  include SchedulesHelper
  # before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    if params[:weekNumber]
      if params[:weekNumber] == "All"
        @schedules = Schedule.all.order("date ASC")
      else
        @wkNum = params[:weekNumber]
        @schedules = Schedule.where(:week => @wkNum).order("date ASC")
      end
    else
      @schedules = Schedule.all.order("date ASC")
    end
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

  def NFLTeamSched
    if params[:teamID]
      @teamID = params[:teamID]
      @gms = Schedule.where(:home_id => @teamID) + Schedule.where(:visitor_id => @teamID)
      @games = @gms.sort_by{|g| g[:date]}
      @games.each do |g|
        puts g.date
      end
      @team = Team.find(@teamID)
    end

    respond_to do |format|
      format.js
    end


  end

  def NFLStandings

    @teams = Team.all.order('wins DESC')
    @updatedAt = Schedule.maximum('updated_at')

    respond_to do |format|
      format.html
      format.json
    end

  end


  def score
    @game = Schedule.find(params[:gameID])
    @game.visitor_score = params[:vTeamScore]
    @game.home_score = params[:hTeamScore]
    @vScore = params[:vTeamScore].to_i
    @hScore = params[:hTeamScore].to_i
    @hTeam = Team.find(params[:hTeamID])
    @vTeam = Team.find(params[:vTeamID])

    if params[:winner] == "tbd"
      if @vScore > @hScore
        @game.winning_team_id = params[:vTeamID]
        SetTeamRecords(params[:vTeamID], params[:hTeamID])
      elsif @hScore > @vScore
        @game.winning_team_id = params[:hTeamID]
        SetTeamRecords(params[:hTeamID], params[:vTeamID])
      elsif @hScore == @vScore
        @game.winning_team_id = nil
        @tie = true
        SetTeamTies(params[:hTeamID], params[:vTeamID])
      end

      @game.save


      puts "================Saving new game================"

    elsif params[:winner] == "home"
      if @vScore > @hScore
        @game.winning_team_id = params[:vTeamID]
        AdjustTeamRecords(params[:hTeamID], params[:vTeamID])
        SetTeamRecords(params[:vTeamID], params[:hTeamID])
      elsif @hScore > @vScore
        @game.save
      elsif @hScore == @vScore
        @game.winning_team_id = nil
        @tie = true
        SetTeamTies(params[:hTeamID], params[:vTeamID])
      end

      @game.save

      puts "========Editing Old Game (Old winner was home) ================"
    
    elsif params[:winner] == "visitor"
      if @hScore > @vScore
        @game.winning_team_id = params[:hTeamID]
        AdjustTeamRecords(params[:vTeamID], params[:hTeamID])
        SetTeamRecords(params[:hTeamID], params[:vTeamID])
      elsif @vScore > @hScore
        @game.save
      elsif @hScore == @vScore
        @game.winning_team_id = nil
        @tie = true
        SetTeamTies(params[:vTeamID], params[:hTeamID])
      end
  
      @game.save

       puts "========Editing Old Game (Old winner was VISITOR) ================"

    end


    if @hTeam.taken == true
      @hUser = @hTeam.user
      UpdateUserWLT(@hUser)
      UpdateWLT(@hUser)
    end

    if @vTeam.taken == true
      @vUser = @vTeam.user
      UpdateUserWLT(@vUser)
      UpdateWLT(@vUser)
    end

    
    

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
