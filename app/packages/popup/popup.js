Template.PopupToggle.events({
    'click >': function(e) {
        e.preventDefault();
        var thisDataId = Template.currentData().id;
        $('[data-popup=' + thisDataId + ']').toggle('slow');

        //var top = thisDataId.position.top;
    }
});
