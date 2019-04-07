follow = false -- On/Off switch for /follow during the Auto() function.
followtarget = ''
followtargetinfo = nil
autoplay = false -- On/Off switch for the Auto() function.
automelee = false -- On/Off switch for the assisting & engaging via the Auto() function.
yourtarget = 17056472 -- Used to lock a target to memory such as a Voidwatch Rift for easy-trading.

NaDebuffsArray = { 15,9,7,4,6,8,31,3,5}

EraseDebuffsArray = { 13,12,11,21,128,129,130,131,132,133,134,135,136,137,138,139,140,141,
					142,144,145,146,147,148,149,194,557,558}

function AutoPlay()
	if autoplay == false then
		windower.add_to_chat(158,'----- AUTO PLAY Mode: ON -----')
		autoplay = true
		send_command('gs c AUTO')
	else
		windower.add_to_chat(123,'----- AUTO PLAY Mode: OFF -----')
		autoplay = false
	end
end

function AutoMelee_Toggle()
	if automelee == false then
		windower.add_to_chat(158,'----- Auto Melee: Enabled -----')
		automelee = true
		send_command('gs c AUTO')
	else
		windower.add_to_chat(123,'----- Auto Melee: Disabled -----')
		automelee = false
	end
end

-- HEALER COLLECTION --

--- Call these functions via Gearswap 'send_command()' to execute their respective checks ---
--[[Ex:
		if command == 'cure' then
			Cure()
		end
--]]


function Critical_Cure() -- Runs entire party through a Cure V/IV check.
	for i=1, party.count do
		if Critical_Cure_Check(party[i]) == 1 then
			return
		end
	end
end

function Cure() -- Runs entire party through a Cure III check.
	for i=1, party.count do
		if Cure_Check(party[i]) == 1 then
			return
		end
	end
end

function Haste(value) --Runs entire party through an Haste check.
	for i=1, party.count do
		if Haste_Check(party[i]) == 1 then
			return
		end
	end
end

function Erase() -- Runs entire party through an Erase/-Na check.
	for i=1, party.count do
		if Erase_Check(party[i]) == 1 then
			return
		end
	end
end


function Curing_Waltz()
	for i=1, party.count do
		if Curing_Waltz_Check(party[i]) == 1 then
			return
		end
	end
end

function Healing_Waltz()
	for i=1, party.count do
		if Healing_Waltz_Check(party[i]) == 1 then
			return
		end
	end
end
----

--- Backbone of the Cure/Critical_Cure/Haset/Erase functions ---
function Critical_Cure_Check(person) -- Is this Person in need of a strong cure?
	if person.mob == nil then
		return 0
	elseif person.mob.hpp < 70 and (person.mob.distance/20) < 21.04 then
		if player.main_job == 'WHM' and windower.ffxi.get_spell_recasts()[5] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure V" '..tostring(person.mob.name))
			return 1
		elseif windower.ffxi.get_spell_recasts()[4] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure IV" '..tostring(person.mob.name))
			return 1
		else
			return 0
		end
	else	
			return 0
	end
	
end

function Cure_Check(person) -- If player is below 75% Cure III them.
	if person.mob == nil then
		return 0
	elseif player.main_job == 'WHM' or player.main_job == 'RDM' or player.main_job == 'SCH' or player.sub == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'SCH' then
		if person.mob.hpp < 80 and (person.mob.distance/20) < 21.04 and windower.ffxi.get_spell_recasts()[3] == 0 then
			Pause_Follow()
			send_command('wait .5;input /ma "Cure III" '..tostring(person.mob.name))
			return 1
		else	
			return 0
		end
	else
		return 0
	end
end

function Haste_Check(person) -- Is this person in need of a Haste?
	if person.mob == nil or person.mob.is_npc then
		return 0
	elseif not person.buffactive[33] and (person.mob.distance/20) < 21.04 and not person.buffactive[13] and windower.ffxi.get_spell_recasts()[511] == 0 and not person.buffactive[265] and not person.buffactive[581] then	
		if player.main_job == 'RDM' then
			Pause_Follow()
			send_command('wait .5;input /ma "Haste II" '..tostring(person.mob.name))
			return 1
		elseif player.main_job == 'WHM' or player.sub_job == 'RDM' or player.sub_job == 'WHM' and windower.ffxi.get_spell_recasts()[57] == 0 and not person.buffactive[265] and not person.buffactive[581]  then
			Pause_Follow()
			send_command('wait .5;input /ma "Haste" '..tostring(person.mob.name))
			return 1
		else
			return 0
		end
	else
		return 0
	end
end
	
function Erase_Check(person) -- Is this person in need of an Erase or -na spell?
	if person.mob == nil or person.mob.is_npc then
		return 0
	elseif player.main_job == 'WHM' or player.sub_job == 'WHM' or buffactive['Addendum: White'] then
		if (person.mob.distance/20) < 21.04 then    
			--- Doom/Curse ---
			if person.buffactive[15] or person.buffactive[9] then
				Pause_Follow()
				send_command('wait .5;input /ma "Cursna" '..tostring(person.mob.name))
				return 1
			--- Petrafication ---
			elseif person.buffactive[7] then
				Pause_Follow()
				send_command('wait .5;input /ma "Stona" '..tostring(person.mob.name))
				return 1
			--- Paralysis ---
			elseif person.buffactive[4] then
				Pause_Follow()
				send_command('wait .5;input /ma "Paralyna" '..tostring(person.mob.name))
				return 1
			--- Silenced ---
			elseif person.buffactive[6] then
				Pause_Follow()
				send_command('wait .5;input /ma "Silena" '..tostring(person.mob.name))
				return 1
			--- Disease/Plague ---
			elseif person.buffactive[8] or person.buffactive[31] then
				Pause_Follow()
				send_command('wait .5;input /ma "Viruna" '..tostring(person.mob.name))
				return 1
			--- Poisoned ---
			elseif person.buffactive[3] then
				Pause_Follow()
				send_command('wait .5;input /ma "Poisona" '..tostring(person.mob.name))
				return 1
			--- Blindness ---
			elseif person.buffactive[5] then
				Pause_Follow()
				send_command('wait .5;input /ma "Blindna" '..tostring(person.mob.name))
				return 1
			--- Sleep ---
			elseif (person.buffactive[19] or person.buffactive[2]) and (player.main_job == 'WHM' or player.sub_job == 'WHM') then
				Pause_Follow()
				send_command('wait .7;input /ma "Curaga" '..tostring(person.mob.name))
				return 1
			elseif person.buffactive[19] then
				Pause_Follow()
				send_command('wait .5;input /ma "Cure" '..tostring(person.mob.name))
				return 1
			elseif EraseDebuffsCheck(person) > 1 then
					send_command('wait .5;input /ma "Erase" '..tostring(person.mob.name))
					return 1
			else
				return 0 -- Clean bill 'O health
			end
		else
			return 0 -- Party member is out of range; Tough luck for them.
		end
	else
		return 0 -- Player is not equiped to remove debuffs.
	end
end

function Curing_Waltz_Check(person) -- Runs through the party checking if anyone needs a Curing Waltz III
	if person.mob == nil then
		return 0
	elseif (player.main_job == 'DNC' or player.sub_job == 'DNC') and windower.ffxi.get_ability_recasts()[187] == 0 then
		if person.mob.hpp < 78 and (person.mob.distance/20) < 21.04 then
			send_command('input /ma "Curing Waltz III" '..tostring(person.mob.name))
			return 1
		else	
			return 0
		end
	else
		return 0
	end
end

function Healing_Waltz_Check(person)
	if person.mob == nil or person.mob.is_npc then
		return 0
	elseif (player.main_job == 'DNC' or player.sub_job == 'DNC') and windower.ffxi.get_ability_recasts()[215] == 0 then
		if (person.mob.distance/20) < 21.04 then    
			if NaDebuffsCheck(person) > 1 and player.tp >= 200 then
				send_command('input /ja "Healing Waltz" '..tostring(person.mob.name))
				return 1
			elseif (person.buffactive[19] or person.buffactive[2]) and player.tp >= 600 then
				send_command('input /ja "Divine Waltz" '..tostring(person.mob.name))
				return 1
			elseif EraseDebuffsCheck(person) > 1 and player.tp >= 200 then
				send_command('input /ja "Healing Waltz" '..tostring(person.mob.name))
				return 1
			else
				return 0 -- Clean bill 'O health
			end
		else
			return 0 -- Party member is out of range; Tough luck for them.
		end
	else
		return 0 -- Player is not equiped to remove debuffs.
	end
end

function EraseDebuffsCheck(person) -- Scans a player for any debuff found in DebuffArray and returns the Debuff ID.
	for i=1, #EraseDebuffsArray do
		if person.buffactive[EraseDebuffsArray[i]] then
			return EraseDebuffsArray[i]
		end
	end
	return 0
end

function NaDebuffsCheck(person) -- Scans a player for any debuff found in DebuffArray and returns the Debuff ID.
	for i=1, #NaDebuffsArray do
		if person.buffactive[NaDebuffsArray[i]] then
			return NaDebuffsArray[i]
		end
	end
	return 0
end

-- END HEALER COLLECTION -- 


function Pause_Follow() -- Pause's /Follow -- toggles autorun momentarily so the user may stand still to cast
	if follow == true then
		windower.send_command('setkey numpad7 down; wait 0.2;setkey numpad7 up')
	end
end

function Resume_Follow()
	if follow == true then
		windower.send_command('setkey numpad7 down; wait 0.2;setkey numpad7 up')
	end
end

function Toggle_Follow()
	if follow == false then
		if party[2] ~= nil then
			followtarget = tostring(party[2].name)
			windower.add_to_chat(158,'----- Follow Mode: ON -----')
			add_to_chat(260,'Following : '..followtarget)
			send_command('input /follow '..followtarget)
			follow = true
			Follow()
			
			return
		else
			add_to_chat(123,'Follow Failure: No viable target')
			follow = false
			followtarget = ''
			return
		end
	else
		windower.add_to_chat(123,'----- Follow Mode: OFF -----')
		follow = false
		followtarget = ''
		return
	end
end


function Follow()
	if follow == false then
		return
	elseif follow == true then
		send_command('input /follow '..followtarget)
	end
end

function Too_Far_Check() -- If autoplayer is too far from the followtarget then stop actions and /follow
	if follow == true then
		if party[2].mob.distance:sqrt() > 16.5 then
			send_command('input /follow '..followtarget)
			return 1
		end
	end
end

function Hang_Back()
	local dist = party[2].mob.distance:sqrt()
	local time = 2 - dist/10
	if dist < 10.1 and follow == true then
		windower.send_command('setkey numpad2 down;wait '..time..';move;setkey numpad2 up')
		return
	end
end

function Too_Close_Check()
	if player.status == 'Engaged' then
		if player.target.distance < 0.7 then
			windower.send_command('setkey numpad2 down;wait .2;setkey numpad2 up')
		end
	end
end

function AutoMelee()
	if player.status ~= 'Engaged' and follow == true and automelee == true then
		windower.send_command('input /assist <p1>;wait 1.2;input /attack')
	elseif player.target.type == 'MONSTER' and follow == true then
		if player.target.distance > (2.5 + player.target.model_size) and player.status == 'Engaged' then
			if player.target_locked == false then
				windower.send_command('input /lockon ;wait 0.5;input /follow <t>')
			end
			Too_Close_Check()
			windower.send_command('input /follow <t>')
		end
		windower.send_command('input /follow <t>')
	end 
end

--- 3rd Party - MyProject ---
function MyProject_Target_Fix()
	if player.target.type == 'PLAYER' then -- Prevents MyProject from getting hung on a player target.
		send_command('input /lockon;wait. 2;setkey escape down;wait .2;setkey escape up')
		return
	end
end
---