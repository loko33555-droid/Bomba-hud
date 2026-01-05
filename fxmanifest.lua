fx_version 'cerulean'
game 'gta5'

author 'Tu Nombre'
description 'Bomba HUD con sistema de rastreo'
version '1.0.0'

-- IMPORTANTE: Aquí registramos los archivos
-- Este es el rastreador que creamos:
server_script 'server.lua'

-- Aquí debes poner los archivos que ya tiene tu HUD (ejemplos comunes):
client_scripts {
    'client.lua',
    -- Si tienes más archivos .lua en el cliente, ponlos aquí abajo
}

-- Si tu HUD tiene interfaz (HTML, CSS, JS), ponlo aquí:
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    -- Añade aquí cualquier imagen o sonido que use tu HUD
}
