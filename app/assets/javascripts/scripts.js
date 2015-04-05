jQuery(document).ready(function() {
    /*
        Background slideshow
    */
    $('.coming-soon').backstretch([
      "/assets/1.jpg"
    , "/assets/2.jpg"
    , "/assets/3.jpg"
    , "/assets/4.jpg"
    , "/assets/5.jpg"
    , "/assets/6.jpg"
    , "/assets/7.jpg"
    , "/assets/8.jpg"
    ], {duration: 5000, fade: 700});
    /*
        Countdown initializer
    */
    var now = new Date();
    var countTo = '2015/02/02 15:00:00'
    $('.timer').countdown(countTo, function(event) {
        var $this = $(this);
        switch(event.type) {
            case "seconds":
            case "minutes":
            case "hours":
            case "days":
            case "weeks":
            case "daysLeft":
                $this.find('span.'+event.type).html(event.value);
                break;
            case "finished":
                $this.hide();
                break;
        }
    });
    /*
        Tooltips
    */
    $('.social a.facebook').tooltip();
    $('.social a.twitter').tooltip();
    $('.social a.dribbble').tooltip();
    $('.social a.googleplus').tooltip();
    $('.social a.pinterest').tooltip();
    $('.social a.flickr').tooltip();
});
