function DataBinder(rate) {
    var pubSub = $({});
    $(document).on('input', '[data-attr]', function (evt) {
        var $input = $(this);
        if ($input.context.id === 'collateralCount') {
            pubSub.trigger('change', [$input.attr('data-attr'), $input.val()])
        } else if ($input.context.id === 'borrowCount') {
            pubSub.trigger('change', [$input.attr('data-attr'), $input.val() / rate / 0.6])
        }

    });
    pubSub.on('change', function (evt, select, new_val) {
        $('#collateralCount').val(new_val);
        $('#borrowCount').val(new_val * rate * 0.6)
    });
    return pubSub
}

function Coin(rate) {
    var binder = new DataBinder(rate);
    var coin = {
        attributes: {},
        set: function (attr_name, val) {
            this.attributes[attr_name] = val;
            binder.trigger('change', [attr_name, val, this])
        },
        get: function (attr_name) {
            return this.attributes[attr_name]
        }
    };
    return coin
}