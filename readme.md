JobDisplay Window:
Use the settings file within the data folder to customize the display window position, size, colors, and whether you're going to use the default display.
Custom_JOB should be set to 0 for default. 1 for Custom.

JobDisplay Custom Building
•In the custom file you must specify what to display. Each column, 1 through 10, should have a function specified. A column number will need to be specified: IE) Ability_Display(1,1) would display Berserk as column one.
•Please reference your Windower4\res folder for ability_recasts.lua and buffs.lua ID numbers.

Functions currently included:
NOTE-Functions are case sensitive.

Standard:
Ability_Display(column,abil,buff,label) - Displays an ability, if it's on cooldown, and if the specified buff is active.
•An abilitiy not learned, mertied, or otherwise unavailable will result in an Empty(column).
Spell_Display(column,spell_id) -- Displays a spell and if it's on cooldown or not.
Empty(column) -- Sets column to blank.
Set_Display(column,value,color) -- Player input driven set displays.
Subjob_Display(column) -- Displays one PREDETERMINED subjob ability

Additional:
Arts_Display(column) -- Custom display of Light/Dark Arts.
Sic_Ready_Display(column,gear) -- Custom handling of Ready Timer. A numeric entry in seconds is required for gear if you use gear to cut the recast on Ready Charges down.
Strategem_Display(column) -- Displays the number of currently available Strategems.
Hasso_Seigan_Display(column) -- Displays Third Eye or Hasso and their recast when active. Otherwise defaults to Seigan.
Phantom_Roll_Display(column) -- Displays Phantom Roll, Double-Up, Snake Eye, and Fold.
Quickdraw_Display(column) -- Changes color if at least 1 QD is avaiable. (Stratgem-like facelift to come)
Samba_Display(column) -- Tracks Sambas in a single column.
MPP_Display(column) -- Displays Player's current MP% with varying colors per MP%.
HPP_Display(column) -- Displays Player's current HP% with varying colors per HP%.
Steps_Display(column) -- Displays number finishing moves.
Enspell_Display(column) -- Displays the current enspell, if any.
Shihei_Display(column) -- Counts and displays Shihei in Player's main inventory.
Item_Display(column,item_id) -- Counts and displays Shihei in Player's main inventory.
Range_Display(column) -- Will call Ammo_Display ONLY if Player has a 'Range' equiped. 
Ammo_Display(column) -- Displays equipped 'Ammo' name and current count. Use Range_Display() unless tracking throwing items/petMeds.
Favor_Display(column) -- Displays Player's current active Avatar's Favor effect
Pet_Display(column) -- Pet's Current HP%
Set_Display(column,value,color) -- Player input driven set display for use with 'jd set' command.

Free-form input:
To enter whatever you want as a custom display you may the following command:

Ingame chat: //jd column label value color
Ingame windower-console: jd column label value color
Ingame macro: /con jd column label value color
Gearswap: windower.send_command('jd column label value color')

Where jd is the windower command, column is the column number where you want to insert your display, label is what you want displayed before the value, and color of said value.

Colors:
There are 10 colors.
8 follow windower's native element numbering.

    0 = Fire
    1 = Ice
    2 = Wind
    3 = Earth
    4 = Lightning
    5 = Water
    6 = Light
    7 = Dark

Two JobDisplay colors:
9 = Gray
10 = White

If you don't prefer to use numbers you may also enter the color name which is NOT case sensitive (fire,water,white,dark,gray,purple,etc...)

Set Command:
Similar to free-form input however it defaults the label to "Set: "
From your game,conosole,gearswap pass the following:
Ingame chat: //jd set column value color
Ingame windower-console: jd set column value color
Ingame macro: /con jd set column value color
Gearswap: windower.send_command('jd set column value color')
example: windower.send_command('jd set 1 PDT 3')





