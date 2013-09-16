# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).delegate ".saveGame", "click", ->
  $(this).addClass('disabled')
  $(this).text('Saving...')
  gameNum = $(this).data('sid');
  vTeam = $(this).data('vteam');
  hTeam = $(this).data('hteam');
  # alert "Game number: " + gameNum
  vInputID = "#vTeam" + gameNum
  hInputID = "#hTeam" + gameNum
  vScore = $(vInputID).val()
  hScore = $(hInputID).val()
  console.log "Visitor: " + vScore + " || Home: " + hScore
  subMit = {utf: "✓", id: gameNum, vTeamID: vTeam, vTeamScore: vScore, hTeamID: hTeam, hTeamScore: hScore, gameID: gameNum}
  $.get('/schedule/updateScore', subMit, null, "script")


$(document).delegate ".wkBtn", "click", ->
  WeekNum = $(this).data('wk');
  $('.wkBtn').removeClass('active')
  $(this).addClass('active')
  subMit = {utf: "✓", weekNumber: WeekNum}
  $.get('/schedules', subMit, null, 'script')


$(document).delegate ".NFLTeamSched", "click", ->
  teamNum = $(this).data('teamid');
  # alert teamNum
  subMit = {utf: "✓", teamID: teamNum}
  $.get('/NFLTeamSched', subMit, null, 'script')
