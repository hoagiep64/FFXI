include('custom.lua')

function get_sets()
	custom.is_debugging = false
	
	augmentGear = {}
	--augmentGear.YoriumCuissesPhalanx = { name="Yorium Cuisses", augments={ '"Phalanx"+2' }}
	--augmentGear.YoriumCuissesAccuracy = { name="Yorium Cuisses", augments={ 'Damage taken -3%' }}
	
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		ammo='Staunch Tathlum', 
		head='Jumalik Helm', 
		neck='Creed Collar', 
		ear2="Colossus's Earring", 
		ear1='Genmei Earring',
		body='Jumalik Mail',
		hands='Souv. Handschuhs', 
		ring1='Defending ring', 
		ring2='Dark ring', 
		back='Weard Mantle', 
		waist='Nierenschutz', 
		legs='Carmine Cuisses +1', 
		feet='Amm Greaves' }
	
	sets.aftercast.TP_DPS = { 
		ammo='Ginsen', 
		head="Flam. Zucchetto +2", 
		neck='Lissome Necklace', 
		ear1='Cessance Earring', 
		ear2='Digni. Earring',
		body='Flamma Korazin +2',
		hands='Flam. Manopolas +2', 
		ring1='Defending ring', 
		ring2='Chirich ring', 
		back='Weard Mantle', 
		waist='Sailfi Belt +1', 
		legs='Flamma Dirs +2', 
		feet='Flam. Gambieras +2' }
		
	sets.aftercast.TP_Tank = { 
		ammo='Staunch Tathlum', 
		head="Sulevia's Mask +1", 
		neck='Loricate Torque +1', 
		ear1='Genmei Earring', 
		ear2='Etiolation Earring',
		body='Souveran Cuirass +1',
		hands="Souv. Handsch. +1", 
		ring1='Defending ring', 
		ring2='Dark ring', 
		back='Rudianos\'s Mantle', 
		waist='Sailfi Belt +1', 
		legs='Souveran Diechlings +1', 
		feet='Souveran Schuhs +1' }

	sets.aftercast.TP_TankAccuracy = { ammo='Hasty Pinion +1', 
		head='Yorium barbuta', neck='Agitator\'s Collar', ear1='Digni. Earring', ear2='Cessance Earring',
		body='Chozoron coselete', hands='Flam. Manopolas +2', ring1='Patricius ring', ring2='Defending ring', 
		back='Weard Mantle', waist='Sailfi Belt +1', legs=augmentGear.YoriumCuissesAccuracy, feet='Diamantaire sollerets' }
	sets.aftercast.TP_DPSAccuracy = set_combine(sets.aftercast.TP_DPS, { ammo='Hasty Pinion +1', 
		head='Flam. Zucchetto +2', neck='Agitator\'s collar', 
		body='Mes\'yohi haubergeon', hands="Sulev. Gauntlets +1", 
		back='Letalis Mantle', waist="Sailfi Belt +1", legs=augmentGear.YoriumCuissesAccuracy })
	sets.aftercast.TP_SuperTank = set_combine(sets.aftercast.TP_Tank, { head='Souveran Schaller', hands='Souv. Handschuhs', ear1='Genmei earring', ear2='Etheral earring', waist='Nierenschutz',feet='Souveran Schuhs +1' })

	--[[sets.aftercast.TP_DPS_DW = set_combine(sets.aftercast.TP_DPS, { ear1='Suppanomimi', ear2='Brutal Earring' })
	sets.aftercast.TP_Shield = { ammo='Paeapua', head='Kaiser schaller', neck='Asperity Necklace', ear1='Steelflash Earring', ear2='Bladeborn Earring',
		body='Chozoron coselete', hands="Reverence gauntlets +1", ring1='K\'ayres ring', ring2='Rajas ring', 
		back='Bleating Mantle', waist='Pya\'ekue Belt', legs="Zoar subligar +1", feet='Diamantaire sollerets' }
	sets.aftercast.TP_Dyna = { ammo='Staunch Tathlum', head='Kaiser schaller', neck='Loricate Torque +1', ear1='Steelflash Earring', ear2='Bladeborn Earring',
		body='Mekira Meikogai', hands="Ares' gauntlets +1", ring1='Patricius ring', ring2='Defending ring', 
		back='Metallon Mantle', waist='Pya\'ekue Belt', legs="Ares' Flanchard +1", feet='Phorcys Schuhs' }
	sets.aftercast.TP_TankShield = set_combine(sets.aftercast.TP_Tank, { head='Kaiser schaller', hands='Reverence gauntlets +1', waist='Pya\'ekue Belt' })
	--]]	
	
	sets.precast = {}
	sets.precast.WS = {}
	sets.precast.WS.Accuracy = { ammo='Hasty Pinion +1', 
		head='Gavialis helm', neck='Fotia gorget', ear1='Moonshade Earring', ear2='Zennaroi Earring',
		body="Mes'yohi haubergeon", hands='Flam. Manopolas +2', ring1='Patricius ring', ring2='Rajas ring', 
		back='Letalis Mantle', waist='Fotia Belt', legs="Acro breeches", feet="Founder's greaves" }
	sets.precast.WS['Chant du Cygne'] = { 
		ammo='Staunch Tathlum', 
		head="Sulevia's Mask +1", 
		neck='Fotia Gorget', 
		ear1='Steelflash Earring', 
		ear2='Bladeborn Earring',
		body='Found. Breastplate',
		hands='Souv. Handschuhs', 
		ring1='Defending ring', 
		ring2='Dark ring', 
		back="Rudianos's Mantle", 
		waist='Fotia Belt', 
		legs='Souveran Diechlings', 
		feet='Thereoid Greaves' }
	sets.precast.WS['Requiescat'] = { 
		ammo='Staunch Tathlum', 
		head="Sulevia's Mask +1", 
		neck='Fotia Gorget', 
		ear1='Steelflash Earring', 
		ear2='Bladeborn Earring',
		body='Found. Breastplate',
		hands='Souv. Handschuhs', 
		ring1='Defending ring', 
		ring2='Stikini Ring +1', 
		back="Rudianos's Mantle", 
		waist='Fotia Belt', 
		legs='Souveran Diechlings', 
		feet='Loyalist Sabatons' }
	sets.precast.WS['Savage Blade'] = {
		ammo='Ginsen', 
		head="Sulevia's Mask +1", 
		neck='Fotia Gorget', 
		ear1='Moonshade Earring', 
		ear2='Ishvara Earring',
		body="Sulevia's Plate. +1",
		hands='Sulev. Gauntlets +1', 
		ring1="Ifrit ring", 
		ring2="Ifrit ring", 
		back="Rudianos's Mantle", 
		waist='Fotia Belt', 
		legs='Sulevi. Cuisses +1', 
		feet='Sulev. Leggings +1' }		

	sets.precast.WS['Knights of Round'] = { ammo='Floestone', head='Otomi Helm', neck='Fotia Gorget', ear1='Steelflash Earring', ear2='Bladeborn Earring',
		body='Phorcys korazin', hands='Mikinaak gauntlets', ring1='Pyrosoul ring', ring2='Ifrit ring +1', 
		back='Buquwik Cape', waist='Fotia Belt', legs="Acro breeches", feet='Whirlpool greaves' }
	
	sets.precast.WS['Sanguine Blade'] = { 
		ammo='Dosis Tathlum', 
		head="Jumalik Helm", 
		neck="Fotia Gorget", 
		ear1='Novio Earring', 
		ear2='Friomisis Earring',
		body="Founder's breastplate", 
		hands="Leyline gloves", 
		ring1='Stikini Ring +1', 
		ring2='Acumen ring', 
		back='Izdubar Mantle', 
		waist="Fotia Belt", 
		legs="Acro breeches", 
		feet="Founder's greaves" }
		
	sets.precast.WS['Vorpal Blade'] = { set_combine(sets.precast.WS['Chant du Cygne'])}
	sets.precast.WS['Swift Blade'] = set_combine(sets.precast.WS['Savage Blade'])
	sets.precast.WS['Circle Blade'] = { set_combine(sets.precast.WS['Savage Blade'])}
	sets.precast.WS['Aeolian Edge'] = { set_combine(sets.precast.WS['Sanguine Blade'])}
	
	sets.precast.FC = { 
		ammo="Impatiens", 
		head="Chev. Armet +1", 
		neck="Orunmila's Torque", 
		ear1="Loquac. Earring", 
		ear2="Nourish. Earring",
		body="Odyss. Chestplate",
		hands="Leyline Gloves", 
		ring1="Prolix Ring", 
		ring2="Kishar Ring", 
		back="Weard Mantle", 
		waist="Siegel Sash", 
		legs="Yorium Cuisses", 
		feet="Odyssean Greaves" }
	sets.precast.Enhancing = set_combine(sets.precast.FC, { waist='Siegel Sash' })
	sets.precast.Hate = { 
		ammo='Staunch Tathlum', 
		head="Cab. Coronet +1",
		neck="Unmoving Collar", 
		ear2='Pluto\'s Pearl', 
		ear1="Genmei Earring", 
		body="Souveran Cuirass", 
		hands='Caballarius Gauntlets +1', 
		ring1='Apeile Ring +1', 
		ring2='Apeile Ring',
		back='Weard Mantle', 
		waist='Creed Baudrier', 
		legs='Cab. Breeches +1', 
		feet="Chev. Sabatons +1" }

	sets.precast.JA = {}
	sets.precast.JA.Fealty = { body='Cab. Surcoat' }
	sets.precast.JA.Invincible = { legs='Cab. Breeches +1' }
	sets.precast.JA.Chivalry = { 
		head="Reverence coronet +1", 
		neck="Phalaina Locket", 
		ear1="Lifestorm earring", 
		body="Caballarius surcoat", 
		hands='Caballarius Gauntlets +1', 
		ring1="Stikini Ring +1", 
		ring2="Karka Ring",
		legs="Caballarius Breeches +1", 
		feet="Amm Greaves"}
	sets.precast.JA['Shield Bash'] = { hands='Cab. Gauntlets +1' }
	sets.precast.JA.Rampart = { 
		head="Cab. Coronet +1", 
		body="Caballarius surcoat", 
		hands="Reverence gauntlets +1", 
		back="Weard Mantle", 
		waist="", 
		legs="Caballarius Breeches +1", 
		feet="Amm Greaves" }
	sets.precast.JA.Cover = {
		head="Reverence Coronet +1", 
		neck="Phalaina Locket", 
		ear1="Lifestorm earring", 
		body="Caballarius surcoat", 
		hands='Caballarius Gauntlets +1', 
		ring1="Stikini Ring +1", 
		ring2="Karka Ring",
		legs="Caballarius Breeches +1", 
		feet="Amm Greaves"}

-- Midcast --

	sets.midcast = {}
	sets.midcast.Cure = set_combine(sets.precast.Hate, { 
		head='Adaman Barbuta', 
		neck='Phalaina Locket', 
		ear1='Hospitaler Earring', 
		ear2='Nourishing earring +1', 
		body="Jumalik Mail", 
		hands="Macabre Gaunt. +1", 
		ring1='Apeile Ring', 
		ring2='Apeile Ring +1',  
		legs="Souveran Diechlings", 
		feet="Chev. Sabatons +1" })
	sets.midcast.Flash = { 
		ammo='Staunch Tathlum', 
		head="Chev. Armet +1", 
		neck="Unmoving Collar", 
		ear2='Loquac. Earring', 
		ear1="Genmei Earring", 
		body="Souveran Cuirass", 
		hands='Cab. Gauntlets +1', 
		ring1='Apeile Ring +1', 
		ring2='Apeile Ring',
		back='Weard Mantle', 
		waist='Creed Baudrier', 
		legs='Cab. Breeches +1', 
		feet="Chev. Sabatons +1" }
	sets.midcast.Holy = set_combine(sets.midcast.Flash, { ammo='Ghastly Tathlum', 
		head="Jumalik Helm", neck="Mizu. Kubikazari", ear1='Friomisi earring', ear2='Novio earring',
		body="Founder's breastplate", hands="Leyline gloves", ring1='Acumen ring', ring2="Weatherspoon ring", 
		back='Izdubar Mantle', waist="Eschan Stone", feet="Founder's greaves" })
	sets.midcast.Reprisal = set_combine(sets.midcast.Flash, { 
		ammo="Staunch Tathlum +1",
		head="Souveran Schaller",
		neck="Incanter's Torque",
		
		body='Shabti cuirass +1' })
	sets.midcast.Enhancing = set_combine(sets.precast.FC, { neck="Incanter's Torque", body='Shabti cuirass +1', legs='Carmine Cuisses +1' })
	sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing, {
		ammo="Staunch Tathlum +1",
		head="Yorium Barbuta",
		neck="Incanter's Torque",
		body="Yorium Cuirass",
		hands="Souv. Handschuhs",
		back='Weard Mantle', 
		legs="Yorium Cuisses",
		feet="Souveran Schuhs +1"})
	sets.midcast.Enlight = set_combine(sets.midcast.Reprisal)
	sets.midcast["Enlight II"] = sets.midcast.Enlight

		

	isSupertank = false
	isKiteMode = false
	isFleeing = false
	isKnockBack = false
	isFarmingCP = false
	wsAccuracy = false
	tpSet = 'TP_DPS'
	idleSet = 'Idle'

	sets.Zombie = { head='Twilight Helm', body='Twilight Mail' }
end

function buff_change(status,gain_or_loss)
	if T{'weakness', 'petrification', 'sleep', 'stun', 'terror', 'reraise'}:contains(string.lower(status)) then
		custom.output.important('*** ' .. string.upper(status) .. ' has been ' .. (gain_or_loss and 'GAINED' or 'LOST') .. ' ***')
		equip(get_default_aftercast())
	end
	
	if string.lower(status) == 'flee' and isFleeing and gain_or_loss then
		isFleeing = false
		custom.output.info('Flee Mode Deactivated')
		equip(get_default_aftercast())
	end
	
	if string.lower(status) == 'earthen armor' and not gain_or_loss then
		custom.output.important('***  EARTHEN ARMOR OFF ***')
	elseif string.lower(status) == 'scherzo' and not gain_or_loss then
		custom.output.important('***  SCHERZO OFF ***')
	end
end

function precast(spell)
	custom.output.debug('Precast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	
	if buffactive.petrification or buffactive.sleep or buffactive.stun or buffactive.terror then
		cancel_spell()
		return
	end
	if spell.action_type == 'Magic' and windower.ffxi.get_spell_recasts()[spell.recast_id] > 0 then
		--custom.output.info('Cannot cast ' .. spell.english .. ', waiting on recast: ' .. (windower.ffxi.get_spell_recasts()[spell.recast_id] / 60) .. ' second(s) remain')
		cancel_spell()
		return
	end
	if spell.action_type == 'Magic' and buffactive.silence then
		custom.output.info('Cannot cast, currently silenced.')
		cancel_spell()
		return
	end
	
	local base_set = { }
	
	if (spell.type == 'JobAbility') then
		base_set = sets.precast.Hate
		if (sets.precast.JA[spell.english]) then
			base_set = set_combine(base_set, sets.precast.JA[spell.english])
		end
	elseif (spell.type == 'WeaponSkill') then	
		if (sets.precast.WS[spell.english]) then
			base_set = sets.precast.WS[spell.english]
		end
		if wsAccuracy then
			base_set = sets.aftercast.TP_TankAccuracy
		end
	elseif sets.precast[spell.english] then
		base_set = sets.precast[spell.english]
	elseif spell.skill=='Enhancing Magic' then
		base_set = sets.precast.Enhancing
	elseif spell.action_type == 'Magic' then
		base_set = sets.precast.FC
		if custom.string.startsWith(spell.english, 'Dia') then
			base_set = set_combine(base_set, { waist='Chaac Belt' })
		end
	end

	equip(get_postprocess_set(base_set))
end

function midcast(spell)
	custom.output.debug('Midcast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	
	if (spell.action_type == 'Magic') then
		if string.find(spell.english,'Cur') then 
			base_set = get_postprocess_set(sets.midcast.Cure)
			if buffactive['Reive Mark'] then
				base_set = set_combine(base_set, { neck="Arciela's Grace +1" })
			end
			equip(base_set)
		elseif sets.midcast[spell.english] then
			equip(get_postprocess_set(sets.midcast[spell.english]))
		elseif custom.string.startsWith(spell.english, 'Holy') then
			equip(get_postprocess_set(sets.midcast.Holy))
		elseif spell.skill=='Blue Magic' then
			equip(sets.precast.Hate)
		elseif spell.skill=='Enhancing Magic' then
			equip(get_postprocess_set(sets.midcast.Enhancing))
		elseif custom.string.startsWith(spell.english, 'Dia') then
			equip(get_postprocess_set(set_combine(sets.aftercast.TP_SuperTank, { waist='Chaac Belt' })))
		else
			equip(get_postprocess_set(sets.aftercast.TP_SuperTank))
		end
	end
end

function aftercast(spell)
	custom.output.debug('Aftercast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	equip(get_default_aftercast())
end

function status_change(new,old)
	--if player.status=='Engaged' then
	--end
	custom.output.debug('Status change from ' .. new .. ' to ' .. old)
	equip(get_default_aftercast())
end

function get_default_aftercast()
	local idle_states = (isSupertank and T{'Resting'} or T{'Idle', 'Resting'})
	local base_set = sets.aftercast[(idle_states:contains(player.status) and idleSet or tpSet)]
	
	if isSupertank then
		base_set = set_combine(sets.aftercast.TP_SuperTank)
	end
	
	if (isKnockBack and (isSupertank or not idle_states:contains(player.status)) and T{'TP_Tank', 'TP_TankAccuracy', 'TP_SuperTank'}:contains(tpSet)) then
		base_set = set_combine(base_set, { back='Repulse Mantle' })
	end
	
	if buffactive['Reive Mark'] then
		base_set = set_combine(base_set, { neck="Arciela's Grace +1" })
	end
	
	return get_postprocess_set(base_set)
end

function get_postprocess_set(base_set)
	
	if isKiteMode then
		base_set = set_combine(base_set, { legs='Carmine Cuisses +1' })
	end
	
	if buffactive.petrification or buffactive.sleep or buffactive.stun or buffactive.terror then
		base_set = sets.aftercast.TP_SuperTank
	end
	
	if isFarmingCP then
		base_set = set_combine(base_set, { back='Mecistopins mantle' })
	end
	
	if buffactive.weakness and not buffactive.reraise then
		base_set = set_combine(base_set, sets.Zombie)
	end
	
	if buffactive.doom then
		base_set = set_combine(base_set, { legs='Shabti Cuisses', ring2='Saida ring' })
	end
	
	if isFleeing then
		base_set = set_combine(base_set,  { feet='Powder boots' })
	end
	
	return base_set
end

function self_command(cmd)
	custom.self_command(cmd)
-- Subjob Ability Handling --
	if cmd == 'sj1' then
		if player.sub_job == 'WAR' then
			send_command('input /ja "Berserk" <me>')
		elseif player.sub_job == 'NIN' then
			send_command('input /ma "Utsusemi: Ni" <me>')
		elseif player.sub_job == 'DNC' then
			send_command('input /ja "Quickstep" <t>')
		elseif player.sub_job == 'BLU' then
			send_command('input /ma "Jettatura" <t>')
		end
	elseif cmd == 'sj2' then
		if player.sub_job == 'WAR' then
			send_command('input /ja "Aggressor" <me>')
		elseif player.sub_job == 'NIN' then
			send_command('input /ma "Utsusemi: Ichi" <me>')
		elseif player.sub_job == 'DNC' then
			send_command('input /ja "Violent Flourish" <t>')
		elseif player.sub_job == 'BLU' then
			send_command('input /ja "Sheep Song" <t>')
		end
	elseif cmd == 'sj3' then
		if player.sub_job == 'WAR' then
			send_command('input /ja "Warcry" <me>')
		elseif player.sub_job == 'NIN' then
			send_command('input /ja "Monomi: Ichi" <me>')
		elseif player.sub_job == 'DNC' then
			send_command('input /ja "Divine Waltz" <stpt>')
		elseif player.sub_job == 'BLU' then
			send_command('input /ja "Soporific" <t>')
		end
	elseif cmd == 'sj4' then
		if player.sub_job == 'WAR' then
			send_command('input /ja "Defender" <me>')
		elseif player.sub_job == 'NIN' then
			send_command('input /ja "Tonko: Ni" <me>')
		elseif player.sub_job == 'DNC' then
			send_command('input /ja "Curing Waltz III" <>')
		elseif player.sub_job == 'BLU' then
			send_command('input /ja "Geist Wall" <t>')
		end
	elseif cmd == 'sj5' then
		if player.sub_job == 'WAR' then
			send_command('input /ja "Provoke" <t>')
		elseif player.sub_job == 'NIN' then
			send_command('input //cancel 66')
		elseif player.sub_job == 'DNC' then
			send_command('input /ja "Healing Waltz" <stpt>')
		elseif player.sub_job == 'BLU' then
			send_command('input /ja "Cocoon" <me>')
		end
--
	elseif cmd == 'toggle supertank' then
		isSupertank = custom.toggle_preamble(isSupertank, 'Supertank Mode ', 'Activated', 'Deactivated')
	elseif cmd == 'toggle cp_farm' then
		isFarmingCP = custom.toggle_preamble(isFarmingCP, 'CP Farming Mode ', 'Activated', 'Deactivated')
		equip(get_default_aftercast())
	elseif cmd == 'toggle kitemode' then
		isKiteMode = custom.toggle_preamble(isKiteMode, 'Kite Mode ', 'Activated', 'Deactivated')
	elseif cmd == 'toggle fleeing' then
		isFleeing = custom.toggle_preamble(isFleeing, 'Flee Mode ', 'Activated', 'Deactivated')
		if isFleeing then
			equip({ feet='Powder boots' })
		end
	elseif cmd == 'toggle knockback' then
		isKnockBack = custom.toggle_preamble(isKnockBack, 'Repulse Mantle Override ', 'Enabled', 'Disabled')
	elseif cmd == 'toggle wsAccuracy' then
		wsAccuracy = custom.toggle_preamble(wsAccuracy, 'WS in Accuracy Gear ', 'Enabled', 'Disabled')
	elseif custom.string.startsWith(cmd, 'TP_') then
		tpSet = cmd
		custom.output.info('Changed TP set to ' .. cmd .. '.  Repulse Mantle Override ' .. (isKnockBack and 'Enabled' or 'Disabled'))
		equip(get_postprocess_set(sets.aftercast[tpSet]))
	elseif custom.string.startsWith(cmd, 'Idle') then
		idleSet = cmd
		equip(get_postprocess_set(sets.aftercast[idleSet]))
	elseif cmd == 'Lockstyle' then
		equip(sets.aftercast.Lockstyle)
	elseif cmd == 'EquipSet' then
		equip(get_default_aftercast())
	end
end