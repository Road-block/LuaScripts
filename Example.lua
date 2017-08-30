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

-- This sets us up a table specifically for this Script. All functions and variables scoped to this script should go in here.
local Script = {}

function Script.Guard_Spawn(Unit)
    local sUnit = tostring(Unit)        -- tostring basically prints out the Guid. We use this with Script to store data
    Script[sUnit] = {}                   -- Initialize everything.
    Script[sUnit].Enraged = 0            -- We set a variable like this. We don't actually have to define it anywhere
end

function Script.Guard_HealthPerc(Unit, hpPerc)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if Script[sUnit].Enraged == 0 and hpPerc < 20
        Script[sUnit].Enraged = 1        -- Remember, when we set Enraged, we should set this back to 0 on death or end of combat.
        -- Here we would send whatever we need to do. Chat message, spell cast, emotes, etc. Brackets aren't used in Lua
    else
    end
end

function Script.Guard_Death(Unit, MiscUnit)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if Script[sUnit].Enraged == 1 then
        Script[sUnit].Enraged = 0        -- Setting this back since we were Enraged before death.
    end
end

function Script.Guard_CombatEnd(Unit)
    local sUnit = tostring(Unit)        -- Same as above, we need this to get the data for the current creature.

    if Script[sUnit].Enraged == 1 then
        Script[sUnit].Enraged = 0        -- Setting this back since we were Enraged, but combat is over and we're returning home.
    end
end

-- Lastly, we Register the events 
-- These are setup as CreatureEntry, EventId, Function as reference.
RegisterUnitEvent(GuardEntry, 2, Script.Guard_Death)
RegisterUnitEvent(GuardEntry, 4, Script.Guard_CombatEnd)
RegisterUnitEvent(GuardEntry, 5, Script.Guard_HealthPerc)

--]]

local Script = {}

-- LUA_EVENT_INITIALIZE_CREATURE(1)
function Script.Spawn(Unit)

end

-- LUA_EVENT_TERMINATE_CREATURE(2)
function Script.Death(Unit, Killer)

end

-- LUA_EVENT_INITIALIZE_COMBAT(3)
function Script.CombatStart(Unit, Target)

end

-- LUA_EVENT_TERMINATE_COMBAT(4)
function Script.CombatEnd(Unit)

end

-- LUA_EVENT_ON_HEALTH_PERCENT(5)
function Script.HealthPerc(Unit, hpPerc)

end

-- LUA_EVENT_ON_DAMAGE_DEALT(6)
function Script.DamageDealt(Unit, Target)

end

-- LUA_EVENT_ON_PHYSICAL_ATTACK(7)
function Script.OnPhysicalAttack(Unit, Target)

end

-- LUA_EVENT_ON_SPELL_CAST(8)
function Script.OnSpellCast(Unit, Spell, Target)

end

-- LUA_EVENT_ON_DAMAGE_TAKEN(9)
function Script.OnDamageTaken(Unit, Attacker, Amount)

end

-- LUA_EVENT_ON_PHYSICAL_DAMAGE_TAKEN(10)
function Script.OnPhysicalDamageTaken(Unit, Attacker)

end

-- LUA_EVENT_ON_SPELL_TAKEN(11)
function Script.OnSpellTaken(Unit, Attacker, Spell)

end

-- LUA_EVENT_ON_SPELL_DAMAGE_TAKEN(12)
function Script.OnSpellDamageTaken(Unit, Attacker, SpellId)

end

-- LUA_EVENT_ON_TARGET_DEATH(13)
function Script.OnTargetDeath(Unit, Target)

end

-- LUA_EVENT_ON_REACH_WAYPOINT(14)
function Script.OnReachWaypoint(Unit, WaypointId)

end

-- LUA_EVENT_ON_REACH_HOME(15)
function Script.OnHomeArrival(Unit)

end

-- LUA_EVENT_ON_INITIALIZE_QUEST(16)
function Script.OnInitializeQuest(Unit, QuestId, Player)

end

-- LUA_EVENT_ON_CONCLUDE_QUEST(17)
function Script.OnConcludeQuest(Unit, QuestId, Player)

end

-- LUA_EVENT_ON_RECEIVE_EMOTE(18)
function Script.OnRecieveEmote(Unit, Player, EmoteId)

end

-- LUA_EVENT_ON_GOSSIP_REQUEST(19)
function Script.OnGossipRequest(Unit, Player)

end

-- LUA_EVENT_ON_AURA_ADDED(20)
function Script.OnAddAura(Unit, AuraId)

end

-- LUA_EVENT_ON_AURA_REMOVED(21)
function Script.OnRemoveAura(Unit, AuraId)

end

-- LUA_EVENT_ON_HANDLE_EVENT(22)
function Script.OnHandleEvent(Unit, GossipItem, Player)

end

-- LUA_EVENT_AI_UPDATE(23)
function Script.AIUpdate(Unit, mapScript, timeDiff)

end

-- LUA_EVENT_ON_DESTRUCTION(24)
function Script.OnDestruction(Unit)

end

-- LUA_EVENT_CLEAR_SCRIPT(25)
function Script.ClearScript(Unit)

end

--[[
local entry = 68;
RegisterUnitEvent(entry, 1,  Script.Spawn)
RegisterUnitEvent(entry, 2,  Script.Death)
RegisterUnitEvent(entry, 3,  Script.CombatStart)
RegisterUnitEvent(entry, 4,  Script.CombatEnd)
RegisterUnitEvent(entry, 5,  Script.HealthPerc)
RegisterUnitEvent(entry, 6,  Script.DamageDealt)
RegisterUnitEvent(entry, 7,  Script.OnPhysicalAttack)
RegisterUnitEvent(entry, 8,  Script.OnSpellCast)
RegisterUnitEvent(entry, 9,  Script.OnDamageTaken)
RegisterUnitEvent(entry, 10, Script.OnPhysicalDamageTaken)
RegisterUnitEvent(entry, 11, Script.OnSpellTaken)
RegisterUnitEvent(entry, 12, Script.OnSpellDamageTaken)
RegisterUnitEvent(entry, 13, Script.OnTargetDeath)
RegisterUnitEvent(entry, 14, Script.OnReachWaypoint)
RegisterUnitEvent(entry, 15, Script.OnHomeArrival)
RegisterUnitEvent(entry, 16, Script.OnInitializeQuest)
RegisterUnitEvent(entry, 17, Script.OnConcludeQuest)
RegisterUnitEvent(entry, 18, Script.OnRecieveEmote)
RegisterUnitEvent(entry, 19, Script.OnGossipRequest)
RegisterUnitEvent(entry, 20, Script.OnAddAura)
RegisterUnitEvent(entry, 21, Script.OnRemoveAura)
RegisterUnitEvent(entry, 22, Script.OnHandleEvent)
RegisterUnitEvent(entry, 23, Script.AIUpdate)
RegisterUnitEvent(entry, 24, Script.OnDestruction)
RegisterUnitEvent(entry, 25, Script.ClearScript)
--]]

