# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).delegate "#SignUpTab", "click", ->
	console.log "session js file click"
	$(this).addClass("active")
	$.get('/signup', null, null, "script")

$(document).delegate "#SignInTab", "click", ->
	console.log "session js file click"
	$(this).addClass("active")
	$.get('/login', null, null, "script")

	# subMit = {utf: "✓", tab: SignIn}

	# teamName = $(this).data('name');
	# $('#draftHeader').fadeOut('fast')
	# roundNumber = $('#roundNum').text();
	# pickNumber = $('#pickNum').text();
	# userNum = $('#teamPicking').data('tid');
	# $(this).fadeOut('fast');
	# subMit = {utf: "✓", name: teamName, round: roundNumber, pick: pickNumber, userID: userNum}
	# $.post('/drafts', subMit, null, "script")