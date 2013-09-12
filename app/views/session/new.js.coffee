$('.newSessionBox').show();
$('.newUserBox').hide();
$('.newSessionBox').empty();
$('.newSessionBox').html("<%= j render 'shared/newSession' %>");
$('#SignInTab').addClass('active')
$('#SignUpTab').removeClass('active')
console.log "session js"
