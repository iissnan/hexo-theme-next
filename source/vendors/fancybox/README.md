fancyBox
========

fancyBox is a tool that offers a nice and elegant way to add zooming functionality for images, html content and multi-media on your webpages.

More information and examples: http://www.fancyapps.com/fancybox/

License: http://www.fancyapps.com/fancybox/#license

Copyright (c) 2012 Janis Skarnelis - janis@fancyapps.com


How to use
----------

To get started, download the plugin, unzip it and copy files to your website/application directory.
Load files in the <head> section of your HTML document. Make sure you also add the jQuery library.

    <head>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
        <link rel="stylesheet" href="/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
        <script type="text/javascript" src="/fancybox/jquery.fancybox.pack.js"></script>
    </head>

Create your links with a `title` if you want a title to be shown, and add a class:

    <a href="large_image.jpg" class="fancybox" title="Sample title"><img src="small_image.jpg" /></a>

If you have a set of related items that you would like to group,
additionally include a group name in the `rel` (or `data-fancybox-group`) attribute:

    <a href="large_1.jpg" class="fancybox" rel="gallery" title="Sample title 1"><img src="small_1.jpg" /></a>
    <a href="large_2.jpg" class="fancybox" rel="gallery" title="Sample title 1"><img src="small_2.jpg" /></a>

Initialise the script like this:

    <script>
        $(document).ready(function() {
            $('.fancybox').fancybox();
        });
    </script>

May also be passed an optional options object which will extend the default values. Example:

    <script>
        $(document).ready(function() {
            $('.fancybox').fancybox({
                padding : 0,
                openEffect  : 'elastic'
            });
        });
    </script>

Tip: Automatically group and apply fancyBox to all images:

    $("a[href$='.jpg'],a[href$='.jpeg'],a[href$='.png'],a[href$='.gif']").attr('rel', 'gallery').fancybox();

Script uses the `href` attribute of the matched elements to obtain the location of the content and to figure out content type you want to display.
You can specify type directly by adding classname (fancybox.image, fancybox.iframe, etc) or `data-fancybox-type` attribute:

    //Ajax:
    <a href="/example.html" class="fancybox fancybox.ajax">Example</a>
    //or
    <a href="/example.html" class="fancybox" data-fancybox-type="ajax">Example</a>

    //Iframe:
    <a href="example.html" class="fancybox fancybox.iframe">Example</a>

    //Inline (will display an element with `id="example"`)
    <a href="#example" class="fancybox">Example</a>

    //SWF:
    <a href="example.swf" class="fancybox">Example</a>

    //Image:
    <a href="example.jpg" class="fancybox">Example</a>

Note, ajax requests are subject to the [same origin policy](http://en.wikipedia.org/wiki/Same_origin_policy).
If fancyBox will not be able to get content type, it will try to guess based on 'href' and will quit silently if would not succeed.
(this is different from previsous versions where 'ajax' was used as default type or an error message was displayed).

Advanced
--------

### Helpers

Helpers provide a simple mechanism to extend the capabilities of fancyBox. There are two built-in helpers - 'overlay' and 'title'.
You can disable them, set custom options or enable other helpers. Examples:

    //Disable title helper
    $(".fancybox").fancybox({
        helpers:  {
            title:  null
        }
    });

    //Disable overlay helper
    $(".fancybox").fancybox({
        helpers:  {
            overlay : null
        }
    });

    //Change title position and overlay color
    $(".fancybox").fancybox({
        helpers:  {
            title : {
                type : 'inside'
            },
            overlay : {
                css : {
                    'background' : 'rgba(255,255,255,0.5)'
                }
            }
        }
    });

    //Enable thumbnail helper and set custom options
    $(".fancybox").fancybox({
        helpers:  {
            thumbs : {
                width: 50,
                height: 50
            }
        }
    });


### API

Also available are event driven callback methods.  The `this` keyword refers to the current or upcoming object (depends on callback method). Here is how you can change title:

    $(".fancybox").fancybox({
        beforeLoad : function() {
            this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');

            /*
                "this.element" refers to current element, so you can, for example, use the "alt" attribute of the image to store the title:
                this.title = $(this.element).find('img').attr('alt');
            */
        }
    });

It`s possible to open fancyBox programmatically in various ways:

    //HTML content:
    $.fancybox( '<div><h1>Lorem Lipsum</h1><p>Lorem lipsum</p></div>', {
        title : 'Custom Title'
    });

    //DOM element:
    $.fancybox( $("#inline"), {
        title : 'Custom Title'
    });

    //Custom object:
    $.fancybox({
        href: 'example.jpg',
        title : 'Custom Title'
    });

    //Array of objects:
    $.fancybox([
        {
            href: 'example1.jpg',
            title : 'Custom Title 1'
        },
        {
            href: 'example2.jpg',
            title : 'Custom Title 2'
        }
    ], {
        padding: 0
    });

There are several methods that allow you to interact with and manipulate fancyBox, example:

    //Close fancybox:
    $.fancybox.close();

There is a simply way to access wrapping elements using JS:

    $.fancybox.wrap
    $.fancybox.skin
    $.fancybox.outer
    $.fancybox.inner

You can override CSS to customize the look. For example, make navigation arrows always visible,
change width and move them outside of area (use this snippet after including fancybox.css):

    .fancybox-nav span {
        visibility: visible;
    }

    .fancybox-nav {
        width: 80px;
    }

    .fancybox-prev {
        left: -80px;
    }

    .fancybox-next {
        right: -80px;
    }

In that case, you might want to increase space around box:

    $(".fancybox").fancybox({
        margin : [20, 60, 20, 60]
    });


Bug tracker
-----------

Have a bug? Please create an issue on GitHub at https://github.com/fancyapps/fancyBox/issues