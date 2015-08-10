Template.PopupToggle.events({
    'click >': function(e) {
        e.preventDefault();
        var globalTpl = Template.instance();
        var el = globalTpl.$('>');
        var thisDataId = Template.currentData().id;
        console.log(thisDataId);
        var popover = $('[data-popup=' + thisDataId + ']');

        var top = el.position().top - 70;
        var left = el.position().left;
        left = left - (popover.width() / 2) + (el.width() / 2) - 2;


        popover.css('opacity', 1).css('left', left).css('top', top).toggle('slow');
        popover.find('input').focus();
        //$('[data-popup=' + thisDataId + ']').toggle('slow');

    }
});
