// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require twitter/bootstrap

if ($.support.pjax) {
    $('.pjax-links a, a.pjax').live('click', function (event) {
        event.preventDefault();
        return $.pjax({
            container:$(this).data('pjax-container') || '[data-pjax-container]',
            url:$(this).data('href') || $(this).attr('href')
        }, sessionStorage.clear());
    });
    $('form.pjax').live('submit', function (event) {
        event.preventDefault();
        return $.pjax({
            container:$(this).data('pjax-container') || '[data-pjax-container]',
            url:this.action,
            data:$(this).serialize(),
            type:$(this).attr('method')
        }, sessionStorage.clear());
    });
} else {
    $('[data-href]').live('click', function (event) {
        event.preventDefault();
        return window.location = $(this).data('href');
    });
}

$(document).on('pjax:timeout', function () {
    return false;
});

$(document).on('pjax:timeout', function () {
    return false;
});

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}