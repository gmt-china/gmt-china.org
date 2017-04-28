var clipInit = false;
$('code').each(function() {
    var code = $(this),
        text = code.text();

    if (text.length > 30) {
        if (!clipInit) {
            var text, clip = new Clipboard('.copy-to-clipboard', {
                text: function(trigger) {
                    text = $(trigger).prev('code').text();
                    return text.replace(/^\$\s/gm, '');
                }
            });

            var inPre;
            clip.on('success', function(e) {
                e.clearSelection();
                inPre = $(e.trigger).parent().prop('tagName') == 'PRE';
                $(e.trigger).attr('aria-label', 'Copied to clipboard!').addClass('tooltipped tooltipped-' + (inPre ? 'w' : 's'));
            });

            clip.on('error', function(e) {
                inPre = $(e.trigger).parent().prop('tagName') == 'PRE';
                $(e.trigger).attr('aria-label', fallbackMessage(e.action)).addClass('tooltipped tooltipped-' + (inPre ? 'w' : 's'));
                $(document).one('copy', function() {
                    $(e.trigger).attr('aria-label', 'Copied to clipboard!').addClass('tooltipped tooltipped-' + (inPre ? 'w' : 's'));
                });
            });

            clipInit = true;
        }

        code.after('<span class="copy-to-clipboard" title="Copy to clipboard" />');
        code.next('.copy-to-clipboard').on('mouseleave', function() {
            $(this).attr('aria-label', null).removeClass('tooltipped tooltipped-s tooltipped-w');
        });
    }
});


// Execute actions on images generated from Markdown pages
var images = $("div.article-inner img");
// Wrap image inside a featherlight (to get a full size view in a popup)
images.wrap(function() {
    var image = $(this);
    return "<a href='" + image[0].src + "' data-featherlight='image'></a>";
});

// Change styles, depending on parameters set to the image
images.each(function(index) {
    var image = $(this);
    var o = getUrlParameter(image[0].src);
    if (typeof o !== "undefined") {
        var h = o["height"];
        var w = o["width"];
        var c = o["classes"];
        image.css("width", function() {
            if (typeof w !== "undefined") {
                return w;
            } else {
                return "auto";
            }
        });
        image.css("height", function() {
            if (typeof h !== "undefined") {
                return h;
            } else {
                return "auto";
            }
        });
        if (typeof c !== "undefined") {
            var classes = c.split(',');
            for (i = 0; i < classes.length; i++) {
                image.addClass(classes[i]);
            }
        }
    }
});


$(function(){
    $("table").addClass("table table-bordered table-striped");
    }
);
