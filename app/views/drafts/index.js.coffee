# console.log("hey man active")
$('#draftHeader').html("<%= j render :partial => 'shared/draftHeader' %>")
$('#playersAvail').html("<%= j render :partial => 'shared/teamsAvailable' %>")
$('.wklyPoints').hide()
$('#DraftSummary').html("<%= j render :partial => 'shared/draftSummary' %>")
$('#draftHeader').fadeIn('fast')

# $('#DraftSuccessModal').html("<%= j render :partial => 'shared/draftSuccessModal', :locals => {:t => @lastPicked, :u => @userName} %>")
# $('#DraftSuccessModal').modal('toggle')