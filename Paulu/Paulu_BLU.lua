-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --
--include('Follower.lua')
include('Paulu-Globals.lua')

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement -- ,"Regen"
	Armor = 'None'
	target_distance = 5 -- Set Default Distance Here --
	pdt = 'false'
	autorift = 'true'
	yourtargetid = 17056472
	-- 17056472 -- Morta Rift 1
	
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="ChantduCygne", SC2="Berserk", SC3="HeadButt"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Physical Type BlueMagic --
	Physical_BlueMagic = S{
			'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite',
			'Queasyshroom','Power Attack','Ram Charge','Screwdriver','Sickle Slash',
			'Smite of Rage','Spinal Cleave','Spiral Spin','Sweeping Gouge','Terror Touch'}

	-- Physical Type BlueMagic: STR Modifier --
	Physical_BlueMagic_STR = S{
			'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
			'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
			'Whirl of Rage'}

	-- Physical Type BlueMagic: STR + DEX Modifiers --
	Physical_BlueMagic_DEX = S{
			'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
			'Sinker Drill','Thrashing Assault','Vanity Dive'}

	-- Physical Type BlueMagic: STR + VIT Modifiers --
	Physical_BlueMagic_VIT = S{
			'Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Quad. Continuum',
			'Sprout Smack'}

	-- Physical Type BlueMagic: STR + AGI Modifiers --
	Physical_BlueMagic_AGI = S{
			'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
			'Wild Oats'}

	-- Magical Type BlueMagic --
	Magical_BlueMagic = S{
			'Acrid Stream','Atra. Libations','Dark Orb','Droning Whirlwind','Embalming Earth',
			'Evryone. Grudge','Firespit','Foul Waters','Gates of Hades','Leafstorm',
			'Magic Hammer','Molting Plumage','Nectarous Deluge','Rail Cannon','Regurgitation',
			'Rending Deluge','Self-Destruct','Tem. Upheaval','Thermal Pulse','Water Bomb'}

	-- Low Accuracy Type BlueMagic --
	BlueMagic_Accuracy = S{
			'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
			'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
			'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
			'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
			'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
			'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
			'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
			'Subduction','Triumphant Roar','Venom Shell','Voracious Trunk','Yawn'}

	-- Breath Type BlueMagic --
	BlueMagic_Breath = S{
			'Bad Breath','Diffusion Ray','Flying Hip Press','Final Sting','Frost Breath',
			'Heat Breath','Magnetite Cloud','Poison Breath','Radiant Breath','Thunder Breath',
			'Vapor Spray','Wind Breath'}

	-- Buff Type BlueMagic --
	BlueMagic_Buff = S{
			'Barrier Tusk','Carcharian Verve','Diamondhide','Metallic Body','Magic Barrier',
			"Occultation",'Orcish Counterstance','Nature\'s Meditation','Plasma Charge',
			'Pyric Bulwark','Reactor Cool'}

	-- Diffusion Compatible Type BlueMagic --
	BlueMagic_Diffusion = S{
			'Amplification','Cocoon','Erratic Flutter','Exuviation','Feather Barrier',
			'Harden Shell','Memento Mori','Metallic Body','Plasma Charge','Reactor Cool',
			'Refueling','Saline Coat','Warm-Up','Zephyr Mantle'}

	-- Healing Type BlueMagic --
	BlueMagic_Healing = S{
			'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
			'Wild Carrot'}

	-- Stun Type BlueMagic --
	BlueMagic_Stun = S{
			'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
			'Thunderbolt','Whirl of Rage'}

	-- Unbridled Learning Type BlueMagic --
	BlueMagic_Unbridled = S{
			'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
			'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
			'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'}

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Movement = {
		ammo="Staunch Tathlum +1",
		head="Rawhide Mask",
		neck="Loricate Torque +1",
		lear="Genmei Earring",
		rear="Etiolation Earring",
		body="Jhakri Robe +2",
		hands="Umuthi Gloves",
		lring="Defending Ring",
		rring="Stikini Ring +1",
		back="Solemnity Cape",
		waist="Fucho-no-Obi",
		legs="Carmine Cuisses +1",
		feet="Aya. Gambieras +1"
	}
	sets.Idle.Refresh = set_combine(sets.Idle.Movement,{
			head="Rawhide Mask",
			body="Jhakri Robe +2",
			--hands="Serpentes Cuffs",
			legs="Lengo Pants"
			--feet="Serpentes Sabots"
			})
	sets.Resting = set_combine(sets.Idle.Refresh)

	-- Normal TP Sets --
	sets.TP = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		lear="Suppanomimi",
		rear="Cessance Earring",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		lring="Epona's Ring",
		rring="Hetairoi Ring",
		back="Rosmerta's Cape",
		waist="Sarissapho. Belt",
		legs="Herculean Trousers",
		--legs="Samnuha Tights",
		feet="Herculean Boots"
	}
	sets.TP.MidACC = set_combine(sets.TP,{})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{})

	-- March x2 + Haste --
	-- Embrava + (March or Haste) --
	-- Geo Haste + (March or Haste or Embrava) --
	sets.TP.HighHaste =  set_combine(sets.TP,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	-- PDT/MDT Sets --
	sets.PDT = set_combine(sets.TP,{
		ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Umuthi Gloves",
		neck="Loricate Torque +1",
		lear="Genmei Earring",
		rear="Colossus\'s Earring",
		lring="Defending Ring",
		rring="Dark Ring",
		wait="Flume Belt",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		back="Solemnity Cape"
	})

	sets.MDT = set_combine(sets.TP,{
		ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		neck="Loricate Torque +1",
		rear="Etiolation Earring",
		lring="Defending Ring",
		rring="Dark Ring",
		waist="Sailfi Belt +1",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		back="Solemnity Cape"
	})
	
		sets.MDTshell = set_combine(sets.MDT,{
		ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		neck="Warder's Charm +1",
		rear="Etiolation Earring",
		lring="Defending Ring",
		rring="Shadow Ring",
		legs="Aya. Cosciales +1",
		feet="Aya. Gambieras +1",
		back="Engulfer Cape"
	})

	-- Hybrid Sets --
	sets.TP.Hybrid = set_combine(sets.PDT,{})
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Fotia Gorget",
		lear="Dignitary's Earring",
		rear="Ishvara Earring",
		body="Herculean Vest",
		hands="Adhemar Wrist. +1",
		lring="Epona's Ring",
		rring="Hetairoi Ring",
		back="Rosmerta's Cape",
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}

	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
		ammo="Ginsen",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		lear="Dignitary's Earring",
		rear="Ishvara Earring",
		body="Adhemar Jacket +1",
		hands="Adhemar Wrist. +1",
		lring="Epona's Ring",
		rring="Hetairoi Ring",
		back="Rosmerta's Cape",
		waist="Fotia Belt",
		legs="Samnuha Tights",
		feet="Thereoid Greaves"
	}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})

	sets.WS.Requiescat = {}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

	sets.WS.Expiacion = {}
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion,{})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{})

	sets.WS["Sanguine Blade"] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Fotia Gorget",
		lear="Friomisi Earring",
		rear="Novio Earring",
		body="Jhakri Robe +2",
		hands="Amalric Gages +1",
		lring="Jhakri Ring",
		rring="Strendu Ring",
		back="Izdubar Mantle",
		waist="Fotia Belt",
		legs="Jhakri Slops +1",
		feet="Amalric Nails +1"
	}
	sets.WS["Sanguine Blade"].MidACC = set_combine(sets.WS["Sanguine Blade"],{})
	sets.WS["Sanguine Blade"].HighACC = set_combine(sets.WS["Sanguine Blade"],{})
	
	sets.WS['Realmrazer'] = set_combine(sets.WS,{
		neck="Fotia Gorget",
		waist="Fotia Belt",
	})
	
	sets.JA = {}
	-- JA Sets --
	sets.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}

	sets['Chain Affinity'] = {body="Hashishin Kavuk +1"}

	sets.Efflux = {legs="Hashishin Tayt +1"}

	sets['Burst Affinity'] = {feet="Hashi. Basmak +1"}

	sets.Convergence = {head="Luh. Keffiyeh +1"}

	sets.Diffusion = {feet="Luhlaza Charuqs +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
		ammo="Impatiens",
		head="Amalric Coif +1",
		body="Vrikodara Jupon",
		hands="Leyline Gloves",
		neck="Orunmila\'s Torque",
		waist="Witful Belt",
		lear="Loquac. Earring",
		lring="Prolix Ring",
		legs="Lengo Pants",
		rear="Etiolation Earring",
		rring="Kishar Ring",
		feet="Luhlaza Charuqs +1"
	}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{})

	-- Enhancing Magic Base Set --
	sets.Midcast['Enhancing Magic'] = {}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Cure/Curaga Spells & Healing Type BlueMagic --
	sets.Midcast.Cure = {
		neck="Phalaina Locket",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		lring="Lebeche Ring",
		rring="Haoma's Ring",
		back="Solemnity Cape",
		waist="Witful Belt",
		legs="Lengo Pants",
		feet="Medium's Sabots"
	}

	-- Physical Type BlueMagic --
	sets.Midcast.Physical_BlueMagic = {
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		lear="Vulcan\'s Pearl",
		rear="Flame Pearl",
		body="Assim. Jubbah +3",
		hands="Adhemar Wrist. +1",
		lring="Ifrit Ring",
		rring="Ifrit Ring",
		back="Cornflower Cape",
		waist="MetalSinger Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	}

	-- Physical Type BlueMagic: STR Modifier --
	sets.Midcast.Physical_BlueMagic_STR = set_combine(sets.Midcast.Physical_BlueMagic,{
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		lear="Vulcan\'s Pearl",
		rear="Flame Pearl",
		body="Assim. Jubbah +3",
		hands="Adhemar Wrist. +1",
		lring="Ifrit Ring",
		rring="Ifrit Ring",
		back="Cornflower Cape",
		waist="MetalSinger Belt",
		legs="Samnuha Tights",
		feet="Herculean Boots"
	})

	-- Physical Type BlueMagic: STR/DEX Modifiers --
	sets.Midcast.Physical_BlueMagic_DEX = set_combine(sets.Midcast.Physical_BlueMagic,{})
	sets.Midcast['Sinker Drill'] = set_combine(sets.Midcast.Physical_BlueMagic_DEX,{})

	-- Physical Type BlueMagic: STR/VIT Modifiers --
	sets.Midcast.Physical_BlueMagic_VIT = set_combine(sets.Midcast.Physical_BlueMagic,{})

	-- Physical Type BlueMagic: STR/AGI Modifiers --
	sets.Midcast.Physical_BlueMagic_AGI = set_combine(sets.Midcast.Physical_BlueMagic,{})

	-- Magical Type BlueMagic --
	sets.Midcast.Magical_BlueMagic = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		lear="Friomisi Earring",
		rear="Novio Earring",
		body="Jhakri Robe +2",
		hands="Amalric Gages +1",
		lring="Jhakri Ring",
		rring="Strendu Ring",
		back="Cornflower Cape",
		waist="Eschan Stone",
		legs="Jhakri Slops +1",
		feet="Amalric Nails +1"
	}

	-- Low Accuracy Type BlueMagic --
	sets.Midcast.BlueMagic_Accuracy = {
		ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",
		neck="Mirage Stole +2",
		lear="Digni. Earring",
		rear="Gwati Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +1",
		lring="Stikini Ring",
		rring="Etana Ring",
		back="Cornflower Cape",
		waist="Luminary Sash",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +2"
	}

	-- Stun Type BlueMagic --
	sets.Midcast.BlueMagic_Stun = set_combine(sets.Midcast.BlueMagic_Accuracy,{})

	-- Buff Type BlueMagic --
	sets.Midcast.BlueMagic_Buff = {
		ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +1",
		neck="Mirage Stole +2",
		body="Assim. Jubbah +3",
		hands="Assim. Bazu. +1",
		lring="Stikini Ring",
		rring="Stikini Ring +1",
		back="Cornflower Cape",
		legs="Hashishin Tayt +1",
		feet="Luhlaza Charuqs +1"
	}

	-- Breath Type BlueMagic --
	sets.Midcast.BlueMagic_Breath = {}
	
	sets.Midcast['Battery Charge'] = set_combine(sets.Precast.FastCast, {head="Amalric Coif +1"})
	sets.Midcast['Tenbral Crush'] = set_combine(sets.Midcast.Magical_BlueMagic, {head="Pixie Hairpin +1"})
--	BlueMagic --
	--sets.Midcast['Blue Magic'] = set_combine(sets.Precast.FastCast,{})

	-- Charged Whisker --
	sets.Midcast['Charged Whisker'] = set_combine(sets.Midcast.Magical_BlueMagic,{})
end

function pretarget(spell,action)
	if spell.name == 'Cobalt Cell' or spell.name == 'Rubicund Cell' and autorift == 'true' then
		change_target(tostring(yourtargetid))
	--elseif spell.name == 'Sudden Lunge' then
		--send_command('input /target '..change_target(tostring(yourtargetid)))
	elseif spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
		add_to_chat(257,'Silenced -- Using Echo Drops')
	elseif spell.english == "Berserk" and windower.ffxi.get_ability_recasts()[1] ~= 0 then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif BlueMagic_Unbridled:contains(spell.english) and not buffactive['Unbridled Learning'] then
		if windower.ffxi.get_ability_recasts()[81] < 1 and not buffactive.amnesia and not buffactive.charm then -- Auto Use Unbridled Learning When You Cast One of The Unbridled Spells.
			cancel_spell()
			send_command('input /ja "Unbridled Learning" <me>;wait 1.5;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'WeaponSkill Cancelled: [Disengaged]')
			return
		elseif spell.target.distance > (3 + spell.target.model_size) then
			cancel_spell()
			add_to_chat(123,'WeaponSkill Cancelled: [Out of Range]')
			if autoplay == true then
				send_command('input /ja "Provoke" <t>')
			return
			end
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
			if spell.english == "Chant du Cygne" and player.tp > 2990 then
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if spell.name == 'Chain Affinity' and windower.ffxi.get_ability_recasts()[181] ~= 0 then
			cancel_spell()
			send_command('input /ja "Efflux" <me>')
		elseif sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
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
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.type == 'Trust' then
		equip(sets.Precast.FastCast)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (spell.english:startswith('Cur') or BlueMagic_Healing:contains(spell.english)) and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') or BlueMagic_Healing:contains(spell.english) then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist='Hachirin-no-Obi'})
			end
		elseif Physical_BlueMagic:contains(spell.english) or Physical_BlueMagic_STR:contains(spell.english) or Physical_BlueMagic_DEX:contains(spell.english) or Physical_BlueMagic_VIT:contains(spell.english) or Physical_BlueMagic_AGI:contains(spell.english) then
			if Physical_BlueMagic_STR:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_STR
			elseif Physical_BlueMagic_DEX:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_DEX
			elseif Physical_BlueMagic_VIT:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_VIT
			elseif Physical_BlueMagic_AGI:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_AGI
			elseif Physical_BlueMagic:contains(spell.english) then
				equipSet = equipSet.Physical_BlueMagic
			end
			if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,sets['Chain Affinity'])
			end
			if buffactive.Efflux then
				equipSet = set_combine(equipSet,sets.Efflux)
			end
		elseif Magical_BlueMagic:contains(spell.english) or spell.english == "Charged Whisker" then
			if Magical_BlueMagic:contains(spell.english) then
				equipSet = equipSet.Magical_BlueMagic
			elseif spell.english == "Charged Whisker" then
				equipSet = equipSet[spell.name]
			end
			if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet,sets['Burst Affinity'])
			end
			if buffactive.Convergence then
				equipSet = set_combine(equipSet,sets.Convergence)
			end
		elseif BlueMagic_Accuracy:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Accuracy
		elseif BlueMagic_Stun:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Stun
		elseif BlueMagic_Buff:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Buff
		elseif BlueMagic_Diffusion:contains(spell.english) and buffactive.Diffusion then
			equipSet = set_combine(equipSet,sets.Diffusion)
		elseif BlueMagic_Breath:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Breath
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
		send_command('wait 0.2;gs c TP blizzard')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		if buffactive['Shell'] then
			equip(sets.MDTshell)
		else
			equip(sets.MDT)
		end
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Embrava and (buffactive.March or buffactive.Haste)) or (buffactive.March == 2 and buffactive.Haste) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava)) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
			windower.send_command('jd set 1 '..IdleArray[IdleIndex]..' gray')
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Adoulin\'s Refuge +1"})
		end
		--if world.area:endswith('Adoulin') then
			--equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		--end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
		windower.send_command('jd set 1  Resting')
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down')
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
	if command == 'automode' then -- TOGGLES BOT MODE
		AutoPlay()
	elseif command == 'AUTO' and autoplay == true then
		Auto()
	elseif command == 'test' then
		print(windower.ffxi.get_spell_recasts()['710'])
	elseif command == 'LIBRA' then
		add_to_chat(158,'player.target.id: ' .. player.target.id)
		add_to_chat(158,'player.target.index: ' .. player.target.index)
	elseif command == 'attune' then
		if player.target ~= nil then
			yourtargetid = player.target.id
			yourtarget = (tostring(yourtargetid))
			mobname = (tostring(player.target.name))
			add_to_chat(158,'Now attuned to: '..mobname..' ['..yourtarget..']')
			send_command('input /attack '..yourtargetid'')
		end
	elseif command == 'target' then
		send_command('input /attack '..yourtargetid'')
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
			windower.send_command('jd set 1 TP blizzard')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
			windower.send_command('jd set 1 '..Armor..' stone')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
			windower.send_command('jd set 1  TP blizzard')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
			windower.send_command('jd set 1  '..Armor..' water')
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
		if Armor ~= 'None' then -- Remove DT set lock --
			Armor = 'None'
			windower.send_command('jd set 1 TP blizzard')
			IdleIndex = (IdleIndex % #IdleArray) + 1
			add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
			status_change(player.status)
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			IdleIndex = (IdleIndex % #IdleArray) + 1
			add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
			status_change(player.status)
		end
	elseif command == 'TP' then
		--add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" then
		disable('back')
	else
		enable('ring1','ring2')
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
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
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
	send_command('wait 5;input //gs c AUTO')
	if player.hpp < 60 then	
		Armor = 'PDT'
		windower.send_command('jd set 1  '..Armor)
		status_change(player.status)
	elseif pdt == 'true' and player.hpp > 59 then
		Armor = 'None'
		windower.send_command('jd set 1  TP blizzard')
		status_change(player.status)
	end
	MyProject_Target_Fix()
	if player.status ~= 'Engaged' and follow == true then
		send_command('input /assist <p1>;wait 1.5;input /attack;wait .3;input /follow <p1>')
	elseif player.status == 'Engaged' and player.target.distance > 3 and windower.ffxi.get_ability_recasts()[5] == 0 then
		send_command('input /ja "Provoke" <t>')
	elseif windower.ffxi.get_ability_recasts()[184] == 0 then -- Diffusion
		send_command('input /ja "Diffusion" <me>')
	elseif windower.ffxi.get_ability_recasts()[81] == 0 and windower.ffxi.get_ability_recasts()[184] >= 270 then
		send_command('input /ja "Unbridled Learning" <me>')
	elseif buffactive['Unbridled Learning'] and player.status == 'Engaged' then
		Pause_Follow()
		send_command('input /ma "Mighty Guard" <me>')
	elseif player.status == 'Engaged' and not buffactive['Haste'] then
		Pause_Follow()
		send_command('wait.5;input /ma "Erratic Flutter" <me>')
	--elseif not buffactive['Attack Boost'] then
	--	Pause_Follow()
		--send_command('input /ma "Nat. Meditation" <me>')
	elseif windower.ffxi.get_ability_recasts()[1] == 0 or windower.ffxi.get_ability_recasts()[4] == 0 then
		send_command('input /ja "Berserk" <me>')
	--elseif not buffactive['Refresh'] then
		--Pause_Follow()
		--send_command('input /ma "Battery Charge" <me>')
	elseif player.hpp < 70 then
		send_command('input /ma "Magic Fruit" <me>')
	elseif not buffactive['Refresh'] then
		windower.send_command('Battery Charge')
	elseif player.tp > 1000 then
		send_command('input /ws "Chant du Cygne" <t>')
	end
end

function select_default_macro_book()
	-- Default macro set/book
		set_macro_page(4, 2)
		send_command('wait 2;input /lockstyleset 19') -- Changes Lockstyle because... FABULOUS
		windower.send_command('jd set 1 TP blizzard')
end