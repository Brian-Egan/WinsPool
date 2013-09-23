console.log "in the new js"
divID = "#GameRow" + <%= @schedule.id %>
console.log divID
# $('#GameRow14').css({ opacity: 0.5 });
$(divID).html("<%= j render :partial => 'shared/gameRow', :locals => {:s => @schedule } %>")
$(divID).fadeIn('slow')