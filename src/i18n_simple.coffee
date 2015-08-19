@i18n = {
    _: {}

    get: (selector, params) ->
        value = ''

        if selector.indexOf('.') isnt -1
            stages = selector.split '.'
            _ = @_

            for stage in stages
                collection = _[stage]
                if collection isnt undefined
                    if typeof collection isnt 'string'
                        _ = collection
                    else
                        value = collection
                else break

        else value = @_[selector] or ''

        if params isnt undefined
            for param of params
                value = value.replace new RegExp('\\%'+param+'\\%', 'i'), params[param]

        value
}