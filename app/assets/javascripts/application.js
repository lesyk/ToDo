// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function showCreateNewList() {
  $("#new_list_form").show("slow");
}

function hideCreateNewList() {
  $("#new_list_form").hide("slow");
}

function showCreateNewTodolist() {
  $("#new_todolist_form").show("slow");
}

function hideCreateNewTodolist() {
  $("#new_todolist_form").hide("slow");
}

function showTodolistDescription(id) {
  $("#todolist_desc_" + id).show("slow");
}

function hideTodolistDescription(id) {
  $("#todolist_desc_" + id).hide("slow");
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