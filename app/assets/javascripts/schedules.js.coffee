# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).delegate ".saveGame", "click", ->
  $(this).addClass('disabled')
  $(this).text('Saving...')
  gameNum = $(this).data('sid');
  winningTeam = $(this).data('winner');
  vTeam = $(this).data('vteam');
  hTeam = $(this).data('hteam');
  vInputID = "#vTeam" + gameNum
  hInputID = "#hTeam" + gameNum
  vScore = $(vInputID).val()
  hScore = $(hInputID).val()
  subMit = {utf: "✓", id: gameNum, vTeamID: vTeam, vTeamScore: vScore, hTeamID: hTeam, hTeamScore: hScore, gameID: gameNum, winner: winningTeam }
  $.get('/schedule/updateScore', subMit, null, "script")

 $(document).delegate ".editGame", "click", ->
  $(this).removeClass('editGame')
  $(this).addClass('saveGame')
  $(this).addClass('btn-success')
  $(this).text('Save')
  gameNum = $(this).data('sid'); 
  hScoreInput = "#Game" + gameNum + "HScore"
  vScoreInput = "#Game" + gameNum + "VScore"
  $(hScoreInput).empty()
  $(vScoreInput).empty()
  hTeam = "hTeam" + gameNum
  vTeam = "vTeam" + gameNum
  $(hScoreInput).html("<input class='form-control' id=" + hTeam + "></input>")
  $(vScoreInput).html("<input class='form-control' id=" + vTeam + "></input>")

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

