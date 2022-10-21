fx_version 'cerulean'
game 'gta5'

author 'Flawws & Flakey'
description 'This is the EchoRP MDT (ESX version with Downtown Helper)'
version '1.0.0'

lua54 'yes'

shared_script '@es_extended/imports.lua';
shared_script '@ox_lib/init.lua';
shared_script '@Yggdrasill/imports.lua';

server_scripts {
    'provider.lua',
    'sv_main.lua'
}
client_script 'cl_main.lua'

ui_page 'ui/dashboard.html'

files {
    'ui/**'
}