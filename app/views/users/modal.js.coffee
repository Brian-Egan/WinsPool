console.log "I'm here from the USER controller!"
modal = $('#myModal')
modal.html("<%= j render partial: 'shared/teamModal', :locals => {:u => @user} %>")
modal.modal('toggle')