-- Setup your Key Bindings here:  
--    windower.send_command('bind f7 gs c toggle mb')
   windower.send_command('bind f1 gs c avatar mode')
--    windower.send_command('bind f10 gs c toggle auto')
--    windower.send_command('bind f12 gs c toggle melee')

     
-- Setup your Gear Sets below:
function get_sets()
  
    -- My formatting is very easy to follow. All sets that pertain to my character doing things are under 'me'.
    -- All sets that are equipped to faciliate my avatar's behaviour or abilities are under 'avatar', eg, Perpetuation, Blood Pacts, etc
      
    sets.me = {}        -- leave this empty
    sets.avatar = {}    -- leave this empty
	
	augmentGear = {}
    augmentGear.CampestresATK= { name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: Damage taken -5%',}}
    augmentGear.CampestresMAB = { name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Accuracy+20 Attack+20','Pet: Magic Damage+10','"Fast Cast"+10',}}
	augmentGear.MerlinicFC ={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
	augmentGear.MerlinicMP ={ name="Merlinic Crackows", augments={'STR+3','DEX+1','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
	augmentGear.MerlinicATK={ name="Merlinic Dastanas", augments={'Pet: Accuracy+12 Pet: Rng. Acc.+12','Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+15',}}
	augmentGear.MerlinicMAB={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+10','Pet: INT+9','Pet: Mag. Acc.+9','Pet: "Mag.Atk.Bns."+13',}}  
    augmentGear.TelchineFTPetDT={ name="Telchine Pigaches", augments={'Pet: Accuracy+16 Pet: Rng. Acc.+16','Pet: "Dbl. Atk."+2','Pet: Damage taken -4%',}}
	augmentGear.TelchineFTEnhancing={ name="Telchine Pigaches", augments={'"Waltz" potency +4%','Enh. Mag. eff. dur. +7',}}
	
	-- Idle w/Movement -- 
    sets.me.idle = {
        main="Nirvana",
        sub="Oneiros Grip",      
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Loricate Torque +1",
        rear="Etiolation Earring",
        lear="Genmei Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        rring="Defending Ring",
        lring="Stikini Ring +1",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Assiduity Pants +1",
		feet="Herald's Gaiters"
    }
	-- Idle w/Refresh --
	sets.me.refresh = {
        main="Nirvana",
        sub="Oneiros Grip",      
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Loricate Torque +1",
        rear="Etiolation Earring",
        lear="Genmei Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        rring="Defending Ring",
        lring="Stikini Ring +1",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Assiduity Pants +1",
		feet={ name="Merlinic Crackows", augments={'STR+3','DEX+1','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
    }
      
    -- Your MP Recovered Whilst Resting Set
    sets.me.resting = { 
        main="Chatoyant's Staff",
        sub="Oneiros Grip",
        ammo="Mana Ampulla",
        head="Beckoner's Horn +1",
        neck="Eidolon Pendant +1",
        lear="Evans Earring",
        rear="Relaxing Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        rring="Defending Ring",
        lring="Stikini Ring +1",
        back="Felicitas Cape +1",
        waist="Shinjutsu-no-obi +1",
        legs="Assiduity Pants +1",
        feet="Merlinic Crakows"
    }
	-- PDT --
    sets.me.pdt = { 
        main="Terra's Staff",
        sub="Elan Strap +1",      
        ammo="Sancus Sachet +1",
        head="Hike Khat +1",
        neck="Loricate Torque +1",
        lear="Genmei Earring",
        rear="Relaxing Earring",
        body="Vrikodara Jupon",
        hands="Asteria Mitts +1",
        rring="Defending Ring",
        lring="Dark Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Artsieq Hose",
        feet="Battlecast Gaiters"
    }
	-- MDT --
    sets.me.mdt = { 
        main="Nirvana",
        sub="Elan Strap +1",      
        ammo="Sancus Sachet +1",
        head="Inyanga Tiara +1",
        neck="Loricate Torque +1",
        lear="Genmei Earring",
        rear="Relaxing Earring",
        body="Inyanga Jubbah +2",
        hands="Inyanga Dastanas +1",
        rring="Defending Ring",
        lring="Dark Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +1"
    }
    sets.me.mdtShell = { 
        main="Nirvana",
        sub="Elan Strap +1",      
        ammo="Sancus Sachet +1",
        head="Warder's Charm +1",
        neck="Loricate Torque +1",
        lear="Evans Earring",
        rear="Relaxing Earring",
        body="Inyanga Jubbah +2",
        hands="Inyanga Dastanas +1",
        rring="Defending Ring",
        lring="Shadow Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +1"
    }
	
	-- Kite(PDT) --
    sets.me.kite = { 
        main="Terra's Staff",
        sub="Elan Strap +1",      
        ammo="Sancus Sachet +1",
        head="Hike Khat +1",
        neck="Loricate Torque +1",
        lear="Genmei Earring",
        rear="Relaxing Earring",
        body="Vrikodara Jupon",
        hands="Asteria Mitts +1",
        rring="Defending Ring",
        lring="Dark Ring",
        back="Solemnity Cape",
        waist="Fucho-no-obi",
        legs="Artsieq Hose",
        feet="Herald's Gaiters" 
	 }
	 

	 
    -----------------------
    -- Perpetuation Related
    -----------------------
      
    -- Avatar's Out --  
    -- This is the base for all perpetuation scenarios, as seen below
    sets.avatar.perp = {
        main="Nirvana",
        sub="Oneiros Grip",        
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Evans Earring",
        rear="Rimeice Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        lring="Stikini Ring +1",
        rring="Thurandaut Ring",
        back= augmentGear.CampestresATK,
        waist="Klouskap Sash",
        legs="Assiduity Pants +1",
        feet="Herald's Gaiters"
    }
  
    -- The following sets base off of perpetuation, so you can consider them idle sets.
    -- Set the relevant gear, bearing in mind it will overwrite the perpetuation item for that slot!
    sets.avatar["Carbuncle"] = {hands="Asteria Mitts +1"}
    sets.avatar["Cait Sith"] = {hands="Lamassu Mitts +1"}
    -- When we want our avatar to stay alive
    sets.avatar.tank = set_combine(sets.avatar.perp,{
        main="Nirvana",
        sub="Oneiros Grip",   
        ammo="Sancus Sachet +1",
        head="Apogee Crown",
        neck="Smn. Collar +2",
        lear="Enmerkar Earring",
        rear="Rimeice Earring",
        body="Apogee Dalmatica",
        hands="Artsieq Cuffs",
        lring="Stikini Ring +1",
        rring="Thurandaut Ring",
        back= augmentGear.CampestresATK,
        waist="Isa Belt",
        legs="Enticer's Pants",
        feet=augmentGear.TelchineFTPetDT
    })
      
    -- When we want our avatar to shred
    sets.avatar.melee = set_combine(sets.avatar.perp,{
        main="Nirvana",
        sub="Oneiros Grip",
        
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        lear="Evans Earring",
        rear="Rimeice Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        lring="Stikini Ring +1",
        rring="Thurandaut Ring",
        back= augmentGear.CampestresATK,
        waist="Klouskap Sash",
        legs="Assiduity Pants +1",
        feet={ name="Merlinic Crackows", augments={'STR+3','DEX+1','"Refresh"+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
    })
      
    -- When we want our avatar to hit
    sets.avatar.acc = set_combine(sets.avatar.perp,{
        main="Nirvana",
        sub="Oneiros Grip",
        
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Adad Amulet",
        lear="Evans Earring",
        rear="Rimeice Earring",
        body="Apo. Dalmatica +1",
        hands="Regimen Mittens",
        lring="Stikini Ring +1",
        rring="Thurandaut Ring",
        back= augmentGear.CampestresATK,
        waist="Klouskap Sash",
        legs="Assiduity Pants +1",
        feet="Telchine Pigaches	"
    })
      
    -- When Avatar's Favor is active
    sets.avatar.favor = set_combine(sets.avatar.perp,{
        main="Nirvana",
        sub="Vox Grip",        
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Loricate Torque +1",
        lear="Evans Earring",
        rear="Andoaa Earring",
        body="Apo. Dalmatica +1",
        hands="Asteria Mitts +1",
        lring="Stikini Ring +1",
        rring="Thurandaut Ring",
        back="Conveyance Cape",
        waist="Fucho-no-obi",
        legs="Assiduity Pants +1",
        feet="Herald's Gaiters"
    })
      
    ----------------------------
    -- Summoning Skill Related
    -- Including all blood pacts
    ----------------------------
      
    -- + Summoning Magic. This is a base set for max skill and blood pacts and we'll overwrite later as and when we need to
    sets.avatar.skill = {
        main="Espiritus",
        sub="Vox Grip",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Incanter's Torque",
        lear="Summoning Earring",
        rear="Andoaa Earring",
        body="Apogee Dalmatica",
        hands="Lamassu Mitts +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back="Conveyance Cape",
        waist="Lucidity Sash",
        legs="Baayami Slops",
        feet="Apogee Pumps"
    }
      
    -------------------------
    -- Individual Blood Pacts
    -------------------------
      
    -- Physical damage
    sets.avatar.atk = set_combine(sets.avatar.skill,{
        main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Smn. Collar +2",
        lear="Lugalbanda Earring",
        rear="Gelos Earring",
        body="Con. Doublet +2",
        hands=augmentGear.MerlinicATK,
        lring="Varar Ring +1",
        rring="Varar Ring",
        back= augmentGear.CampestresATK,
        waist="Incarnation Sash",
        legs="Apogee Slacks +1",
        feet="Helios Boots"
    })
    sets.avatar.pacc = set_combine(sets.avatar.atk,{
        main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Smn. Collar +2",
        lear="Lugalbanda Earring",
        rear="Gelos Earring",
        body="Con. Doublet +2",
        hands="Merlinic Dastanas",
        lring="Varar Ring +1",
        rring="Varar Ring",
        back= augmentGear.CampestresATK,
        waist="Incarnation Sash",
        legs="Apogee Slacks +1",
        feet="Apogee Pumps +1"
    })
      
    -- Magic Attack
    sets.avatar.mab = set_combine(sets.avatar.skill,{
        main="Grioavolr",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Smn. Collar +2",
        lear="Lugalbanda Earring",
        rear="Gelos Earring",
        body="Apo. Dalmatica +1",
        hands=augmentGear.MerlinicMAB,
        lring="Speaker's Ring",
        rring="Varar Ring +1",
        back= augmentGear.CampestresMAB,
        waist="Incarnation Sash",
        legs="Apogee Slacks",
        feet="Apogee Pumps +1"
    })
	
    sets.avatar.mabtp = set_combine(sets.avatar.skill,{
        main="Grioavolr",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Smn. Collar +2",
        lear="Lugalbanda Earring",
        rear="Gelos Earring",
        body="Apo. Dalmatica +1",
        hands=augmentGear.MerlinicMAB,
        lring="Speaker's Ring",
        rring="Varar Ring +1",
        back= augmentGear.CampestresMAB,
        waist="Incarnation Sash",
        legs="Enticer's Pants",
        feet="Apogee Pumps +1"
    })
    sets.avatar.mb = set_combine(sets.avatar.mab,{hands="Glyphic Bracers +1"})
    -- Hybrid
    sets.avatar.hybrid = set_combine(sets.avatar.skill,{
        main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Apogee Crown +1",
        neck="Adad Amulet",
        lear="Lugalbanda Earring",
        rear="Gelos Earring",
        body="Con. Doublet +2",
        hands=augmentGear.MerlinicATK,
        lring="Varars Ring",
        rring="Varar Ring +1",
        back= augmentGear.CampestresATK,
        waist="Incarnation Sash",
        legs="Apogee Slacks +1",
        feet="Apogee Pumps +1"
    })
      
    -- Magic Accuracy
    sets.avatar.macc = set_combine(sets.avatar.skill,{
        main="Nirvana",
        sub="Vox Grip",        
        ammo="Sancus Sachet +1",
        head="Convoker's Horn +2",
        neck="Smn. Collar +2",
        lear="Enmerkar Earring",
        rear="Lugalbanda Earring",
        body="Con. Doublet +2",
        hands="Lamassu Mitts +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back= augmentGear.CampestresMAB,
        waist="Incarnation Sash",
        legs="Convo. Spats +2",
        feet="Convo. Pigaches +2"
    })
      
    -- Buffs
    sets.avatar.buff = set_combine(sets.avatar.skill,{
        main="Espiritus",
        sub="Vox Grip",       
        ammo="Sancus Sachet +1",
        head="Convoker's Horn +2",
        neck="Incanter's Torque",
        lear="Summoning Earring",
        rear="Andoaa Earring",
        body="Apogee Dalmatica",
        hands="Lamassu Mitts +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back="Conveyance Cape",
        waist="Lucidity Sash",
        legs="Baayami Slops",
        feet="Apogee Pumps"
    })
      
    -- Other
    sets.avatar.other = set_combine(sets.avatar.skill,{
        main="Nirvana",
        sub="Elan Strap +1",       
        ammo="Sancus Sachet +1",
        head="Convoker's Horn +2",
        neck="Incanter's Torque",
        lear="Summoning Earring",
        rear="Andoaa Earring",
        body="Apogee Dalmatica",
        hands="Lamassu Mitts +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back="Conveyance Cape",
        waist="Lucidity Sash",
        legs="Baayami Slops",
        feet="Apogee Pumps"
    })
      
    -- Combat Related Sets
      
    -- Melee
    -- The melee set combines with perpetuation, because we don't want to be losing all our MP whilst we swing our Staff
    -- Anything you equip here will overwrite the perpetuation/refresh in that slot.
    sets.me.melee = {       
        ammo="Sancus Sachet +1",
        head="Tali'ah Turban +1",
        neck="Smn. Collar +2",
        lear="Cessance Earring",
        rear="Dignitary's Earring",
        body="Tali'ah Manteel +1",
        hands="Tali'ah Gages +1",
        lring="Varar Ring",
        rring="Varar Ring +1",
        back=augmentGear.CampestresATK,
        waist="Klouskap Sash",
        legs="Tali'ah Sera. +1",
        feet="Tali'ah Crackows +1"
    }
      
    -- Shattersoul. Weapon Skills do not work off perpetuation as it only stays equipped for a moment
    sets.me["Shattersoul"] = {
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Fotia Gorget",
        lear="Friomisi Earring",
        rear="Novio Earring",
        body="Merlinic Jubbah",
        hands="Amalric Gages +1",
        lring="Stikini Ring +1",
        rring="Strendu Ring",
        back="Izdubar Mantle",
        waist="Fotia Belt",
        legs="Lengo Pants",
        feet="Inspirited Boots"
    }
    sets.me["Retribution"] = {
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Fotia Gorget",
        lear="Friomisi Earring",
        rear="Novio Earring",
        body="Merlinic Jubbah",
        hands="Amalric Gages +1",
        lring="Stikini Ring +1",
        rring="Strendu Ring",
        back="Izdubar Mantle",
        waist="Fotia Belt",
        legs="Lengo Pants",
        feet="Inspirited Boots"
    }
    sets.me["Garland of Bliss"] = {  
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
		--neck="Mizu. Kubikazari",
        neck="Fotia Gorget",
        lear="Friomisi Earring",
        rear="Novio Earring",
        body="Merlinic Jubbah",
        hands="Amalric Gages +1",
        lring="Stikini Ring +1",
        rring="Strendu Ring",
        back="Izdubar Mantle",
        waist="Fotia Belt",
		--waist="Eschan Stone",
        legs="Lengo Pants",
        feet="Amalric Nails +1"
    }	
    sets.me["Myrkr"] = {
        ammo="Psilomene",
        head="Beckoner's Horn +1",
        neck="Orunmila's Torque",
        lear="Evans Earring",
        rear="Gelos Earring",
        body="Beck. Doublet +1",
        hands="Beck. Bracers+1",
        lring="Mephitas's Ring",
        rring="Mephitas's Ring +1",
        back="Conveyance Cape",
        waist="Shinjutsu-no-Obi +1",
        legs="Baayami Slops",
        feet="Inspirited Boots"
    }
     

	 
  
  
    ---------------
    -- Casting Sets
    ---------------
      
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
      
    ----------
    -- Precast
    ----------
      
    -- Generic Casting Set that all others take off of. Here you should add all your fast cast  
    sets.precast.casting = {
        main="Nirvana",
        sub="Oneiros Grip",
        
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back= augmentGear.CampestresMAB,
        waist="Witful Belt",
        legs="Lengo Pants",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
    }   
      
    -- Summoning Magic Cast time - gear
    sets.precast.summoning = set_combine(sets.precast.casting,{
        main="Nirvana",
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back= augmentGear.CampestresMAB,
        waist="Witful Belt",
        legs="Lengo Pants",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
    })
      
    -- Enhancing Magic, eg. Siegal Sash, etc
    sets.precast.enhancing = set_combine(sets.precast.casting,{      
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back= augmentGear.CampestresMAB,
        waist="Witful Belt",
        legs="Lengo Pants",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
    })
  
    -- Stoneskin casting time -, works off of enhancing -
    sets.precast.stoneskin = set_combine(sets.precast.enhancing,{
        main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back= augmentGear.CampestresMAB,
        waist="Witful Belt",
        legs="Lengo Pants",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
    })
      
    -- Curing Precast, Cure Spell Casting time -
    sets.precast.cure = set_combine(sets.precast.casting,{
        main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Vanya Hood",
        neck="Orunmila's Torque",
        lear="Loquac. Earring",
        rear="Etiolation Earring",
        body="Inyanga Jubbah +2",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back= augmentGear.CampestresMAB,
        waist="Witful Belt",
        legs="Lengo Pants",
        feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+4','STR+9',}}
    })
      
    ---------------------
    -- Ability Precasting
    ---------------------
      
    -- Blood Pact Ability Delay
    sets.precast.bp = {
        main="Nirvana",
        sub="Vox Grip",      
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        neck="Incanter's Torque",
        lear="Summoning Earring",
        rear="Andoaa Earring",
        body="Apo. Dalmatica +1",
        hands="Glyphic Bracers +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back="Conveyance Cape",
        waist="Lucidity Sash",
        legs="Baayami Slops",
        feet="Apogee Pumps"
    }
      
    -- Mana Cede
    sets.precast["Mana Cede"] = {
        hands="Beck. Bracers +1",
    }
      
    -- Astral Flow  
    sets.precast["Astral Flow"] = {
        head="Glyphic Horn +1",
    }
      
    ----------
    -- Midcast
    ----------
      
    -- We handle the damage and etc. in Pet Midcast later
      
    -- Whatever you want to equip mid-cast as a catch all for all spells, and we'll overwrite later for individual spells
    sets.midcast.casting = set_combine(sets.precast.casting,{
        head="Amalric Coif +1",
        neck="Mizu. Kubikazari",
        lear="Friomisi Earring",
        rear="Novio Earring",
        body="Merlinic Jubbah",
        hands="Amalric Gages +1",
        lring="Stikini Ring",
        rring="Strendu Ring",
        back="Izdubar Mantle",
        waist="Eschan Stone",
        legs="Lengo Pants",
        feet="Inspirited Boots"
    })
	
	-- Elemental Magic --
	sets.midcast['Elemental Magic'] = {
	    head="Amalric Coif +1",
        neck="Mizu. Kubikazari",
        lear="Friomisi Earring",
        rear="Novio Earring",
        body="Merlinic Jubbah",
        hands="Amalric Gages +1",
        lring="Stikini Ring",
        rring="Strendu Ring",
        back="Izdubar Mantle",
        waist="Eschan Stone",
        legs="Lengo Pants",
        feet="Amalric Nails +1"
	}
	    -- Enfeebling
    sets.midcast.enfeebling = set_combine(sets.midcast.casting,{
        main="Nirvana",
        sub="Elan Strap +1",
        
        ammo="Sancus Sachet +1",
        --head="",
       -- neck="",
        --lear="",
        --rear="",
       -- body="",
        --hands="",
        --lring="",
        --rring="",
        --back="",
        waist="Chaac Belt",
        --legs="",
        --feet=""
    })
      
    -- Enhancing
    sets.midcast.enhancing = set_combine(sets.precast.enhancing,{
        main="Nirvana",
        sub="Elan Strap +1",
        
        ammo="Sancus Sachet +1",
        head="Telchine Cap",
        neck="Incanter's Torque",
        --lear="",
        --rear="",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        --lring="",
        --rring="",
        --back="",
        --waist="",
        legs="Telchine Braconi",
        feet=augmentGear.TelchineFTEnhancing
    })
      
    -- Stoneskin
    sets.midcast.stoneskin = set_combine(sets.midcast.enhancing,{   
        ammo="Sancus Sachet +1",
        head="Telchine Cap",
        neck="Stone Gorget",
        --lear="",
        --rear="",
        body="Telchine Chausble",
        hands="Telchine Gloves",
        --lring="",
        --rring="",
        --back="",
        waist="Siegel Sash",
        legs="Telchine Braconi",
        feet=augmentGear.TelchineFTEnhancing
    })
    -- Elemental Siphon, eg, Tatsumaki Thingies, Esper Stone, etc
    sets.midcast.siphon = set_combine(sets.avatar.skill,{
        sub="Vox Grip",
        ammo="Esper Stone +1",
        head="Beckoner's Horn +1",
        neck="Incanter's Torque",
        lear="Summoning Earring",
        rear="Andoaa Earring",
        body="Apogee Dalmatica",
        hands="Lamassu Mitts +1",
        rring="Evoker's Ring",
        lring="Stikini Ring +1",
        back="Conveyance Cape",
        waist="Lucidity Sash",
        legs="Baayami Slops",
        feet="Beck. Pigaches +1"
    })
        
    -- Cure Potency
    sets.midcast.cure = set_combine(sets.midcast.casting,{ 
        ammo="Sancus Sachet +1",
        head="Amalric Coif +1",
        neck="Phalaina Locket",
        lear="Loquac. Earring",
        rear="Roundel Earring",
        body="Vrikodara Jupon",
        hands="Telchine Gloves",
        lring="Kishar Ring",
        rring="Prolix Ring",
        back="Solemnity Cape",
        waist="Witful Belt",
        legs="Lengo Pants",
        feet="Medium's Sabots"
    })
      
    ------------
    -- Aftercast
    ------------
      
    -- I don't use aftercast sets, as we handle what to equip later depending on conditions using a function, eg, do we have an avatar out?
  
end