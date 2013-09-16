console.log "I'm here from the Schedule controller!"
modal = $('#NFLTeamModal')
# console.log modal
modal.html("<%= j render partial: 'shared/nflTeamSched', :locals => {:games => @games, :t => @team} %>")
modal.modal('toggle')