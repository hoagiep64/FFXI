-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --

--include('Follower.lua')
include('Paulu-Globals.lua')

augmentGear = {}
augmentGear.MerlinicMP ={ name="Merlinic Crackows", augments={'STR+3','DEX+1','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
augmentGear.MerlinicFC ={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
augmentGear.TelchineFTEnhancing={ name="Telchine Pigaches", augments={'"Waltz" potency +4%','Enh. Mag. eff. dur. +7',}}

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Lock_Main = 'On' -- Set Default Lock Main Weapon On or Off Here --
	Obi = 'On' -- Turn Default Obi On or Off Here --
	LowNuke = 'Off' -- Set Default Low Tier Nuke On or Off Here --
	MB = 'Off' -- Set Default MB On or Off Here --
	set_color = 'green'
	currentSet = IdleArray[IdleIndex]
	Elemental_Staff = 'Off' -- Set Default Precast Elemental Staff On or Off Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --
	
	autoarts = 'light' -- SCH's default Automode Arts
	nukeElement = 'Stone' -- Set nuking Elements for easier macros
	
	Job_Display_Update(1)
	Job_Display_Update(2)
	Job_Display_Update(3)
	
	
	Low_Tier_Spells = S{
			'Fire','Aero','Water','Blizzard','Stone','Thunder','Fire II','Aero II','Water II',
			'Blizzard II','Stone II','Thunder II'}

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix', 'Anemohelix II','Cryohelix II',
			'Geohelix II','Hydrohelix II','Ionohelix II','Luminohelix II','Noctohelix II','Pyrohelix II'}

	Storms = S{
			'Sandstorm II', 'Rainstorm II', 'Windstorm II', 'Firestorm II', 
			'Hailstorm II', 'Thunderstorm II', 'Voidstorm II', 'Aurorastorm II'}
			
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "LightArts", SC2 = "Perpetuance", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle Sets --
	sets.Idle.Refresh = {
		head="Befouled Crown",
		neck="Loricate Torque +1",
		lear="Genmei Earring",
		rear="Etiolation Earring",
		body="Jhakri Robe +2",
		hands="Amalric Gages +1",
		lring="Defending Ring",
		rring="Stikini Ring +1",
		back="Solemnity Cape",
		waist="Fucho-no-Obi",
		legs="Assiduity Pants +1",
		feet=augmentGear.MerlinicMP}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			feet="Herald's Gaiters"})
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = {}

	-- Sublimation Set --
	sets.Sublimation = set_combine(sets.Idle.Refresh,{
			feet="Herald's Gaiters"})

	sets.Precast = {}
	-- Fastcast Set (empty = To Fix Club/Staff Issue) --
	sets.Precast.FastCast = {
		--sub=empty,
		ammo="Impatiens",
        head="Amalric Coif +1",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Merlinic Jubbah",
        hands="Telchine Gloves",
        lring="Lebeche Ring",
        rring="Kishar Ring",
        --back="Swith Cape",
        waist="Witful Belt",
        legs="Lengo Pants",
        feet=augmentGear.MerlinicFC
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

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Cure Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast)
			--sub=empty

-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast)

	-- Cure Set --
	sets.Midcast.Cure = {
		head="Vanya Hood",
		neck="Phalania Locket",
		lear="Loquac. Earring",
		rear="Etiolation Earring",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		lring="Lebeche Ring",
		rring="Haoma's Ring",
		back="Solemnity Cape",
		waist="Witful Belt",
		legs="Chironic Hose",
		feet="Medium's Sabots"
	}

	-- Curaga Set --
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure)

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		head="Telchine Cap",
		neck="Incanter's Torque",
		body="Telchine Chas.",
		back="Fi Follet Cape +1",
		waist="Witful Belt",
		legs="Telchine Braconi",
		feet=augmentGear.TelchineFTEnhancing
	}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{neck="Stone Gorget", waist="Siegel Sash"})

	-- Cursna Set --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{waist="Gishdubar Sash", rring="Haoma Ring"})

	-- Regen Set --
	sets.Midcast.Regen = {head="Arbatel Bonnet +1", body="Telchine Chas.", back="Lugh's Cape", legs="Telchine Braconi", feet="Telchine Pigaches"}

	-- Stun Sets --
	sets.Midcast.Stun = {
		head="Jhakri Coronal +1",
		neck="Mizu. Kubikazari",
		lear="Novio Earring",
		rear="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		lring="Strendu Ring",
		rring="Strendu Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +2"
	}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
		head="Jhakri Coronal +1",
		neck="Mizu. Kubikazari",
		lear="Novio Earring",
		rear="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		lring="Strendu Ring",
		rring="Strendu Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +2"
	}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Low Tier Set --
	sets.LowNuke = {
		main="Akademos",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Mizu. Kubikazari",
		lear="Novio Earring",
		rear="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		rring="Strendu Ring",
		lring="Jhakri Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +2"	
	}

	-- MB Set --
	sets.MB = {
		main="Akademos",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Merlinic Hood",
		neck="Mizu. Kubikazari",
		lear="Novio Earring",
		rear="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Amalric Gages +1",
		rring="Mujin Band",
		lring="Jhakri Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Mallquis Trews +1",
		feet="Jhakri Pigaches +2"
	}

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
		main="Akademos",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Mizu. Kubikazari",
		lear="Novio Earring",
		rear="Friomisi Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		lring="Strendu Ring",
		rring="Strendu Ring",
		back="Lugh's Cape",
		waist="Eschan Stone",
		legs="Jhakri Slops +1",
		feet="Amalric Nails +1"
	}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
		main="Akademos",
		sub="Enki Strap",
		head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		lring="Balrahn's Ring",
		rring="Strendu Ring",
		back="Izdubar Mantle",
		waist="Luminary Sash",
		legs="Chironic Hose",
		feet="Jhakri Pigaches +2",
	}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})

	-- Impact --
	sets.Midcast.Impact = {
			body="Twilight Cloak"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {waist='Hachirin-no-Obi'}
	sets.Obi.Water = {waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {waist='Hachirin-no-Obi'}
	sets.Obi.Light = {waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA['Tabula Rasa'] = {legs="Peda. Pants +1"}

	-- Perpetuance --
	sets.Perpetuance = {hands="Arbatel Bracers +1"}

	-- Alacrity --
	sets.Alacrity = {feet="Peda. Loafers +1"}

	-- Rapture --
	sets.Rapture = {head="Arbatel Bonnet +1"}

	-- Melee Set --
	sets.Melee = {head="Befouled Crown", neck="Sanctity Necklace", lear="Digni. Earring", rear="Brutal Earring", body="Onca Suit"}

	-- WS Base Set --
	sets.WS = {}
	sets.WS.Shattersoul = {}
	sets.WS.Myrkr = {}
	sets.WS.Omniscience = {}

	-- Idle Reive Set --
	sets.Reive = {neck="Arciela's Grace +1"}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if not spell.english == 'Myrkr' and spell.target.distance > target_distance then -- Cancel WS If You Are Out Of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
			return
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
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
end

function precast(spell,action)
	--if spell.type == 'Magic' then
		--FollowPrecast() -- Follower.lua
	--end
	if spell.action_type == 'Magic' then
		if buffactive.silence  then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced]')
			return
		else
			if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
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
			--elseif sets.Precast[spell.skill] then
				--equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if sets.Precast[spell.element] and Elemental_Staff == 'On' then
		equip(sets.Precast[spell.element])
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if buffactive.Rapture then -- Equip Arbatel Bonnet +1 When Rapture Is Up For Curaga Spells --
				equipSet = set_combine(equipSet,sets.Rapture)
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
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
		elseif spell.english:startswith('Regen') then -- Equip Arbatel Bonnet +1 When You Cast Regen Spells --
			equipSet = equipSet.Regen
		elseif spell.english:startswith('Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif spell.english == "Stun" and buffactive.Alacrity and world.weather_element == 'Thunder' then -- Equip Peda. Loafers +1 When Alacrity Is Up And Thunder Weather --
			equipSet = set_combine(equipSet,sets.Alacrity)
		elseif Low_Tier_Spells:contains(spell.english) and LowNuke == 'On' then
			equipSet = set_combine(equipSet,sets.LowNuke)
		elseif spell.skill == 'Elemental Magic' and MB == 'On' then
			if buffactive.Klimaform and buffactive.Ebullience then
				equipSet = set_combine(equipSet,sets.MB, {head="Arbatel Bonnet +1",feet="Arbatel Loafers +1"})
			elseif buffactive.Klimaform then
				equipSet = set_combine(equipSet,sets.MB, {feet="Arbatel Loafers +1"})
			elseif buffactive.Ebullience then
				equipSet = set_combine(equipSet,sets.MB, {head="Arbatel Bonnet +1"})
			else
				equipSet = set_combine(equipSet,sets.MB)
			end
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
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'Elemental Magic' or spell.english:startswith('Cur') or spell.english:startswith('Bio') or spell.english:startswith('Dia') or spell.english == 'Aspir' or spell.english == 'Drain') and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'On' and spell.english ~= "Cursna" then -- Use Obi Toggle To Equip Normal Waist Gear --
				if buffactive.Klimaform and buffactive.Ebullience then
					equipSet = set_combine(equipSet,sets.Obi[spell.element], {head="Arbatel Bonnet +1",feet="Arbatel Loafers +1"})
				elseif buffactive.Klimaform then
					equipSet = set_combine(equipSet,sets.Obi[spell.element],{feet="Arbatel Loafers +1"})
				elseif buffactive.Ebullience then
					equipSet = set_combine(equipSet,sets.Obi[spell.element],{head="Arbatel Bonnet +1"})
				else		
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
				end
			end
		end
	end
	if buffactive.Perpetuance and spell.skill == "Enhancing Magic" then -- Equip Arbatel Bracers +1 When You Cast Enhancing Spells --
			equipSet = set_combine(sets.Midcast['Enhancing Magic'], { hands='Arbatel Bracers +1' })
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	if buffactive.Klimaform and buffactive.Ebullience then
		equipSet = set_combine(equipSet,{head="Arbatel Bonnet +1",feet="Arbatel Loafers +1"})
		equip(equipSet)
	elseif buffactive.Klimaform then
		equipSet = set_combine(equipSet,{feet="Arbatel Loafers +1"})
		equip(equipSet)
	elseif buffactive.Ebullience then
		equipSet = set_combine(equipSet,{head="Arbatel Bonnet +1"})
		equip(equipSet)
	else
		equip(equipSet)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING Off IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING Off IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING Off IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING Off IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING Off IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING Off IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING Off IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,sets.Reive)
		end
		--if world.area:endswith('Adoulin') then
			--equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		--end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)

	if buff == 'weakness' then -- Weakness Timer --
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

-- Paulu's Auto On/Off Toggle --
	if command == 'automode' then
		AutoPlay()
		return
-- Paulu's Automode --
	elseif command == 'AUTO' and autoplay == true then
		automode()
		return
	elseif command == 'follow' then
		Toggle_Follow()
		return
-- TEST COMMAND -- 
	elseif command == 'test' then
		Job_Display_Update(2)
		return
------------------
-- Nukes with pre-set element of the Tier matching the command. --
    elseif command == 'T1' then
		send_command('input /ma "'..nukeElement..'" <t>')
		return
    elseif command == 'T2' then
		send_command('input /ma "'..nukeElement..' II" <t>')
		return
    elseif command == 'T3' then
		send_command('input /ma "'..nukeElement..' III" <t>')
		return   
    elseif command == 'T4' then
		send_command('input /ma "'..nukeElement..' IV" <t>')
		return 
    elseif command == 'T5' then
		send_command('input /ma "'..nukeElement..' V" <t>')
		return       
    elseif command == 'T6' then
		send_command('input /ma "'..nukeElement..' VI" <t>')
		return 
    elseif command == 'aga' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Stoneaga" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Waterga" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Aeroga" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Firaga" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Blizzaga" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Thundaga" <t>')
			return
		end
		return 
	  elseif command == 'aga2' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Stoneaga II" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Waterga II" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Aeroga II" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Firaga II" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Blizzaga II" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Thundaga II" <t>')
			return
		end
		return 
	elseif command == 'storm1' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Sandstorm" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Rainstorm" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Windstorm" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Firestorm" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Hailstorm" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Thunderstorm" <t>')
			return
		elseif nukeElement == 'Dark' then
			send_command('input /ma "Voidstorm" <t>')
			return
		elseif nukeElement == 'Light' then
			send_command('input /ma "Aurorastorm" <t>')
			return
		end
		return
	elseif command == 'storm2' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Sandstorm II" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Rainstorm II" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Windstorm II" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Firestorm II" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Hailstorm II" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Thunderstorm II" <t>')
			return
		elseif nukeElement == 'Dark' then
			send_command('input /ma "Voidstorm II" <t>')
			return
		elseif nukeElement == 'Light' then
			send_command('input /ma "Aurorastorm II" <t>')
			return
		end
		return 
	elseif command == 'helix' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Geohelix" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Hydrohelix" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Anemohelix" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Pyrohelix" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Hydrohelix" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Ionohelix" <t>')
			return
		elseif nukeElement == 'Dark' then
			send_command('input /ma "Noctohelix II" <t>')
			return
		elseif nukeElement == 'Light' then
			send_command('input /ma "Luminohelix II" <t>')
			return
		end
		return 
	elseif command == 'helix2' then
		if nukeElement == 'Stone' then
			send_command('input /ma "Geohelix II" <t>')
			return
		elseif nukeElement == 'Water' then
			send_command('input /ma "Hydrohelix II" <t>')
			return
		elseif nukeElement == 'Aero' then
			send_command('input /ma "Anemohelix II" <t>')
			return
		elseif nukeElement == 'Fire' then
			send_command('input /ma "Pyrohelix II" <t>')
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /ma "Cryohelix II" <t>')
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /ma "Ionohelix II" <t>')
			return
		elseif nukeElement == 'Dark' then
			send_command('input /ma "Noctohelix II" <t>')
			return
		elseif nukeElement == 'Light' then 
			send_command('input /ma "Luminohelix II" <t>')
			return
		end
		return 
-- Sets the Element in which to nuke with. --
    elseif command == 'Stone' then       
		nukeElement = 'Stone'
		Job_Display_Update(3)
		return
    elseif command == 'Water' then       
		nukeElement = 'Water'
		Job_Display_Update(3)
		return
    elseif command == 'Aero' then       
		nukeElement = 'Aero'
		Job_Display_Update(3)
		return
    elseif command == 'Fire' then       
		nukeElement = 'Fire'
		Job_Display_Update(3)
		return
    elseif command == 'Blizzard' then       
		nukeElement = 'Blizzard'
		Job_Display_Update(3)
		return
    elseif command == 'Thunder' then       
		nukeElement = 'Thunder'
		Job_Display_Update(3)
		return
	elseif command == 'Dark' then       
		nukeElement = 'Dark'
		Job_Display_Update(3)
		return
	elseif command == 'Light' then       
		nukeElement = 'Light'
		Job_Display_Update(3)
		return
		
	elseif command == 'C1' then -- Magic Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Magic Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'On' then
			Obi = 'Off'
			add_to_chat(123,'Obi: [Off]')
		else
			Obi = 'On'
			add_to_chat(158,'Obi: [On]')
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
	elseif command == 'C15' then -- LowNuke Toggle --
		if LowNuke == 'On' then
			LowNuke = 'Off'
			add_to_chat(123,'Low Nuke: [Off]')
		else
			LowNuke = 'On'
			add_to_chat(158,'Low Nuke: [On]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- MB Toggle --
		if MB == 'On' then
			MB = 'Off'
			Job_Display_Update(2)
			add_to_chat(123,'MB: [Off]')
		else
			MB = 'On'
			Job_Display_Update(2)
			add_to_chat(158,'MB: [On]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Lock Main Weapon Toggle --
		if Lock_Main == 'On' then
			Lock_Main = 'Off'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'On'
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
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
		
-- SKILLCHAINS --
	elseif command == 'sc1' then
		if nukeElement == 'Stone' then
			send_command('input /p           [Stone] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Aero" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Stone" <t>;wait .5;input /p           [Stone] Skillchain \(COMPLETE\)')
			return
		elseif nukeElement == 'Water' then
			send_command('input /p           [Water] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Stone" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Water" <t>;wait .5;input /p           [Water] Skillchain \(COMPLETE\)')	
			return
		elseif nukeElement == 'Aero' then
			send_command('input /p           [Aero] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Stone" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Aero" <t>;wait .5;input /p           [Aero] Skillchain \(COMPLETE\)')		
			return
		elseif nukeElement == 'Fire' then
			send_command('input /p           [Fire] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Stone" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Fire" <t>;wait .5;input /p           [Fire] Skillchain \(COMPLETE\)')			
			return
		elseif nukeElement == 'Blizzard' then
			send_command('input /p           [Blizzard] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Water" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Blizzard" <t>;wait .5;input /p           [Blizzard] Skillchain \(COMPLETE\)')				
			return
		elseif nukeElement == 'Thunder' then
			send_command('input /p           [Thunder] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Water" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Thunder" <t>;wait .5;input /p           [Thunder] Skillchain \(COMPLETE\)')					
			return
		elseif nukeElement == 'Dark' then
			send_command('input /p           [Dark] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Blizzard" <t>;wait 4/;input /ja "Immanence" <me>;wait 1;input /ma "Noctohelix" <t>;wait 2;input /p           [Dark] Skillchain \(COMPLETE\)')									
			return
		elseif nukeElement == 'Light' then
			send_command('input /p           [Fusion] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Fire" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Thunder" <t>;wait .5;input /p           [Fusion] Skillchain \(COMPLETE\)')								
			return
		end
	elseif command == 'sc2' then
		if nukeElement == 'Thunder' or nukeElement == 'Aero' then
			send_command('input /p           [Fragmentation] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Blizzard" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Water" <t>;wait .5;input /p           [Fragmentation] Skillchain \(COMPLETE\)')								
			return
		elseif nukeElement == 'Blizzard' or nukeElement == 'Water' then
			send_command('input /p           [Distortion] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Luminohelix" <t>;wait 7;input /ja "Immanence" <me>;wait 1;input /ma "Stone" <t>;wait .5;input /p           [Distortion] Skillchain \(COMPLETE\)')								
			return
		elseif nukeElement == 'Light' or nukeElement == 'Fire' then
			send_command('input /p           [Fusion] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Fire" <t>;wait 5;input /ja "Immanence" <me>;wait 1;input /ma "Thunder" <t>;wait .5;input /p           [Fusion] Skillchain \(COMPLETE\)')								
			return
		elseif nukeElement == 'Dark' or nukeElement == 'Earth' then
			send_command('input /p           [Gravitation] Skillchain \(START\)')
			send_command('input /ja "Immanence" <me>;wait 1;input /ma "Aero" <t>;wait 4;input /ja "Immanence" <me>;wait 1;input /ma "Noctohelix" <t>;wait 2;input /p           [Gravitation] Skillchain \(COMPLETE\)')								
			return
		end
-- END SKILLCHAINS --
	elseif command == 'S1' then -- Strategem 1: Parsimony / Penury --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Penury <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Parsimony <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command == 'S2' then -- Strategem 2: Celerity / Alacrity --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Celerity <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Alacrity <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command == 'S3' then -- Strategem 3: Ebullience / Rapture --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Rapture <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Ebullience <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command == 'S4' then -- Strategem 4: Manifestation / Accession --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Accession <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Manifestation <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command == 'S5' then -- Strategem 5: Immanence / Perpetuance --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Perpetuance <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Immanence <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command == 'S6' then -- Strategem 6: Focalization / Altruism --
		if buffactive['Light Arts'] or buffactive['Addendum: White'] then
			send_command('input /ja Altruism <me>')
		elseif
			buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
			send_command('input /ja Focalization <me>')
		else
			add_to_chat(123,'No Active Arts')
		end
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	elseif Lock_Main == 'On' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: [Current MP = ' .. player.mp .. ' | ' .. player.mpp .. '%] Using '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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

function automode()
	if autoplay == false then
		return
	end
	send_command('wait 5;input //gs c AUTO')
	if Too_Far_Check() == 1 then
		return 
	end
	--Hang_Back()
	--if player.status ~='Engaged' then -- Follow and assist the party leader if not engaged
		--send_command('input /assist <p1>;wait 1.5;input /attack;wait .3;input /follow <p1>')
	--end	
	if buffactive['Sublimation: Complete'] and player.mpp < 100 then
		send_command('input /ja "Sublimation" <me>')
		return
	elseif not buffactive['Sublimation: Activated'] and not buffactive['Sublimation: Complete'] and windower.ffxi.get_ability_recasts()[234] == 0 then
		send_command('input /ja "Sublimation" <me>')
		return
	elseif autoarts == 'light' then
		if not buffactive['Addendum: White'] then
			send_command('input /ja "Light Arts" <me>')
			return
		elseif windower.ffxi.get_spell_recasts()[864] == 0 and not buffactive['Aurorastorm'] then
			Pause_Follow()
			send_command('input /ja "Perpetuance" <me>;wait .7;input /ma "Aurorastorm II" <me>')
			return
		elseif player.in_combat == true and not party[2].buffactive[42] then
			Pause_Follow()
			send_command('input /ja "Perpetuance" <me>;wait 1.5;input /ja "Accession" <me>;wait .5;input /ma "Regen V" <p1>')
			return
		elseif player.in_combat == true and not buffactive['Barsleep'] and Strategem_Count() > 2 then
			Pause_Follow()
			windower.send_command('Celerity;wait 1.5;Perpetuance;wait 1.5;Barsleepra')
			return
		elseif not party[2].buffactive[170] and party[2].mob.distance:sqrt() < 14 and Strategem_Count() > 1 then -- Adlo
			Pause_Follow()
			windower.send_command('Perpetuance;wait 1.5;input /ma "Adloquium" <p1>')
			return
		-- Defined in Paulu-Globals.lua -- 
		-- Party Members - Is anyone HP Critical?
		elseif Critical_Cure() == 1 then
			return 
		-- Party Members - HASTE!?
		elseif Haste() == 1 then
			return 
		-- Party Members - Erase/-na's
		elseif Erase() == 1 then
			return 
		-- Party Members - Is our HP topped off enough?
		elseif Cure() == 1 then
			return 
		--- END - Defined in Paulu-Globals.lua --
		
		elseif player.in_combat == true then
			if not buffactive['Phalanx'] and (party[2].mob.distance/20) < 10 and player.sub_job == 'RDM' then
				Pause_Follow()
				send_command('input /ja "Perpetuance" <me>;wait 1.5;input /ja "Accession" <me>;wait 1;input /ma "Phalanx" <me>')
			--elseif buffactive['Regen'] and player.mpp > 74 then
				--autoarts = 'dark'
				return
			end
		end
	else
		--[[if player.mpp < 20 or not buffactive['Regen'] then
			autoarts = 'light'
		--elseif player.status ~= 'Engaged' then
		--send_command('wait 1;input /attack')
		elseif not buffactive['Dark Arts'] then
			send_command('input /ja "Dark Arts" <me>')
		--elseif player.tp > 1000 then
			--send_command('input /ws "Shattersoul" <t>')
		elseif party[2].mob.status == 1 and ((party[2].mob.distance)/10) < 5 then
			send_command('input /assist <p1>')
				windower.send_command('setkey numpad7 down; wait 0.2;setkey numpad7 up')
				send_command('wait 1;input /ma "Thunder" <bt>')
				send_command('wait 1;input /ma "Thunder" <t>')

		else
			--send_command('input /assist <p1>')
			--if player.target == 'MOnSTER' then
				--send_command('wait 1;input /ma "Thunder III" <t>')
			--end
		end--]]
	end
end
		
-- Paulu's Automode END --

function Job_Display_Update(number) -- For use with JobDisplay.lua
	local num = number
	
	if num == 1 then
		windower.send_command('jd set '..num..' '..currentSet..'')
	elseif num == 2 then
		if MB == 'On' then
			windower.send_command('jd 7 MB: '..MB..' green')
		else
			windower.send_command('jd 7 MB: '..MB..' red')
		end
	elseif num == 3 then
		windower.send_command('jd 8 Element: '..nukeElement..' '..nukeElement)
	end
end

function Strategem_Count()
	local recast = windower.ffxi.get_ability_recasts()[231]
	local val = 0
	if recast == 0 then
		val = 4
	elseif recast < 33 then
		val = 3
	elseif recast < 66 then
		val = 2
	elseif recast < 99 then
		val = 1
	else
		val = 0
	end	
	return tonumber(val)
end

function select_default_macro_book()
	-- Default macro set/book
		set_macro_page(1, 18)
end