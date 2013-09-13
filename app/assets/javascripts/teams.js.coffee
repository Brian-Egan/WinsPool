# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




$(document).delegate ".testJSBtn", "click", ->
	# teamNum = $(this).data('userid');
	# alert teamNum
	# subMit = {utf: "✓", userID: teamNum}
	$.get('/testJS', null, null, 'script')