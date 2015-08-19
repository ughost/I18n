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

    set: (selector, value) ->
        if selector.indexOf('.') is -1
            @_[selector] = value
        else
            stages = selector.split '.'
            data = @_
            last = stages.length - 1

            for key, name of stages
                if key * 1 is last
                    data[name] = value
                else
                    if data[name] is undefined
                        data[name] = {}

                    data = data[name]
}
