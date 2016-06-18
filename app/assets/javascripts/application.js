// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function(){
    $('#logo_nav').data('size','big');
});

$(window).scroll(function(){
    if($(document).scrollTop() > 0)
    {
        if($('#logo_nav').data('size') == 'big')
        {
            $('#logo_nav').data('size','small');
            $('#logo_nav').stop().animate({
                height:'80px', width:'160px'
            },600);
        }
    }
    else
    {
        if($('#logo_nav').data('size') == 'small')
        {
            $('#logo_nav').data('size','big');
            $('#logo_nav').stop().animate({
                height:'120px', width:'250px'
            },600);
        }
    }
});

$(function(){
    $('.nav-bar').data('size','big');
});

$(window).scroll(function(){
    if($(document).scrollTop() > 0)
    {
        if($('.nav-bar').data('size') == 'big')
        {
            $('.nav-bar').data('size','small');
            $('.nav-bar').stop().animate({
                height:'80px'
            },600);
        }
    }
    else
    {
        if($('.nav-bar').data('size') == 'small')
        {
            $('.nav-bar').data('size','big');
            $('.nav-bar').stop().animate({
                height:'120px'
            },600);
        }
    }
});
