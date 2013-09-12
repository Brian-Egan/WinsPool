$('.newUserBox').empty();
$('.newUserBox').show();
$('.newSessionBox').hide();
$('.newUserBox').html("<%= j render 'shared/newUserTwo' %>");
$('#SignUpTab').addClass('active')
$('#SignInTab').removeClass('active')
console.log "user js"