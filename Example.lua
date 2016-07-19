--[[
    Jadefire Lua Sample Script
    Developed by Asura

    This script uses Stormwind Guard (Entry 68) as a test for each type of script call.
--]]

--[[
    Example: Specific Data Per Creature.
    With Lua, using a local value is used for all creatures involved. While this isn't a problem for say a singular mob or boss,
    This causes plenty of issues where you have plenty of a single creature (Example: Stormwind Guard)

-- We use this at the end
local GuardEntry = 68   -- This is creature entry. I prefer using this just so it's set for cleanliness.
                        -- You can just set it as entry in all the RegisterUnitEvents below if you choose.

-- This sets us up a table specifically for this.
GUARD = {}

function UpdateHitVariable(Unit, count)
    local sUnit = tostring(Unit)
    GUARD[sUnit].LifeHit = count
end

function Guard_Spawn(Unit)
    local sUnit = tostring(Unit)        -- tostring basically prints out the Guid. We use this with GUARD to store data
    GUARD[sUnit] = {}                   -- Initialize everything.
    GUARD[sUnit].Enraged = 0            -- We set a variable like this. We don't actually have to define it anywhere
end

function Guard_HealthPerc(Unit, hpPerc)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if GUARD[sUnit].Enraged == 0 and hpPerc < 20
        GUARD[sUnit].Enraged = 1        -- Remember, when we set Enraged, we should set this back to 0 on death or end of combat.
        -- Here we would send whatever we need to do. Chat message, spell cast, emotes, etc. Brackets aren't used in Lua
    else
    end
end

function Guard_Death(Unit, MiscUnit)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if GUARD[sUnit].Enraged == 1
        GUARD[sUnit].Enraged = 0        -- Setting this back since we were Enraged before death.
end

function Guard_CombatEnd(Unit)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if GUARD[sUnit].Enraged == 1
        GUARD[sUnit].Enraged = 0        -- Setting this back since we were Enraged, but combat is over and we're returning home.
end

-- Lastly, we Register the events 
-- These are setup as CreatureEntry, EventId, Function Name as string.
RegisterUnitEvent(GuardEntry, 2, "Death")
RegisterUnitEvent(GuardEntry, 4, "CombatEnd")
RegisterUnitEvent(GuardEntry, 5, "HealthPerc")

--]]

-- LUA_EVENT_INITIALIZE_CREATURE(1)
function Spawn(Unit)

end

-- LUA_EVENT_TERMINATE_CREATURE(2)
function Death(Unit, Killer)

end

-- LUA_EVENT_INITIALIZE_COMBAT(3)
function CombatStart(Unit, Target)

end

-- LUA_EVENT_TERMINATE_COMBAT(4)
function CombatEnd(Unit)

end

-- LUA_EVENT_ON_HEALTH_PERCENT(5)
function HealthPerc(Unit, hpPerc)

end

-- LUA_EVENT_ON_DAMAGE_DEALT(6)
function DamageDealt(Unit, Target)

end

-- LUA_EVENT_ON_PHYSICAL_ATTACK(7)
function OnPhysicalAttack(Unit, Target)

end

-- LUA_EVENT_ON_SPELL_CAST(8)
function OnSpellCast(Unit, Spell, Target)

end

-- LUA_EVENT_ON_DAMAGE_TAKEN(9)
function OnDamageTaken(Unit, Attacker, Amount)

end

-- LUA_EVENT_ON_PHYSICAL_DAMAGE_TAKEN(10)
function OnPhysicalDamageTaken(Unit, Attacker)

end

-- LUA_EVENT_ON_SPELL_TAKEN(11)
function OnSpellTaken(Unit, Attacker, Spell)

end

-- LUA_EVENT_ON_SPELL_DAMAGE_TAKEN(12)
function OnSpellDamageTaken(Unit, Attacker, SpellId)

end

-- LUA_EVENT_ON_TARGET_DEATH(13)
function OnTargetDeath(Unit, Target)

end

-- LUA_EVENT_ON_REACH_WAYPOINT(14)
function OnReachWaypoint(Unit, WaypointId)

end

-- LUA_EVENT_ON_REACH_HOME(15)
function OnHomeArrival(Unit)

end

-- LUA_EVENT_ON_INITIALIZE_QUEST(16)
function OnInitializeQuest(Unit, QuestId, Player)

end

-- LUA_EVENT_ON_CONCLUDE_QUEST(17)
function OnConcludeQuest(Unit, QuestId, Player)

end

-- LUA_EVENT_ON_RECEIVE_EMOTE(18)
function OnRecieveEmote(Unit, Player, EmoteId)

end

-- LUA_EVENT_ON_GOSSIP_REQUEST(19)
function OnGossipRequest(Unit, Player)

end

-- LUA_EVENT_ON_AURA_ADDED(20)
function OnAddAura(Unit, AuraId)

end

-- LUA_EVENT_ON_AURA_REMOVED(21)
function OnRemoveAura(Unit, AuraId)

end

-- LUA_EVENT_ON_HANDLE_EVENT(22)
function OnHandleEvent(Unit, GossipItem, Player)

end

-- LUA_EVENT_AI_UPDATE(23)
function AIUpdate(Unit, mapScript, timeDiff)

end

-- LUA_EVENT_ON_DESTRUCTION(24)
function OnDestruction(Unit)

end

-- LUA_EVENT_CLEAR_SCRIPT(25)
function ClearScript(Unit)

end

--[[
local entry = 68;
RegisterUnitEvent(entry, 1,  "Spawn")
RegisterUnitEvent(entry, 2,  "Death")
RegisterUnitEvent(entry, 3,  "CombatStart")
RegisterUnitEvent(entry, 4,  "CombatEnd")
RegisterUnitEvent(entry, 5,  "HealthPerc")
RegisterUnitEvent(entry, 6,  "DamageDealt")
RegisterUnitEvent(entry, 7,  "OnPhysicalAttack")
RegisterUnitEvent(entry, 8,  "OnSpellCast")
RegisterUnitEvent(entry, 9,  "OnDamageTaken")
RegisterUnitEvent(entry, 10, "OnPhysicalDamageTaken")
RegisterUnitEvent(entry, 11, "OnSpellTaken")
RegisterUnitEvent(entry, 12, "OnSpellDamageTaken")
RegisterUnitEvent(entry, 13, "OnTargetDeath")
RegisterUnitEvent(entry, 14, "OnReachWaypoint")
RegisterUnitEvent(entry, 15, "OnHomeArrival")
RegisterUnitEvent(entry, 16, "OnInitializeQuest")
RegisterUnitEvent(entry, 17, "OnConcludeQuest")
RegisterUnitEvent(entry, 18, "OnRecieveEmote")
RegisterUnitEvent(entry, 19, "OnGossipRequest")
RegisterUnitEvent(entry, 20, "OnAddAura")
RegisterUnitEvent(entry, 21, "OnRemoveAura")
RegisterUnitEvent(entry, 22, "OnHandleEvent")
RegisterUnitEvent(entry, 23, "AIUpdate")
RegisterUnitEvent(entry, 24, "OnDestruction")
RegisterUnitEvent(entry, 25, "ClearScript")
--]]

