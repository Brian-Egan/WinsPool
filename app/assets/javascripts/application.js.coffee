# // This is a manifest file that'll be compiled into application.js, which will include all the files
# // listed below.
# //
# // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# //
# // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# // compiled file.
# //
# // Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# // about supported directives.
# //
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require fastclick
#= require turbolinks
#= require_tree .





# // $(document).ready(function() {
 
# //   $('.draftSummaryTable').each(function() {
# //     var $table = $(this);
 
# //     var $button = $("<button type='button' class='btn btn-success btn-sm'>");
# //     $button.text("Export to spreadsheet");
# //     $button.insertAfter($table);
 
# //     $button.click(function() {
# //       var csv = $table.table2CSV({delivery:'value'});
# //       window.location.href = 'data:text/csv;charset=UTF-8,'
# //                             + encodeURIComponent(csv);
# //     });
# //   });
# // })


# // var glow = $('.glow_text_green');
# // setInterval(function(){
# //     glow.toggleClass('glow');
# // }, 1000);

$ ->
  new FastClick(document.body)

document.addEventListener "page:fetch", console.log("yo dog, page fetching!")
document.addEventListener "page:receive", console.log("yo dog, page RECIEVING!")
document.addEventListener "page:change", console.log("yo dog, page CHANGED MOFO!")



# // $("*[data-spinner]").click('ajax:beforeSend', function(e){
# //   console.log("yo dog, data spinners been clicked!")
# // });
