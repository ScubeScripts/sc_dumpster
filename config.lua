-- ░██████╗░█████╗░██╗░░░██╗██████╗░███████╗░██████╗░█████╗░██████╗░██╗██████╗░████████╗░██████╗
-- ██╔════╝██╔══██╗██║░░░██║██╔══██╗██╔════╝██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
-- ╚█████╗░██║░░╚═╝██║░░░██║██████╦╝█████╗░░╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░╚█████╗░
-- ░╚═══██╗██║░░██╗██║░░░██║██╔══██╗██╔══╝░░░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░░╚═══██╗
-- ██████╔╝╚█████╔╝╚██████╔╝██████╦╝███████╗██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░██████╔╝
-- ╚═════╝░░╚════╝░░╚═════╝░╚═════╝░╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░   

Config = {}

Config.Locale = 'en' --de, fr, es, en

--Bulletin Config
Config.ox_libEnable = false

--Default Config
Config.Timer = 10 * 60000
Config.searchTime = 10000

Config.dumpsterItems = {
    {chance = 2, id = 'glassbottle', name = 'Glass Bottle', quantity = math.random(1,3), limit = 10},
    {chance = 4, id = 'wallet', name = 'Wallet', quantity = 1, limit = 4},
    {chance = 2, id = 'oldshoe', name = 'Old Shoe', quantity = 1, limit = 10},
    {chance = 2, id = 'mouldybread', name = 'Mouldy Bread', quantity = 1, limit = 10},
    {chance = 3, id = 'plastic', name = 'Plastic', quantity = math.random(1,8), limit = 0},
    {chance = 4, id = 'WEAPON_BAT', name = 'Baseball Bat', quantity = 1, limit = 2, isWeapon = true},
    {chance = 8, id = 'electronics', name = 'Electronics', quantity = math.random(1,2), limit = 0},
    {chance = 2, id = 'deadbatteries', name = 'Dead Batteries', quantity = 1, limit = 10},
    {chance = 4, id = 'cellphone', name = 'Broken Phone', quantity = 1, limit = 0},
    {chance = 3, id = 'rubber', name = 'Rubber', quantity = math.random(1,3), limit = 0},
    {chance = 2, id = 'brokenfishingrod', name = 'Broken Fishing Rod', quantity = 1, limit = 10},
    {chance = 7, id = 'cartire', name = 'Car Tire', quantity = 1, limit = 4},
    {chance = 8, id = 'oldring', name = 'Old Ring', quantity = 1, limit = 10},
    {chance = 7, id = 'lockpick', name = 'Lockpick', quantity = 1, limit = 15},
    {chance = 2, id = 'expiredburger', name = 'Expired Burger', quantity = 1, limit = 10}
}

--[1] =  -> Number of the Item
--{chance = 2, -> It is important to note that the probabilities here are not given directly as percentages, but that the item.chance is interpreted as a value between 1 and 10. For example, if item.chance is 5, there is a 50% chance that the reward will be selected.
--id = 'glassbottle', -> Name of the Item
--name = 'Glass Bottle', -> Name of the Item
--quantity = math.random(1,3), -> math.random(1,3) -> Between how much of it you could find OR quantity = 1, -> You can find only one of them
--limit = 10}, -> How much of it you can have in your inventory (May not work with OX-Inventory)

Translation = {
    ['en'] = {
        ['input'] = '~INPUT_CONTEXT~ Search trash can',
        ['search_2'] = 'This dumpster has already been searched',
        ['find'] = 'You found ',
        ['find_1'] = 'You found a ',
        ['find_2'] = 'You have found nothing',
        ['error'] = ' but cannot carry any more of this item',
        ['empty'] = 'The wallet was empty',
        ['cash'] = 'You found $',
        ['cash_1'] = ' inside the wallet',
        ['search'] = 'Searching ...',
        ['error'] = 'Error',
        ['success'] = 'Success',
        ['info'] = 'Info',
    },
    ['de'] = {
        ['input'] = '~INPUT_CONTEXT~ Mülltonne durchsuchen',
        ['search_2'] = 'Diese Mülltonne wurde bereits durchsucht',
        ['find'] = 'Du hast ',
        ['find_1'] = 'Du hast ein(e) ',
        ['find_2'] = 'Du hast nichts gefunden',
        ['error'] = ' aber du kannst nicht mehr von diesem Gegenstand tragen',
        ['empty'] = 'Die Geldbörse war leer',
        ['cash'] = 'Du hast $',
        ['cash_1'] = ' in der Geldbörse gefunden',
        ['search'] = 'Wird durchsucht...',
        ['error'] = 'Fehler',
        ['success'] = 'Erfolg',
        ['info'] = 'Info',
    },
    
    ['fr'] = {
        ['input'] = '~INPUT_CONTEXT~ Fouiller la poubelle',
        ['search_2'] = 'Cette benne a déjà été fouillée',
        ['find'] = 'Vous avez trouvé ',
        ['find_1'] = 'Vous avez trouvé un(e) ',
        ['find_2'] = 'Vous n\'avez rien trouvé',
        ['error'] = ' mais vous ne pouvez plus porter cet objet',
        ['empty'] = 'Le portefeuille était vide',
        ['cash'] = 'Vous avez trouvé $',
        ['cash_1'] = ' dans le portefeuille',
        ['search'] = 'Fouille en cours...',
        ['error'] = 'Erreur',
        ['success'] = 'Succès',
        ['info'] = 'Info',
    },
    
    ['es'] = {
        ['input'] = '~INPUT_CONTEXT~ Revisar el contenedor',
        ['search_2'] = 'Este contenedor ya ha sido revisado',
        ['find'] = 'Has encontrado ',
        ['find_1'] = 'Has encontrado un(a) ',
        ['find_2'] = 'No has encontrado nada',
        ['error'] = ' pero no puedes llevar más de este objeto',
        ['empty'] = 'La cartera estaba vacía',
        ['cash'] = 'Has encontrado $',
        ['cash_1'] = ' dentro de la cartera',
        ['search'] = 'Buscando...',
        ['error'] = 'Error',
        ['success'] = 'Éxito',
        ['info'] = 'Información',
    },    
}
