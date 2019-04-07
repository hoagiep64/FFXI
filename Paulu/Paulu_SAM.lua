include('Paulu-Globals.lua')
include('custom.lua')

function get_sets()

	select_default_macro_book()
	
	autopdt = 'false'
	Armor = 'None'
	hybrid = false

	augmentGear = {}
 
	--CAPES--
 	augmentGear.MantleWSD = { name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	augmentGear.MantleTP = { name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	augmentGear.Mantle_R_WSD = { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	augmentGear.Mantle_R_TP = { name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}}
	augmentGear.Mantle_R_Snapshot = { name="Smertrios's Mantle", augments={'"Snapshot"+10',}}
	
	--HEAD--
	augmentGear.ValorousMaskWSD = { name="Valorous Mask", augments={'Accuracy+29','Weapon skill damage +4%','DEX+8','Attack+5',}}
	
	--HANDS--
	augmentGear.ValorousMittsStr = { name="Valorous Mitts", augments={'Accuracy+24','Weapon skill damage +2%','STR+10','Attack+2',}}
	augmentGear.ValorousMittsSTP = { name="Valorous mitts", augments={ '"Store TP"+6' }}
	augmentGear.ValorousMittsPDT = { name="Valorous mitts", augments={ 'Phys. dmg. taken -2%' }}
	
	--LEGS--
	augmentGear.ValorousHoseDT = { name="Valor. Hose", augments={ 'Damage taken -3%' }}
	augmentGear.ValorousHoseRefresh = { name="Valor. Hose", augments={ '"Refresh"+2' }}
	
	--FEET--
	augmentGear.ValorousGreavesStr = { name="Valorous Greaves", augments={'Accuracy+8','Weapon skill damage +5%','VIT+3',}}
	
	--LOLTAL'S ARCHERY SET--
    augmentGear.AcroHelm = { name="Acro Helm", augments={'"Rapid Shot"+5','"Snapshot"+5',}}
    augmentGear.AcroSurcoat = { name="Acro Surcoat", augments={'"Rapid Shot"+5','"Snapshot"+5',}}
    augmentGear.AcroGauntlets = { name="Acro Gauntlets", augments={'Attack+19','"Rapid Shot"+5','"Snapshot"+5',}}
    augmentGear.AcroBreeches = { name="Acro Breeches", augments={'Accuracy+14 Attack+14','"Rapid Shot"+5','"Snapshot"+5',}}
    augmentGear.AcroLeggings = { name="Acro Leggings", augments={'Accuracy+12','"Rapid Shot"+5','"Snapshot"+5',}}

	
	sets.precast = {}
	
	sets.precast.Hate = { ammo='Paeapua', 
		head='Halitus helm', neck="Unmoving Collar", ear1='Friomisi Earring', ear2='Cryptic earring',
		body='Emet harness +1', hands='Kurys gloves', ring1='Petrov Ring', ring2='Pernicious Ring',
		back='Earthcry Mantle', waist='Kasiri Belt', legs="Zoar subligar +1", feet="Usukane sune-ate +1" }

	sets.precast.WS = {}
	sets.precast.WS['Tachi: Fudo'] = { 
		ammo="Knobkierrie",
		head=augmentGear.ValorousMaskWSD, 
		neck="Sam. Nodowa +2", 
		ear1="Moonshade Earring", 
		ear2="Ishvara earring",
		body="Sakonji Domaru +3", 
		hands=augmentGear.ValorousMittsStr, 
		ring1="Niqmaddu Ring", 
		ring2="Ifrit Ring", 
		back=augmentGear.MantleWSD, 
		waist="Prosilio Belt +1", 
		legs="Wakido Haidate +3", 
		feet=augmentGear.ValorousGreavesStr }
		
	sets.precast.WS.Accuracy = { ammo="Ginsen",
		head="Flamma zucchetto +2", neck="Agitator's Collar", ear1="Telos Earring", ear2="Dignitary's Earring",
		body="Sakonji Domaru +3", hands=augmentGear.ValorousMittsStr, ring1="Ifrit ring", ring2="Ifrit Ring", 
		back=augmentGear.MantleWSD, waist="Ioskeha Belt +1", legs="Wakido Haidate +3", feet=augmentGear.ValorousGreavesStr }
		
	sets.precast.WS['Apex Arrow'] = { ammo="Yoichi's arrow", 
		head='Sakonji kabuto +3', neck='Sam. Nodowa +2', ear1='Telos Earring', ear2='Ishvara earring',
		body="Sakonji Domaru +3", hands='Kasuga kote +1', ring1='Ifrit Ring', ring2='Ifrit ring',
		back=augmentGear.Mantle_R_WSD, waist='Fotia Belt', legs="Wakido Haidate +3", feet='Wakido sune-ate +3' }
	
		
	sets.precast.WS['Tachi: Gekko'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Tachi: Kasha'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Tachi: Shoha'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Tachi: Kaiten'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Tachi: Rana'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Sonic Thrust'] = sets.precast.WS['Tachi: Fudo']
	sets.precast.WS['Impulse Drive'] = sets.precast.WS['Tachi: Fudo']
		
	--sets.precast.WS['Tachi: Jinpu'] = { ammo="Amar cluster", 
	--	head="Flamma zucchetto +2", neck="Iqabi necklace", ear1="Zennaroi Earring", ear2="Dignitary's Earring",
	--	body="Sakonji Domaru +3", hands="Flamma manopolas +2", ring1="Cacoethic ring", ring2="Cacoethic ring +1",
	--	back=augmentGear.MantleTP, waist="Olseni belt", legs="Acro breeches", feet=augmentGear.ValorousGreavesSTP }
		
	sets.precast.WS['Tachi: Jinpu'] = { ammo="Knobkierrie",
		head=augmentGear.ValorousMaskStr, neck="Sam. Nodowa +2", ear1="Moonshade Earring", ear2="Zwazo Earring",
		body="Sakonji Domaru +3", hands="Regal captain's gloves", ring1="Ifrit Ring", ring2="Ifrit Ring", 
		back=augmentGear.MantleWSD, waist="Fotia Belt", legs="Wakido Haidate +3", feet=augmentGear.ValorousGreavesStr }
		
	sets.precast.WS['Namas Arrow'] = { ammo="Yoichi's arrow", 
		head='Sakonji kabuto +3', neck='Sam. Nodowa +2', ear1='Telos Earring', ear2='Ishvara earring',
		body="Sakonji Domaru +3", hands='Kasuga kote +1', ring1='Ifrit Ring', ring2={name="Ifrit Ring",priority=1},
		back=augmentGear.Mantle_R_WSD, waist='Fotia Belt', legs="Wakido Haidate +3", feet='Wakido sune-ate +3' }

	sets.precast.JA = {}
	sets.precast.JA.Sekkanoki = { hands="Kasuga Kote +1" }
	sets.precast.JA.Meditate = set_combine(sets.precast.Hate, { head="Wakido Kabuto +3", hands="Sakonji Kote +3", back="Smertrios's mantle" })
	sets.precast.JA.Sengikori = { feet="Kasuga Sune-Ate +1" }
	sets.precast.JA.Seigan = { head="Kasuga Kabuto +1" }
	sets.precast.JA['Third Eye'] = { legs="Sakonji Haidate +3" }
	sets.precast.JA["Blade Bash"] = sets.precast.Hate
	--sets.precast.JA.Hasso = sets.precast.Hate
	--sets.precast.JA.Seigan = sets.precast.Hate
	sets.precast.JA["Konzen-ittai"] = sets.precast.Hate
	sets.precast.JA.Vallation = sets.precast.Hate
	sets.precast.JA.Pflug = sets.precast.Hate
	sets.precast.JA.Swordplay = sets.precast.Hate
	sets.precast.JA.Provoke = sets.precast.Hate
	
	sets.precast.FC = { neck='Orunmila\'s Torque', ear1='Loquacious earring', hands="Leyline gloves", ring1="Weatherspoon ring" }
	
	sets.precast.ranged = { ammo="Yoichi's arrow",
		head=augmentGear.AcroHelm, 
		body=augmentGear.AcroSurcoat, hands=augmentGear.AcroGauntlets,
		back=augmentGear.Mantle_R_Snapshot, legs=augmentGear.AcroBreeches, feet=augmentGear.AcroLeggings }

	sets.midcast = {}
	sets.midcast.ranged = { ammo="Yoichi's arrow", 
		head='Sakonji kabuto +3', neck='Sanctity necklace', ear1='Telos Earring', ear2="Enervating Earring",
		body="Kyujutsugi", hands='Kasuga kote +1', ring1='Ifrit Ring', ring2='Cacoethic ring +1',
		back=augmentGear.Mantle_R_TP, waist='Fotia Belt', legs="Wakido haidate +3", feet='Wakido sune-ate +3' }
	
	sets.midcast.Flash = sets.precast.Hate
	
	sets.midcast.Elemental = { neck='Stoicheion medal', ear1='Friomisi earring', ear2='Crematio earring',
		ring2='Shiva ring +1', back='Toro cape' }

	sets.aftercast = {}
	sets.aftercast.Idle = { ammo="Staunch tathlum", 
		head="Wakido Kabuto +3", neck="Loricate Torque +1", ear1="Genmei earring", ear2="Etiolation earring",
		body="Hiza. Haramaki +1", hands="Sakonji Kote +3", ring1="Dark ring", ring2="Defending ring", 
		back="Solemnity Cape", waist="Flume Belt", legs="Valor. Hose", feet="Danzo Sune-Ate"  }
	sets.aftercast.IdlePDT = set_combine(sets.aftercast.Idle,{ ammo="Staunch tathlum", 
		head="Wakido Kabuto +3", neck="Loricate Torque +1", ear1="Genmei earring", ear2="Etiolation earring",
		body="Wakido Domaru +3", hands="Sakonji Kote +3", ring1="Dark ring", ring2="Defending ring", 
		back="Solemnity Cape", waist="Flume Belt", legs="Valor. Hose", feet="Danzo Sune-Ate"  }) 
	sets.aftercast.IdleRefresh = set_combine(sets.aftercast.Idle,{}) 
	
-- TP Sets -- 		
	sets.aftercast.TP_Hasso = { ammo="Ginsen",
		head="Flam. Zucchetto +2", neck="Sam. Nodowa +2", ear1="Cessance Earring", ear2="Telos Earring",
		body="Kasuga domaru +1", hands="Wakido Kote +2", ring1="Niqmaddu Ring", ring2="Chirich Ring +1", 
		back=augmentGear.MantleTP, waist="Ioskeha Belt +1", legs="Ryuo Hakama +1", feet="Flam. Gambieras +2" }
	sets.aftercast.TP_Seigan = { ammo="Ginsen",
		head="Flam. Zucchetto +2", neck="Sam. Nodowa +2", ear1="Cessance Earring", ear2="Telos Earring",
		body="Kasuga domaru +1", hands="Flam. Manopolas +1", ring1={name="Chirich Ring",priority=16}, ring2="Chirich Ring +1", 
		back=augmentGear.MantleTP, waist="Ioskeha Belt +1", legs="Sakonji Haidate +3", feet="Flam. Gambieras +2" }
	sets.aftercast.TP_ThirdEye = set_combine(sets.aftercast.TP_Seigan,{legs="Sakonji Haidate +3"})
	sets.aftercast.TP_Accuracy = { ammo="Ginsen",
		head="Flam. Zucchetto +2", neck="Sam. Nodowa +2", ear1="Zennaroi Earring", ear2="Telos Earring",
		body="Wakido Domaru +3", hands="Flam. Manopolas +1", ring1={name="Chirich Ring",priority=16}, ring2={name="Chirich Ring",priority=1}, 
		back=augmentGear.MantleTP, waist="Ioskeha Belt +1", legs="Wakido Haidate +3", feet='Wakido sune-ate +3' }

-- DT --		
	sets.aftercast.TP_PDT = set_combine(sets.aftercast.TP_Hasso,{ 
		ammo="Staunch tathlum", 
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", ear1="Genmei earring", ear2="Oneiros earring",
		body="Wakido Domaru +3", hands="Sakonji Kote +3", ring1="Dark Ring", ring2="Defending ring", 
		back=augmentGear.MantleTP, waist="Flume belt", legs="Valor. Hose", feet="Amm Greaves" })
	sets.aftercast.TP_MDT = {
		ammo="Staunch Tathlum +1",
		head="Founder's Corona", neck="Loricate Torque +1", ear1="Etiolation Earring", ear2= "Odnowa Earring +1",
		body="Wakido Domaru +3", hands="Ken. Tekko +1", ring1="Dark Ring", ring2="Defending Ring",		
		back="Solemnity Cape", waist="Sailfi Belt +1", legs="Ken. Hakama +1", feet="Ken. Sune-Ate +1"
	}
	sets.aftercast.TP_MDT50 = {
		ammo="Staunch Tathlum +1",
		head="Founder's Corona", neck="Warder's Charm +1", ear1="Etiolation Earring", ear2= "Odnowa Earring +1",
		body="Wakido Domaru +3", hands="Ken. Tekko +1", ring1="Shadow Ring", ring2="Defending Ring",
		back="Engulfer Cape", waist="Sailfi Belt +1", legs="Ken. Hakama +1", feet="Ken. Sune-Ate +1"
	}
		
	sets.aftercast.TP_Hybrid = { ammo="Staunch tathlum", 
		head="Flam. Zucchetto +2", neck="Samurai's Nodowa +2", ear1="Cessance Earring", ear2="Telos Earring",
		body="Wakido Domaru +3", hands="Sakonji Kote +3", ring1="Dark Ring", ring2="Defending ring", 
		back=augmentGear.MantleTP, waist="Ioskeha Belt +1", legs="Ryuo Hakama +1", feet="Ken. Sune-Ate +1" }
		
	sets.precast.CureCheat = { head="Pixie hairpin +1", neck="Loricate torque +1", ear1="Graiai Earring", ear2="Influx earring",
		body="Twilight mail", hands="Strand gages", ring1="Bifrost ring", ring2="Serket ring",
		back=empty, waist="Flume belt", legs="Rao haidate", feet="Phorcys schuhs" }
		
	sets.aftercast.CureCheat = {
		head="Gavialis Helm", neck="Bathy Choker", ear1="Odnowa Earring", ear2="Cryptic Earring", 
		body="Flamma Korazin +2", hands="Flamma Manopolas +2", ring1="Eihwaz Ring", ring2="Meridian Ring",
		back="Xucau Mantle", waist="Oneiros Belt", legs=augmentGear.ValorousHoseDT, feet="Sak. Sune-Ate +2" }
		
	sets.aftercast.TP = sets.aftercast.TP_Hasso
	--sets.precast.WS['Tachi: Jinpu'] = sets.aftercast.TP_Accuracy
	--sets.precast.WS['Tachi: Rana'] = sets.aftercast.TP_Accuracy
	--sets.precast.WS['Tachi: Gekko'] = sets.aftercast.TP_Accuracy
	--sets.precast.WS['Tachi: Fud'] = sets.aftercast.TP_Accuracy

	sets.Zombie = { head="Twilight Helm", body="Twilight Mail" }

	isFarmingCP = false
	tpSet = 'TP_Hasso'
	idleSet = 'Idle'
	
	targetSynthCount = 0
	currentSynthCount = 0
	isSynthing = false
end

function pretarget(spell,action)

end

function buff_change(status,gain_or_loss)
	if T{'weakness', 'petrification', 'sleep', 'stun', 'terror', 'reraise'}:contains(string.lower(status)) then
		custom.output.important('*** ' .. string.upper(status) .. ' HAS BEEN ' .. (gain_or_loss and 'GAINED' or 'LOST') .. ' ***')
		equip(get_default_aftercast())
	else
		if status == 'Third Eye' and buffactive['Third Eye'] then
			if hybrid == true then
				JobDisplay(1,"Hybrid",4)
				equip(set_combine(sets.aftercast.TP_Hybrid,{legs="Sakonji Haidate +3"}))
			else
				equip(sets.aftercast.TP_ThirdEye)
				JobDisplay(1,"ThirdEye",2)
			end
		else
			equip(get_default_aftercast())
		end
 	end
end

function precast(spell)
	custom.output.debug('Precast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	if spell.english == "Berserk" and windower.ffxi.get_ability_recasts()[4] ~= 0 and windower.ffxi.get_ability_recasts()[1] ~= 0 then
		cancel_spell()
		send_command('Warcry')
	elseif spell.english == "Berserk" and windower.ffxi.get_ability_recasts()[1] ~= 0 then -- Change Berserk To Aggressor If Berserk is on Cooldown --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive['Seigan'] then
		cancel_spell()
		send_command('Third Eye')
	elseif spell.english == "Warding Circle" and windower.ffxi.get_ability_recasts()[135] ~= 0 then --Changes 'Warding Circle' to 'Hamanoha' is on Cooldown
		cancel_spell()
		send_command('input /ja "Hamanoha" <t>')
	end

	if buffactive.petrification or buffactive.sleep or buffactive.stun or buffactive.terror then
		cancel_spell()
		return
	end
	
	local base_set = { }
	
	if sets.precast.JA[spell.english] then
		base_set = sets.precast.JA[spell.english]
	elseif spell.type=="WeaponSkill" then 
	if spell.target.distance > (3 + spell.target.model_size) then -- Cancel; Out of Range --
			cancel_spell()
			add_to_chat(123,'WeaponSkill Cancelled: [Out of Range]')
			send_command('input /ja "Provoke" <t>')
			return
	end
		if sets.precast.WS[spell.english] then
			base_set = sets.precast.WS[spell.english]
		else
			base_set = sets.precast.WS.Accuracy
		end
		
		--base_set = sets.aftercast.WS.Accuracy
		
		if buffactive.sekkanoki then
			base_set = set_combine(base_set, sets.precast.JA.Sekkanoki)
		end
		if buffactive.sengikori then
			base_set = set_combine(base_set, sets.precast.JA.Sengikori)
		end
	elseif spell.action_type == 'Magic' then
		base_set = sets.precast.FC
	elseif spell.name == "Ranged" then
		base_set = sets.precast.ranged
	end

	equip(get_postprocess_set(base_set))
end

function midcast(spell)
	custom.output.debug('Midcast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	
	if spell.name == "Ranged" then
		equip(get_postprocess_set(sets.midcast.ranged))
	elseif spell.skill=="Elemental Magic" then
		equip(sets.midcast.Elemental)
	elseif sets.midcast[spell.english] then 
		equip(sets.midcast[spell.english])
	end
end

function aftercast(spell)
	custom.output.debug('Aftercast, type=' .. spell.type .. ', action_type=' .. spell.action_type .. ', english=' .. spell.english .. ', skill=' .. (spell.skill or 'nil'))
	equip(get_default_aftercast())
	if spell.type == 'WeaponSkill' and Armor == 'PDT' or Armor == 'MDT' then
		add_to_chat(158,'Mode: ['..Armor..']')
	end
end

function status_change(new,old)
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Dimensional Ring (Mea)" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Dimensional Ring (Mea)" then
		windower.add_to_chat(2,'Ring still on')
		return
	end
	if Armor == 'PDT' then
		equip(sets.aftercast.TP_PDT)
	elseif Armor == 'MDT' then
		if buffactive['Shell'] then
			equip(sets.aftercast.TP_MDT50)
		else
			equip(sets.aftercast.TP_MDT)
		end
	elseif hybrid == true then
		
	end
	equip(get_default_aftercast())
end

function get_default_aftercast()
	local idle_states = T{'Idle', 'Resting'}
	local base_set = sets.aftercast[(idle_states:contains(player.status) and idleSet or tpSet)]
	
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Dimensional Ring (Mea)" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Dimensional Ring (Mea)" then
		windower.add_to_chat(2,'Ring still on')
		return
	end
	
	if Armor == 'PDT' then
		JobDisplay(1,"PDT",3)
		base_set = sets.aftercast.TP_PDT
	elseif Armor == 'MDT' then
		JobDisplay(1,'MDT',5)
		if buffactive['Shell'] then
			base_set = sets.aftercast.TP_MDT50
		else
			base_set = sets.aftercast.TP_MDT
		end
	elseif player.status ~= 'Engaged' then
		base_set = sets.aftercast.Idle
		JobDisplay(1,"Idle",8)
	elseif buffactive['Third Eye'] then
		if hybrid == true then
			JobDisplay(1,'Hybrid',0)
			base_set = set_combine(sets.aftercast.TP_Hybrid,{legs="Sakonji Haidate +3"})
		else
			JobDisplay(1,'ThirdEye',2)
			base_set = sets.aftercast.TP_ThirdEye
		end
	elseif buffactive['Seigan'] then
		if hybrid == true then
			JobDisplay(1,'Hybrid',1)
			base_set = sets.aftercast.TP_Hybrid
		else
			JobDisplay(1,'Seigan',1)
			base_set = sets.aftercast.TP_Seigan
		end
	else
		if hybrid == true then
			JobDisplay(1,'Hybrid',1)
			base_set = sets.aftercast.TP_Hybrid
		else
			JobDisplay(1,'Hasso',1)
			base_set = sets.aftercast.TP_Hasso
		end
	end
	
	return get_postprocess_set(base_set)
end

function get_postprocess_set(base_set)
	if buffactive.petrification or buffactive.sleep or buffactive.stun or buffactive.terror then
		if Armor ~= 'PDT' or Armor ~= 'MDT' then
			base_set = sets.aftercast.TP_PDT
			JobDisplay(1,Armor,'stone')
		end
	end
	

	if isFarmingCP then
		base_set = set_combine(base_set, { back='Mecistopins mantle' })
	end
	
	--if buffactive.weakness and not buffactive.reraise then
	--	base_set = set_combine(base_set, sets.Zombie)
	--end
	
	--if buffactive.doom then
	--	base_set = set_combine(base_set, { ring2='Saida ring' })
	--end
	
	return base_set
end

function self_command(cmd)
	if cmd == 'test' then
	print(player.equipment.main)
	elseif cmd == 'automode' then -- TOGGLES BOT MODE
		AutoPlay()
		return
	elseif cmd == 'AUTO' and autoplay == true then
		send_command('wait 5;input //gs c AUTO')
		MyProject_Target_Fix()
		
		if player.target == 'MONSTER' and player.status ~= 'Engaged' then
			send_command('input /attack')
		end
		if player.status == 'Engaged' then
			Too_Close_Check()
		
			if player.target.distance > (1.8 + player.target.model_size)  and windower.ffxi.get_ability_recasts()[5] == 0 then
				send_command('Provoke')
			elseif not buffactive['Hasso'] and windower.ffxi.get_ability_recasts()[138] == 0 then --HASSO--
				send_command('Hasso')
			elseif windower.ffxi.get_ability_recasts()[134] == 0 then --MEDITATE--
				send_command('Meditate')
			elseif player.sub_job == 'WAR' and windower.ffxi.get_ability_recasts()[1] == 0 then -- Berserk --
				send_command('Berserk')
			elseif player.tp > 600 and windower.ffxi.get_ability_recasts()[132] == 0 and player.in_combat == true then -- Konzen-ittai --
				send_command('Konzen-ittai')
			elseif player.tp > 600 and windower.ffxi.get_ability_recasts()[54] == 0 and player.status == 'Engaged' then -- Hagakure --
				send_command('Hagakure')
			elseif player.tp > 1000 then
				send_command('gs c fudo')
			end
		end
		if player.hpp < 60 and autopdt == 'false' then
			Armor = 'PDT'	
			add_to_chat(123,'PDT \[Locked\]')
			autopdt = 'true'
			get_default_aftercast()
		elseif player.hpp > 59 and autopdt == 'true' then
			Armor = 'None'
			add_to_chat(158,'PDT \[Unlocked\]')
			autopdt = 'false'
			get_default_aftercast()
		end
	elseif cmd == 'idle' then
		equip(get_default_aftercast())
	elseif cmd == 'toggle cp_farm' then
		isFarmingCP = custom.toggle_preamble(isFarmingCP, 'CP Farming Mode ', 'Activated', 'Deactivated')
		equip(get_default_aftercast())

-- TP/DT/Idle Set Commands --		
	elseif cmd == 'PDT' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
			if buffactive['Seigan'] then
				tpSet = sets.aftercast.TP_Seigan
			else
				tpSet = sets.aftercast.TP_Hasso
			end
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
			tpSet = sets.aftercast.TP_PDT
		end
		equip(get_default_aftercast(tpSet))
	elseif cmd == 'MDT' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
			if buffactive['Seigan'] then
				tpSet = sets.aftercast.TP_Seigan
			else
				tpSet = sets.aftercast.TP_Hasso
			end
		elseif buffactive['Shell'] then
			Armor = 'MDT'
			tpSet = sets.aftercast.TP_MDT50
			add_to_chat(158,'MDTShell Set: [Locked]')
		else
			Armor = 'MDT'
			tpSet = sets.aftercast.TP_MDT
			add_to_chat(158,'MDT Set: [Locked]')
		end
		equip(get_default_aftercast(tpSet))
	elseif cmd == 'hybrid' then
		if hybrid == true then
			hybrid = false
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			hybrid = true
			add_to_chat(158,'Hybrid Set: [Locked]')
		end
		equip(get_default_aftercast(tpSet))
	elseif cmd == 'acc' then
		if hybrid == true then
			hybrid = false
			add_to_chat(123,'Accuracy Set: [Unlocked]')
		else
			hybrid = true
			add_to_chat(158,'Accuracy Set: [Locked]')
		end
		equip(get_default_aftercast(tpSet))
---- END DT Sets --- 

	elseif custom.string.startsWith(cmd, 'TP_') then
		if player.status ~= 'Engaged' and cmd == 'TP_Hasso' then 
			equip(get_postprocess_set(sets.aftercast[idleSet]))	
		else
			tpSet = cmd
			equip(get_postprocess_set(sets.aftercast[tpSet]))
		end
	elseif custom.string.startsWith(cmd, 'Idle') then
		idleSet = cmd
		equip(get_postprocess_set(sets.aftercast[idleSet]))
-- END TP/DT/Idle Set Commands --	
	elseif cmd == 'fudo' then
		if player.equipment.main == 'Shining One' then
			send_command('Impulse Drive')
		else
			send_command('Tachi: Fudo')
		end
	elseif cmd == 'AutoWS' then
		if (player.tp < 1500 and custom.string.startsWith(player.equipment.main, 'Amano')) then
			send_command('input /ws "Tachi: Kaiten" <t>')
		else
			send_command('input /ws "Tachi: Fudo" <t>')
		end
	end
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

function JobDisplay(number,value,color) -- For use with JobDisplay.lua
	if number == 1 then
		windower.send_command('jd set '..number..' '..value..' '..color)
	else
		windower.add_to_chat('128, JobDisplay: Invalid Column Number.')
		return
	end
end

function select_default_macro_book()
	-- Default macro set/book
		send_command('wait 2;input /lockstyleset 18')
		set_macro_page(2, 7)
end