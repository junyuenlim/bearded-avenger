// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.turbolinks
//= require masonry/jquery.masonry
//= require bootstrap-wysihtml5/b3
//= require bootstrap
//= require projects

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=478161788942376";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(".alert").alert()


$(document).ready(function(){
        $('.wysihtml5').each(function(i, elem) {
          $(elem).wysihtml5();
        });
})

$(document).ready(function () {
  $("div[id^='flash-message']").fadeOut(3000);
});


$("#tooltip span").tooltip()
$("#followers a").tooltip()
$("#comment a").tooltip()
$("#project .panel-heading a").tooltip()
$("#avatar a").tooltip()