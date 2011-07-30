// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function toggleCreateNewList() {
  $("#new_list_form").toggle("slow");
}

function toggleCreateNewTodolist() {
  $("#new_todolist_form").toggle("slow");
}

function toggleTodolistDescription(id) {
  $("#todolist_desc_" + id).toggle("slow");
}

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  return this;
};

$(document).ready(function() {
  	$("#new_list").submitWithAjax();
	
	$("#new_todolist").submitWithAjax();
	
	$("#new_todolist").live('click', function(e){
  		$.rails.handleRemote($("#new_todolist"));
      	e.preventDefault();
   	});
})

$(function() {
  $(".todolistLoadDiv a").live("click", function(event) {
    $.getScript(this.href);

	$("#nameoflists").html("Page is loading...");


	//create empty handlers for new form
	$("#new_todolist").live('submit', function(e){
    	$.rails.handleRemote($("#new_todolist"));
        e.preventDefault();
     });
	
	return false;
  });
});

$(function() {
  $(".list_editor a").live("click", function(event) {
    $.getScript(this.href);

	//create empty handlers for new form
	$("#new_todolist").live('submit', function(e){
    	$.rails.handleRemote($("#new_todolist"));
        e.preventDefault();
     });
	
	return false;
  });
});