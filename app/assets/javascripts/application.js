// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require rails-timeago
//= require rails-timeago-all
//= require turbolinks
//= require_tree .

var do_on_load = function() { 
  $(".groups a").popover({
    placement: 'left',
    trigger: 'hover'
  });
}
$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
