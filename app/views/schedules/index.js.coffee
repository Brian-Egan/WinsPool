console.log "in the controller JS"
theGames = $('#gamesTable')
theGames.fadeOut('fast')
theGames.hide()
theGames.html("<%= j render :partial => 'shared/gamesRow', :locals => {:schedules => @schedules} %>")
theGames.fadeIn('slow')
