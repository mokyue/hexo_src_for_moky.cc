(function ($) {
    // When to show the scroll link
    // higher number = scroll link appears further down the page
    var upperLimit = 150;

    // Our scroll link element
    var scrollElem = $('#to_top');

    // Scroll to top speed
    var scrollSpeed = 500;

    // Show and hide the scroll to top link based on scroll position
    scrollElem.hide();
    $(window).scroll(function () {
        var scrollTop = $(document).scrollTop();
        if (scrollTop > upperLimit) {
            $(scrollElem).show();
            $(scrollElem).stop().fadeTo(300, 1); // fade back in
        } else {
            $(scrollElem).stop().fadeTo(300, 0, function () {
                $(scrollElem).hide();
            }); // fade out
        }
    });
    // Scroll to top animation on click
    $(scrollElem).click(function () {
        $('html, body').animate({scrollTop: 0}, scrollSpeed);
        return false;
    });
})(jQuery);
