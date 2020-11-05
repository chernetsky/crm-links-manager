local log = require 'log'

box.once('access:v1', function()
    box.schema.user.grant('guest', 'read,write,execute', 'universe')
    -- Uncomment this to create user clm_user
    -- box.schema.user.create('clm_user', { password = 'clm_pass' })
    -- box.schema.user.grant('clm_user', 'read,write,execute', 'universe')
end)

local app = {
    mod1 = require 'app.storage.mod1'
}

function app.init(config)
    log.info('storage app init')
    for k, mod in pairs(app) do if type(mod) == 'table' and mod.init ~= nil then mod.init(config) end end
end

function app.destroy()
    log.info('storage app destroy')
    for k, mod in pairs(app) do if type(mod) == 'table' and mod.destroy ~= nil then mod.destroy() end end
end

package.reload:register(app)
return app
