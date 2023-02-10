local status_ok, mason = pcall(require, 'mason')
if not status_ok then return false end

mason.setup()

return true
