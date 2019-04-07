-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
include('Paulu-Globals.lua')
res = require('resources')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
	Armor = 'None'
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --
	
	RuneIndex = 7
	RuneArray = {'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda', 'Lux', 'Tenebrae'}
	IndexColorIndex = RuneIndex
	IndexColorArray = {039, 210, 006, 166, 201, 207, 056, 160}
	WardIndex = 1
	WardArray = {'Vallation','Pflug','Valiance','Liement','Battuta'}
	EffusionIndex = 1
	EffusionArray = {'Swipe','Lunge','Gambit','Rayke'}
	RuneBuffIndex = RuneIndex
	RuneBuffArray = {523,524,525,526,527,528,529,530}
	
	start_time = 1000555666777
	rune_button_status = 'none'
	
	augmented = {}
	augmented.BackTP = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	
	sc_map = {SC1="Resolution", SC2="Berserk", SC3="Aggressor"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})

	-- TP Sets --
	sets.TP = {
		ammo='Ginsen', 
		head='Adhemar bonnet +1', neck='Lissome Necklace', ear1='Cessance Earring', ear2='Telos Earring',
		body="Adhemar jacket +1", hands="Adhemar wristbands +1", ring1="Niqmaddu Ring", ring2="Epona's ring", 
		back=augmented.BackTP, waist='Ioskeha Belt +1', legs="Samnuha tights", feet="Herculean boots" }
	sets.TP.MidACC = set_combine(sets.TP,{})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{})

	-- TP Swordplay Set
	sets.TP.Swordplay = {hands="Futhark Mitons +1"}

	-- PDT/MDT Sets --
	sets.PDT = {}

	sets.MDT = set_combine(sets.PDT,{})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
		ammo='Ginsen', 
		head='Adhemar bonnet +1', neck="Fotia Gorget", ear1='Moonshade Earring', ear2='Telos Earring',
		body="Adhemar jacket +1", hands="Adhemar wristbands +1", ring1="Niqmaddu Ring", ring2="Epona's ring",
		--back
		waist="Fotia Belt", legs="Samnuha tights", feet="Herculean boots"
	}

	-- WS Sets --
	sets.WS.Resolution = {}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})

	sets.WS.Upheaval = {}
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{})

	-- Enmity Set --
	sets.Enmity = {
		--ammo="Sapience orb",
		head="Rune. Bandeau +1",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +1",
		feet="Erilaz Greaves +1",
		neck="Unmoving Collar",
		waist="Goading Belt",
		ear1="Pluto's Pearl",
		ear2="Cryptic Earring",
		ring1="Supershear Ring",
		ring2="Petrov Ring",
		--back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}

	sets.JA = {}
	-- JA Sets --
	sets.JA.Lunge = {}
	sets.JA.Swipe = set_combine(sets.Lunge,{})
	sets.JA.Vallation = set_combine(sets.Enmity,{body="Runeist Coat +1"})
	sets.JA.Swordplay = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
	sets.JA.Pflug = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
	sets.JA.Valiance = set_combine(sets.Enmity,{body="Runeist Coat +1"})
	sets.JA.Embolden = set_combine(sets.Enmity,{legs="Futhark Trousers +1"})
	sets.JA.Gambit = set_combine(sets.Enmity,{hands="Runeist Mitons +1"})
	sets.JA.Liement = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.JA["One For All"] = set_combine(sets.Enmity,{
		--ammo="Sapience Orb",
		head="Rune. Bandeau +1",
		body="Runeist's Coat +1",
		hands="Runeist's Mitons +1",
		legs="Eri. Leg Guards +1",
		feet="Runeist's Boots +1",
		waist="Kasiri Belt",
		left_ear="Odnowa Earring +1",
		right_ear="Odnowa Earring"})
	sets.JA.Battuta = set_combine(sets.Enmity,{head="Fu. Bandeau +1"})
	sets.JA.Rayke = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
	sets.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.JA['Vivacious Pulse'] = set_combine(sets.Enmity,{
		head="Erilaz Galea +1",
		neck="Incanter's torque", 
		--ear1="Beatific earring", 
		--ear2="Divine earring",
		hands="Kurys gloves", 
		ring1="Stikini ring +1", 
		--ring2="Stikini ring", 
		--back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
		--waist="Bishop's sash", 
		legs="Runiest's Trousers +1", })
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)

	-- Waltz Set --
	sets.Waltz = {}

	-- Flourish --
	sets.Flourish = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {ammo="Impatiens",
		head="Runeist bandeau +1",
		neck="Orunmila's Torque",
		ear1="Loquacious earring", 
		ear2="Etiolation earring",
		body="Samnuha Coat", 
		hands="Leyline gloves", 
		ring1="Prolix ring", 
		ring2="Kishar ring", 
		--back="",
		waist="Siegel sash", 
		legs="Futhark trousers +1", 
		--feet="Carmine greaves +1"
		}

	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{
			waist="Siegel Sash",
			legs="Futhark Trousers +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- Flash Set --
	sets.Midcast.Flash = {}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			head="Erilaz Galea +1",
			hands="Runeist Mitons +1",
			legs="Futhark Trousers +1"}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Phalanx --
	sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{head="Futhark Mitons +1"})

	-- Regen --
	sets.Midcast.Regen = {head="Rune. Bandeau +1"}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = {}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" or spell.type == "Ward" or spell.type == "Effusion" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english:startswith('Utsusemi') then
				if spell.english == 'Utsusemi: Ni' then
					if buffactive['Copy Image (3)'] then
						cancel_spell()
						add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
						return
					else
						equip(sets.Precast.Utsusemi)
					end
				else
					equip(sets.Precast.Utsusemi)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type:endswith('Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif spell.english:startswith('Protect') or spell.english:startswith('Shell') then
			equipSet = equipSet.Haste
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
			end
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:endswith('Spikes') then
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Swordplay then
			equipSet = set_combine(equipSet,sets.TP.Swordplay)
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'runetest' then
		if rune_button_status == 'none' then
			start_time = os.time()
			rune_button_status = 'pressed'
			windower.send_command('wait 1; gs c runetest')
		elseif math.abs(start_time - os.time()) < 1 and rune_button_status == 'pressed' then
			windower.send_command('gs c rune')
			rune_button_status = 'doubled'
		elseif math.abs(stop_time - os.time()) >= 1 and rune_button_status == 'pressed' then
			windower.send_command('gs c setrune')
			start_time = os.time()
			rune_button_status = 'none'
		elseif rune_button_status == 'doubled' then
			rune_button_status = 'none'
			return
		else
			rune_button_status = 'none'
		end
	elseif command == 'setrune' then
		RuneIndex = (RuneIndex % #RuneArray) + 1
		IndexColorIndex = (IndexColorIndex % #IndexColorArray) + 1
		add_to_chat(IndexColorArray[IndexColorIndex],'Rune: ' .. RuneArray[RuneIndex])
	elseif command == 'rune' then
		send_command('input /ja "'..RuneArray[RuneIndex]..'" <me>')
	elseif command == 'setward' then
		WardIndex = (WardIndex % #WardArray) + 1
		add_to_chat(160,'Ward: ' .. WardArray[WardIndex])
	elseif command == 'ward' then
		send_command(WardArray[WardIndex])
	elseif command == 'seteffusion' then
		EffusionIndex = (EffusionIndex % #EffusionArray) + 1
		add_to_chat(160,'Effusion: ' .. EffusionArray[EffusionIndex])
	elseif command == 'effusion' then
		send_command(EffusionArray[EffusionIndex])
	elseif command == 'automode' then
		AutoPlay()
	elseif command == 'AUTO' then
		Auto()
	elseif command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('ring1','ring2','back')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function Auto()
	if autoplay == false then
		return
	end
	MyProject_Target_Fix()
	local count = Rune_Count()
	if windower.ffxi.get_ability_recasts()[242] == 0 and player.hpp < 90 and Rune_Count() == 3 then -- Vivacious Pulse
		windower.send_command('Vivacious Pulse')
	elseif windower.ffxi.get_ability_recasts()[24] == 0 then -- Swordplay
		windower.send_command('Swordplay')
	elseif count < 3 then
		windower.send_command(RuneArray[RuneIndex])
	elseif player.status == 'Engaged' and player.tp > 1000 then
		windower.send_command('Resolution')
	elseif count == 3 then
		if windower.ffxi.get_ability_recasts()[120] == 0 then -- Battuta
			windower.send_command('Battuta')
		elseif windower.ffxi.get_ability_recasts()[113] == 0 and not buffactive['Vallation'] then -- Valiance
			windower.send_command('Valiance')
		elseif windower.ffxi.get_ability_recasts()[23] == 0 and not buffactive['Valiance'] then -- Valiance
			windower.send_command('Vallation')
		end
		if windower.ffxi.get_ability_recasts()[59] == 0 then -- Pflug
			windower.send_command('wait 2;Pflug')
		end
	end
	send_command('wait 5;input //gs c AUTO')
end

function Rune_Count()
	local count = 0
	for k,v in pairs(windower.ffxi.get_player().buffs) do 
		for p,q in pairs(RuneBuffArray) do
			if tostring(v) == tostring(q) then
				count = count + 1
			end
		end
	end	
	return count
end

function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(1, 13)
end