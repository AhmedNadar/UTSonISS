/*!
 * Start Bootstrap - Agnecy Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
  $('a.page-scroll').bind('click', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: $($anchor.attr('href')).offset().top
    }, 1500, 'easeInOutExpo');
    event.preventDefault();
  });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
  target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
  $('.navbar-toggle:visible').click();
});

// tooltip
$(function () {
    $("[rel='tooltip']").tooltip();
});

// fancyBox
$(document).ready(function() {
  $(".various").fancybox({
    maxWidth     : 800,
    maxHeight    : 450,
    fitToView    : false,
    autoScale    : true,
    width        : '70%',
    height       : '70%',
    href         : this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
    title        : this.title,
    autoSize     : false,
    closeClick   : false,
    openEffect   : 'none',
    closeEffect  : 'none',
    transitionIn : 'elastic',
    transitionOut: 'elastic',
    speedIn      : 600,
    speedOut     : 200,
    overlayShow  : true
  });
  return false;
});
