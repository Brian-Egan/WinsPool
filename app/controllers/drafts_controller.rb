class DraftsController < ApplicationController
  before_action :set_draft, only: [:show, :edit, :update, :destroy]

  # GET /drafts
  # GET /drafts.json
  def index
    @drafts = Draft.all


    #===== How many people????=====
    # @drafters = 2
    @drafters = User.count
    #=====
    @tms = "teams_" + @drafters.to_s

      if Draft.count > 0
        if Draft.maximum("round") > 1
          @roundNum = Draft.maximum("round")
        else
          @roundNum = 1
        end

        @lastPick = Draft.find(Draft.maximum("id"))
        @lastPicked = Team.find(@lastPick.team_id)

    # @thisPick = Draft.find(Draft.maximum("id")) + 1

  #===== Change below for number of players!=====
     if (@lastPick.pick.to_f/@drafters.to_f) % 1 == 0
      @roundNum = @roundNum += 1
      @pickNum = 1
    else
      @pickNum = @lastPick.pick + 1
    end

        @lpickNum = @lastPick.pick
        puts "============================="
        puts "Round #{@roundNum}"
        puts "Last Pick Number: #{@lpickNum}"
        puts "This Pick Number: #{@pickNum}"
        puts "Looking for user with ID: #{}"
        puts "Draft count is: #{Draft.count}"
        # @lastPick
        puts "============================="

  #===== Change below for number of players!=====
        # if @lastPick.pick == 12
        #   @teamID = @lastPick.team_id
        # elsif (@roundNum.odd? && @lastPick.pick != 12)
        #   @teamID = (@lastPick.team_id + 1)
        # elsif (@roundNum.odd? && @lastPick.pick == 12)
        #   @teamID = (@lastPick.team_id - 1)
        # elsif (@roundNum.even? && @lastPick.pick != 12)
        #   @teamID = (@lastPick.team_id - 1)
        # else
        #   @teamID = (@lastPick.team_id - 1)
        # end

      if Rails.env.production?
        if Draft.count >= (32 - PickOrder.where(@tms => nil).count)
          @upNext = 1
          @dn = Draft.count + 1
          @upNext = 1
          @usr = User.find(2)
          @userID = @usr.id
          @draftOver = true
        else
          @upNext = PickOrder.find(@pickNum)[@tms]
          @dn = Draft.count + 1
          @upNext = PickOrder.find(@dn)[@tms]
          @usr = User.where(:draft_order => @upNext).take
          @userID = @usr.id
        end
      else 
        if Draft.count >= PickOrder.where(@tms).count
          @upNext = 1
          @dn = Draft.count + 1
          @upNext = 1
          @usr = User.find(2)
          @userID = @usr.id
          @draftOver = true
        else
          @upNext = PickOrder.find(@pickNum)[@tms]
          @dn = Draft.count + 1
          @upNext = PickOrder.find(@dn)[@tms]
          @usr = User.where(:draft_order => @upNext).take
          @userID = @usr.id
        end
      end

  #===== Change below for number of players!=====
        if @userID > 12
            @userID = @userID - 1
          end
        if User.find(@userID)
          @userName = User.find(@userID)
        else
          @userID = @userID - 1
          @userName = User.find(@userID)
        end

        puts @userName

        @currentRound = Draft.where(round: @roundNum).count

    else

      @userName = User.where(:draft_order => 1).take
      @userID = @userName.id



      @roundNum = 1
      @pickNum = 1
      @teamID = 1
      @teamName = Team.find(@teamID)
      @currentRound = 1
  end

  #===== Should be able to remove this! =======
    if params[:page]
      @col1page = params[:page].to_i
    else
      @col1page = 1
    end
#===== 


    @teams = Team.avail
    @perPage = (Team.avail.count.to_f/4).ceil

    @teams1 = @teams.paginate(:page => 1, :per_page => @perPage)
    @teams2 = @teams.paginate(:page => 2, :per_page => @perPage)
    @teams3 = @teams.paginate(:page => 3, :per_page => @perPage)
    @teams4 = @teams.paginate(:page => 4, :per_page => @perPage)

    @users = User.all.order("draft_order DESC").all

    @usersList = User.all.order("draft_order ASC").all

    # if @auth_user
    #   if Draft.count > 0 && @auth_user.id == @usr.id
    #     UserMailer.draft_notification(@usr).deliver
    #   end
    # end
    
     respond_to do |format|

          format.html
          format.js
          # format.csv { render text: @drafts.to_csv  }
          # format.csv { send_data text: @drafts.to_csv  }
          # format.xls # { send_data @drafts.to_csv(col_sep: "\t")  }
    end

  end

  # GET /drafts/1
  # GET /drafts/1.json
  def show
  end

  # GET /drafts/new
  def new
    @draft = Draft.new
  end

  # GET /drafts/1/edit
  def edit
  end

  # POST /drafts
  # POST /drafts.json
  def create
    @overall = Draft.count + 1

      @team = Team.where(city_abr: params[:name]).take
      @teamID = @team.id
      @team.taken = true
      @team.save

    @draft = Draft.new(:round => params[:round], :pick => params[:pick], :overall_pick => @overall, :user_id => params[:userID], :team_id => @teamID)

    @draft.save



    respond_to do |format|
      format.js { redirect_to drafts_path}
    end
  end

  # PATCH/PUT /drafts/1
  # PATCH/PUT /drafts/1.json
  def update
    respond_to do |format|
      if @draft.update(draft_params)
        format.html { redirect_to @draft, notice: 'Draft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @draft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drafts/1
  # DELETE /drafts/1.json
  def destroy
    @draft.destroy
    respond_to do |format|
      format.html { redirect_to drafts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft
      @draft = Draft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draft_params
      params.require(:draft).permit(:round, :pick, :user_id, :team_id)
    end
end
