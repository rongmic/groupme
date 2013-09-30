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
//= require jquery.timeago
//= require jquery.timeago-settings
//= require turbolinks
//= require_tree .

var do_on_load = function() { 
  $(".groups a").popover({
    placement: 'left',
    trigger: 'hover'
  });
  $(".member-list img").tooltip();
  $("abbr.timeago").timeago();

  $("#new_topic").submit(function(){
    if($("#topic_content").val() == "") {
      $(this).parent().addClass('has-error');
      return false;
    }
  });

  $(".topic-reply a").click(function(){
    var psconsole = $(".topics");
    psconsole.scrollTop(
        psconsole[0].scrollHeight - psconsole.height()
    );
  });

  $("#new_group").submit(function(){
    $title = $("#group_title");
    $category = $("#group_category_id");
    if(!$title.val().length > 0){
      $title.parent().addClass('has-error');
      return false;
    }else{
      $title.parent().removeClass('has-error');
    }

    if($category.val() == "") {
      $category.parent().addClass('has-error');
      return false;
    }else{
      $category.parent().removeClass('has-error');
    }
  });

  $("#new_comment").on("ajax:success", function(e, data, status, xhr){
    $(this).closest('.topic').find('.comment-list').append($(data).hide().fadeIn());
    count = $(this).closest('.topic').find('.reply').data('count');
    $(this).closest('.topic').find('.reply').data('count', count+1);
    $(this).closest('.topic').find('.comments-count').text(count+1);
    $(this).find("textarea").val("");
    $("abbr.timeago").timeago();
  });

}

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);
