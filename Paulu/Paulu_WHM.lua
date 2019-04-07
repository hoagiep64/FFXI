-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some Of Motenten's Functions ** --
include('Paulu-Globals.lua')


function get_sets()
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	canceled = false
	DC = false
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	Kiting = 'ON' -- Set Default Sublimation Kiting ON or OFF Here --
	Elemental_Staff = 'OFF' -- Set Default Precast Elemental Staff ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	
	augmentGear = {}
	augmentGear.TelchineFTEnhancing={ name="Telchine Pigaches", augments={'"Waltz" potency +4%','Enh. Mag. eff. dur. +7',}}
	
	
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"} -- Curaga Degradation --
	Na_Spells = S{"Paralyna","Cursna","Silena","Poisona","Blindna","Viruna","Stona","Erase"} -- For Bolelabunga --
	sc_map = {SC1 = "LightArts", SC2 = "Celerity", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Refresh Set --
	sets.Idle.Refresh = {
		main="Bolelabunga",
		ammo="Homiliary",
		sub="Genbu's Shield",
		head="Befouled Crown",
        neck="Loricate Torque +1",
        rear="Etiolation Earring",
        lear="Genmei Earring",
		body="Ebers Bliaud +1",
		hands="Inyan. Dastanas +1",
        lring="Defending Ring",
        rring="Dark Ring",
		back="Solemnity Cape",
		waist="Fucho-no-Obi",
		legs="Assid. Pants +1",
		feet="Battlecast Gaiters"}

	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			feet="Herald's Gaiters"})

	-- Resting Set --
	sets.Resting = {
	    main="Bolelabunga",
        sub="Genbu's Shield",
        ammo="Homiliary",
        head="Befouled Crown",
        neck="Loricate Torque +1",
        lear="Genmei Earring",
        rear="Relaxing Earring",
        body="Ebers Bliaud +1",
        --hands="Asteria Mitts +1",
        lring="Defending Ring",
        rring="Dark Ring",
        back="Felicitas Cape +1",
        waist="Shinjutsu-no-obi +1",
        legs="Assiduity Pants +1",
        --feet="Merlinic Crakows"
	}

	-- PDT Set --
	sets.PDT = {
        main="Bolelabunga",
        sub="Genbu's Shield",      
        ammo="Staunch Tathlum +1",
        head="Hike Khat +1",
        neck="Loricate Torque +1",
        lear="Genmei Earring",
        rear="Colossus's Earring",
        body="Vrikodara Jupon",
        hands="Inyan. Dastanas +1",
        lring="Defending Ring",
        rring="Dark Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Miasmic Pants",
        feet="Battlecast Gaiters"	
	}
	
	sets.MDT = {
        head="Warder's Charm +1",
        neck="Loricate Torque +1",
        lear="Evans Earring",
        rear="Relaxing Earring",
        body="Inyanga Jubbah +2",
        hands="Inyanga Dastanas +1",
        lring="Defending Ring",
        rring="Shadow Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +1"
	}

	-- Sublimation Set --
	sets.Sublimation = {
		main="Bolelabunga",
		ammo= "Homiliary",
		sub="Genbu's Shield",
		head="Befouled Crown",
        neck="Loricate Torque +1",
        rear="Etiolation Earring",
        lear="Genmei Earring",
		body="Ebers Bliaud +1",
		hands="Inyan. Dastanas +1",
        lring="Defending Ring",
        rring="Dark Ring",
		back="Solemnity Cape",
		waist="Fucho-no-Obi",
		legs="Assid. Pants +1",
		feet="Battlecast Gaiters"
	}

	sets.Precast = {}
	-- Fastcast Set (empty = To Fix Club/Staff Issue) --
	sets.Precast.FastCast = {
		main="Bolelabunga",
		--sub="Genbu's Shield",
		head="Vanya Hood",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
		hands="Fanatic Gloves",
        lring="Lebeche Ring",
        rring="Prolix Ring",
		back="Alaunus's Cape",
		waist="Witful Belt",
		legs="Lengo Pants",
		feet="Regal Pumps +1"
	}

	-- Elemental Staves --
	--sets.Precast.Lightning = {main='Apamajas I'}
	--sets.Precast.Water = {main='Haoma I'}
	--sets.Precast.Fire = {main='Atar I'}
	--sets.Precast.Ice = {main='Vourukasha I'}
	--sets.Precast.Wind = {main='Vayuvata I'}
	--sets.Precast.Earth = {main='Vishrava I'}
	--sets.Precast.Light = {main='Arka I'}
	--sets.Precast.Dark = {main='Xsaeta I'}

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{main="Bolelabunga",waist="Siegel Sash"})
	sets.Precast['Healing Magic'] = set_combine(sets.Precast.FastCast,{main="Bolelabunga",legs="Ebers Pant. +1"})

	sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Cure Precast Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{legs="Ebers Pant. +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
		sub="Ammurapi Shield",
		head="Telchine Cap",
		neck="Incanter's Torque",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		rring="Stikini Ring",
		back="Mending Cape",
		waist="Witful Belt",
		legs="Telchine Braconi",
		feet=augmentGear.TelchineFTEnhancing
	})

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Queller Rod",
			head="Ebers Cap +1",
			neck="Orunmila's Torque",
			lear="Nourish. Earring +1",
			rear="Roundel Earring",
			body="Ebers Bliaud +1",
			hands="Fanatic Gloves",
			lring="Defending Ring",
			rring="Haoma's Ring",
			back="Alaunus's Cape",
			waist="Witful Belt",
			legs="Ebers Pant. +1",
			feet="Medium's Sabots"
	}

	-- Cure Enmity Set --
	sets.Midcast.Cure.Enmity = set_combine(sets.Midcast.Cure,{})

	-- Curaga Set --
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure,{})

	-- Curaga Enmity Set --
	sets.Midcast.Curaga.Enmity = set_combine(sets.Midcast.Curaga,{})

	-- Enhancing Set --
	sets.Midcast['Enhancing Magic'] = {
		sub="Ammurapi Shield",
		head="Telchine Cap",
		neck="Incanter's Torque",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		rring="Stikini Ring",
		back="Mending Cape",
		waist="Witful Belt",
		legs="Telchine Braconi",
		feet=augmentGear.TelchineFTEnhancing
	}

	-- Barspells Set --
	sets.Midcast.Bar = set_combine(sets.Midcast['Enhancing Magic'])

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Midcast.Haste,{
		main="Bolelabunga",
		sub="Ammurapi Shield",
		head="Telchine Cap",
		neck="Incanter's Torque",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		rring="Stikini Ring",
		back="Mending Cape",
		waist="Witful Belt",
		legs="Telchine Braconi",
		feet=augmentGear.TelchineFTEnhancing})

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste,{neck="Stone Gorget", waist="Siegel Sash"})

	-- Na Set --
	sets.Midcast.Na = set_combine(sets.Midcast.Haste,{main="Bolelabunga",legs="Ebers Pant. +1"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
		main="Bolelabunga",
		sub="Genbu's Shield",
		ammo="Impatiens",
		head="Ebers Cap +1",
		neck="Malison Medallion",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
		body="Ebers Bliaud +1",
		hands="Fanatic Gloves",
		ring1="Haoma's Ring",
		ring2="Stikini Ring +1",
		back="Alaunus's Cape",
		waist="Witful Belt",
		legs="Theo. Pant. +1",
		feet="Regal Pumps +1"})

	-- Divine Set --
	sets.Midcast['Divine Magic'] = {}

	-- Banish Set --
	sets.Midcast.Banish = set_combine(sets.Midcast['Divine Magic'],{
			hands="Piety Mitts +1",
			ring1="Fenian Ring"})

	-- Holy Set --
	sets.Midcast.Holy = set_combine(sets.Midcast['Divine Magic'],{})
	
	-- Enfeebling Set --
	sets.Midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		neck="Incanter's Torque",
		lear="Digni. Earring",
		rear="Gwati Earring",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +1",
		lring="Stikini Ring +1",
		rring="Etana Ring",
		back="Felicitas Cape +1",
		waist="Luminary Sash",
		legs="Chironic Hose",
		feet="Medium's Sabots"
	}

	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {
		neck="Incanter's Torque",
		hands="Inyan. Dastanas +1",
		rring="Stikini Ring +1"
	}

	-- Impact Set --
	sets.Midcast.Impact = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Piety Briault +1"}
	sets.JA.Martyr = {hands=""}
	sets.JA.Devotion = {head=""}

	-- Divine Caress Set --
	sets['Divine Caress'] = {
		main="Bolelabunga",
		hands="Ebers Mitts +1",
		back="Mending Cape"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{})

	-- WS Base Set --
	sets.WS = {}
	sets.WS['Hexa Strike'] = {}
	sets.WS['Mystic Boon'] = {}
	sets.WS.Dagan = {}
end

------------------------------------------- END OF SETS -----------------------------------
function pretarget(spell,action)
	if midaction() then
		canceled = true
		return
	elseif spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == 'Light Arts' and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == 'Dark Arts' and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if canceled then
		return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		elseif spell.english == "Immanence" then
			cancel_spell()
			send_command('input /ja Perpetuance <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation" <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		elseif spell.english == "Perpetuance" then
			cancel_spell()
			send_command('input /ja Immanence <me>')
		end
	end
	if spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Stoneskin" then
				equip(sets.Precast[spell.english])
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "WeaponSkill" then

			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and not Na_Spells:contains(spell.english) and Elemental_Staff == 'ON' then
		equip(sets.Precast[spell.element])
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if Na_Spells:contains(spell.english) then
			equipSet = equipSet.Na
			if DC then
				equipSet = set_combine(equipSet,sets['Divine Caress'])
			end
		elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') then
				if Enmity == 'ON' then
					equipSet = equipSet.Cure.Enmity
				else
					equipSet = equipSet.Cure
				end
			elseif spell.english:startswith('Cura') then
				if Enmity == 'ON' then
					equipSet = equipSet.Curaga.Enmity
				else
					equipSet = equipSet.Curaga
				end
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english == "Protectra V" then -- Equip Aug'ed Piety Duckbills +1 When You Cast Protectra V --
			equipSet = set_combine(equipSet,{feet="Piety Duckbills +1"})
		elseif spell.english == "Shellra V" then -- Equip Aug'ed Piety Pantaln. +1 When You Cast Shellra V --
			equipSet = set_combine(equipSet,{legs="Piety Pantaln. +1"})
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
		elseif spell.english:startswith('Bar') then
			equipSet = equipSet.Bar
		elseif spell.english:startswith('Regen') then
			equipSet = equipSet.Regen
		elseif spell.english:startswith('Banish') then
			equipSet = equipSet.Banish
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Holy') then
			equipSet = equipSet.Holy
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Reraise') then
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end 
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
				equip(sets.Midcast['Enhancing Magic'])
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end 
	equip(sets.Midcast['Enhancing Magic'])
	equip(equipSet)
end

function aftercast(spell,action)
	if canceled then
		canceled = false
		return
	else
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif spell.english == "Repose" or spell.english == "Sleep II" then -- Repose & Sleep II Countdown --
				send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
				send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Banish III" then -- Banish III Countdown --
				send_command('wait 35;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
			end
		end
		status_change(player.status)
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
		windower.send_command('jd 1 PDT stone')
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
		windower.send_command('jd 1 Sublimation water')
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
		windower.send_command('jd 1 Melee stone')
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
			windower.send_command('jd 1 Idle:'..IdleArray[IdleIndex])
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Arciela's Grace +1"})
		end
		--if world.area:endswith('Adoulin') then
		--	equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		--end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
		windower.send_command('jd 1 Resting water')
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == 'divine caress' then
		DC = gain
	elseif buff == 'Light Arts'and not player.buffactive['Dark Arts'] then
		send_command('input /ja "Light Arts" <me>')
	end
	
	if not midaction() then
		status_change(player.status)
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

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'test' then
		for k,v in pairs(windower.ffxi.get_party()) do
			windower.add_to_chat(2, tostring(k)..' '..tostring(v))
		end
	elseif command == 'automode' then -- TOGGLES BOT MODE
		AutoPlay()
	elseif command == 'AUTO' and autoplay == true then
		Auto()
	elseif command == 'follow' then
		Toggle_Follow()
	elseif command == 'melee' then
		AutoMelee_Toggle()
	elseif command == 'haste' then
		Haste()
		return
	elseif command == 'cc' then
		Critical_Cure()
		return
	elseif command == 'erase' then
		Erase()
		return
	elseif command == 'C1' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Follow Toggle --
		send_command('input /ta <p1>;input /lockon;wait .3;setkey numpad8 down;wait .3;setkey numpad7 down;wait .3;setkey numpad7 up;wait .3;setkey numpad8 up')
	elseif command == 'C3' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'PDT' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
			windower.send_command('jd 1 PDT stone')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Lock Main Weapon Toggle --
		if Lock_Main == 'ON' then
			Lock_Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		--add_to_chat(158,'TP Return: '..tostring(player.tp))
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" then
		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		--enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
		return originalCost*.9
	elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
		return originalCost*1.1
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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
	send_command('wait 5;input //gs c AUTO')
	if player.hpp == 0 then
		windower.add_to_chat(123,'----- YOU DIED ~ Altana show you dae wei -----')
		send_command('input //gs c automode')
		return
	end
	
	if follow == true then
		send_command('input /follow <p1>')
	end
	AutoMelee()

	-- Manage Self Buffs --
	if buffactive['Sublimation: Complete'] and player.mpp < 80 and windower.ffxi.get_ability_recasts()[234] == 0 and player.sub_job == 'SCH' then
		send_command('input /ja "Sublimation" <me>')
		return
	elseif not buffactive['Sublimation: Activated'] and not buffactive['Sublimation: Complete'] and windower.ffxi.get_ability_recasts()[234] == 0 and player.sub_job == 'SCH' then
		send_command('input /ja "Sublimation" <me>')
		return
	elseif not buffactive['Afflatus Solace'] and windower.ffxi.get_ability_recasts()[29] == 0 then
		send_command('input /ja "Afflatus Solace" <me>')
		return
	elseif not buffactive['Light Arts'] and not buffactive['Addendum: White'] and player.sub_job == 'SCH' then
		send_command('input /ja "Light Arts" <me>')
		return
	elseif not buffactive['Reraise'] and player.sub_job == 'SCH' then
		Pause_Follow()
		send_command('input /ja "Celerity" <me>;wait .5;input /ma "Reraise IV" <me>')
		return
	elseif not buffactive['Reraise'] then
		Pause_Follow()
		send_command('input /ma "Reraise III" <me>')
	end	
	-- Party Members - Is HP Critical?
	if Critical_Cure() == 1 then
		return
	end

	-- Party Members - Are we Enfeebled?
	for i=1, party.count do
		if Erase_Check(party[i]) == 1 then
			return
		end
	end
	-- Party Members - Is our HP topped off enough?
	for i=1, party.count do
		if Cure_Check(party[i]) == 1 then
			return
		end
	end
	
	-- Party Members - HASTE!?
	if Haste() == 1 then
		return 
	end

	if not buffactive['DEX Boost'] and player.in_combat == true then
		Pause_Follow()
		send_command('wait 2;input /ma "Boost-DEX" <me>')
		return 
	end
	return
end

function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(1, 6)
end