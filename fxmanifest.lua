fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sc_dumpster"
author "Scube Scripts"
version "2.0.0"
description "A small script for searching garbage cans."

server_scripts {
	'server/sv_main.lua',
  'server/updater.lua'
}

client_scripts {
	'client/cl_main.lua'
}

shared_script {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'sc_progress'
  }