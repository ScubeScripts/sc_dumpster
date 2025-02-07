fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "sc_dumpster"
author "Scube Scripts"
version "2.0.1"
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
    'sc_progress'
  }