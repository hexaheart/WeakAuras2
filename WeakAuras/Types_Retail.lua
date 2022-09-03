if not WeakAuras.IsLibsOK() then return end
local AddonName, Private = ...

local WeakAuras = WeakAuras;
local L = WeakAuras.L;

local encounter_list = ""
local zoneId_list = ""
function Private.InitializeEncounterAndZoneLists()
  if encounter_list ~= "" then
    return
  end
  EJ_SelectTier(EJ_GetCurrentTier())

  for _, inRaid in ipairs({false, true}) do
    local instance_index = 1
    local instance_id = EJ_GetInstanceByIndex(instance_index, inRaid)
    local title = inRaid and L["Raids"] or L["Dungeons"]
    zoneId_list = ("%s|cffffd200%s|r\n"):format(zoneId_list, title)

    while instance_id do
      EJ_SelectInstance(instance_id)
      local instance_name, _, _, _, _, _, dungeonAreaMapID = EJ_GetInstanceInfo(instance_id)
      local ej_index = 1
      local boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(ej_index, instance_id)

      -- zone ids
      if dungeonAreaMapID and dungeonAreaMapID ~= 0 then
        local mapGroupId = C_Map.GetMapGroupID(dungeonAreaMapID)
        if mapGroupId then -- If there's a group id, only list that one
          zoneId_list = ("%s%s: g%d\n"):format(zoneId_list, instance_name, mapGroupId)
        else
          zoneId_list = ("%s%s: %d\n"):format(zoneId_list, instance_name, dungeonAreaMapID)
        end
      end

      -- Encounter ids
      if inRaid then
        while boss do
          if encounter_id then
            if instance_name then
              encounter_list = ("%s|cffffd200%s|r\n"):format(encounter_list, instance_name)
              instance_name = nil -- Only add it once per section
            end
            encounter_list = ("%s%s: %d\n"):format(encounter_list, boss, encounter_id)
          end
          ej_index = ej_index + 1
          boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(ej_index, instance_id)
        end
        encounter_list = encounter_list .. "\n"
      end
      instance_index = instance_index + 1
      instance_id = EJ_GetInstanceByIndex(instance_index, inRaid)
    end
    zoneId_list = zoneId_list .. "\n"
  end

  encounter_list = encounter_list:sub(1, -3) .. "\n\n" .. L["Supports multiple entries, separated by commas\n"]
end

function Private.get_encounters_list()
  return encounter_list
end

function Private.get_zoneId_list()
  return zoneId_list
end

if WeakAuras.IsDragonflight() then
  Private.TalentInfo = {
    [66] = {
      [79795] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61784,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378425,
      },
      [79803] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 327193,
      },
      [79811] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61783,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61768,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 31935,
      },
      [79819] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61770,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385438,
      },
      [79827] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61823,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61811,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 105809,
      },
      [79835] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61817,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 10326,
      },
      [79843] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61830,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61829,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 20066,
      },
      [79851] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61828,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61803,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 384914,
      },
      [79859] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61841,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61835,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61821,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 385515,
      },
      [79867] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61802,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61814,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 377016,
      },
      [79788] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61799,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61794,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 386568,
      },
      [79796] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61784,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 204023,
      },
      [79804] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61797,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385726,
      },
      [79812] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61771,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61795,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 204074,
      },
      [79820] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61770,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 384442,
      },
      [79828] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61823,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61811,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 223817,
      },
      [79836] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61829,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61806,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 230332,
      },
      [79844] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61803,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 114154,
      },
      [79852] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61828,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61803,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 384820,
      },
      [79860] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61835,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61829,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 213644,
      },
      [79868] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61839,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61813,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385639,
      },
      [79789] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61772,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378457,
      },
      [79797] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61798,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61777,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 204054,
      },
      [79805] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61766,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61799,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 204019,
      },
      [79813] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61770,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61775,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 315924,
      },
      [79821] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61790,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61796,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61793,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 378405,
      },
      [79829] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61834,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61816,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 633,
      },
      [79837] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61826,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385450,
      },
      [79845] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61832,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61823,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385427,
      },
      [79853] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61803,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61818,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 204018,
      },
      [79861] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61837,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61807,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 231663,
      },
      [79869] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61810,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61819,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61806,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 190784,
      },
      [79790] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61772,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378845,
      },
      [79798] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61800,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61785,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 380188,
      },
      [79806] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61766,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61799,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 53595,
      },
      [79814] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61772,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61765,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 378279,
      },
      [79822] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61800,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61796,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61786,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 209389,
      },
      [79830] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61822,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 384897,
      },
      [79838] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61838,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61813,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 24275,
      },
      [79846] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61806,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61837,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 376996,
      },
      [79854] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61803,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61818,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 384909,
      },
      [79862] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61827,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385728,
      },
      [79870] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61832,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 377043,
      },
      [79791] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61787,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61789,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61791,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 86659,
      },
      [79799] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61797,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61798,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 31850,
      },
      [79807] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61795,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 379043,
      },
      [79815] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61798,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 279387,
      },
      [79823] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61792,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61782,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61778,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 85043,
      },
      [79831] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61802,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61821,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61809,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 384376,
      },
      [79839] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61837,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61831,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 234299,
      },
      [79847] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 385129,
      },
      [79855] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 171648,
      },
      [79863] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61828,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61822,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385414,
      },
      [79871] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61833,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 183778,
      },
      [79784] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61767,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 379017,
      },
      [79792] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61767,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 204077,
      },
      [79800] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 379391,
      },
      [79808] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61769,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385422,
      },
      [79816] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61774,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61775,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 379008,
      },
      [79824] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61785,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61773,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 378285,
      },
      [79832] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61814,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 96231,
      },
      [79840] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61808,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61840,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 377053,
      },
      [79848] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61824,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61833,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61817,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 6940,
      },
      [79856] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 152262,
      },
      [79864] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61839,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61816,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385633,
      },
      [79785] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61776,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 152261,
      },
      [79793] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61781,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378762,
      },
      [79801] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 386738,
      },
      [79809] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61770,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61773,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 383388,
      },
      [79817] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61801,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 321136,
      },
      [79825] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61797,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61780,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 379022,
      },
      [79833] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61818,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61840,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385349,
      },
      [79841] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61838,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61834,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61839,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 1044,
      },
      [79849] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61836,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 384815,
      },
      [79857] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 391142,
      },
      [79865] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61805,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61833,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 377128,
      },
      [79786] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 386653,
      },
      [79794] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61769,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378974,
      },
      [79802] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61793,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61774,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 379021,
      },
      [79810] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61771,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61767,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61765,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 209202,
      },
      [79818] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61779,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375576,
      },
      [79826] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61808,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61817,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 61825,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 1022,
      },
      [79834] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61818,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61840,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385464,
      },
      [79842] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61830,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61829,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 115750,
      },
      [79850] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61826,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385425,
      },
      [79858] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61811,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61836,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 385416,
      },
      [79866] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61820,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 385125,
      },
      [79787] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 61799,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 61794,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 280373,
      },
    },
    [70] = {
      [79938] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61861,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61877,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61859,
          }, -- [3]
        },
        ["spellID"] = 383334,
      },
      [79946] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61850,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61905,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61851,
          }, -- [3]
        },
        ["spellID"] = 53385,
      },
      [79827] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [2]
        },
        ["spellID"] = 105809,
      },
      [79835] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [1]
        },
        ["spellID"] = 10326,
      },
      [79843] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61830,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 20066,
      },
      [79851] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [2]
        },
        ["spellID"] = 384914,
      },
      [79859] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61841,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61835,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61821,
          }, -- [3]
        },
        ["spellID"] = 385515,
      },
      [79867] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61802,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61814,
          }, -- [2]
        },
        ["spellID"] = 377016,
      },
      [79875] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 387170,
      },
      [79883] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 383300,
      },
      [79891] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61860,
          }, -- [1]
        },
        ["spellID"] = 387479,
      },
      [79899] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61865,
          }, -- [1]
        },
        ["spellID"] = 205191,
      },
      [79907] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61874,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61854,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61866,
          }, -- [3]
        },
        ["spellID"] = 203316,
      },
      [79939] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61861,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61877,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61859,
          }, -- [3]
        },
        ["spellID"] = 382430,
      },
      [79947] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61900,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61906,
          }, -- [2]
        },
        ["spellID"] = 383254,
      },
      [79828] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [2]
        },
        ["spellID"] = 223817,
      },
      [79836] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [2]
        },
        ["spellID"] = 230332,
      },
      [79844] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
        },
        ["spellID"] = 114154,
      },
      [79852] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [2]
        },
        ["spellID"] = 384820,
      },
      [79860] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61835,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 213644,
      },
      [79868] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61839,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61813,
          }, -- [2]
        },
        ["spellID"] = 385639,
      },
      [79884] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 383350,
      },
      [79892] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61860,
          }, -- [1]
        },
        ["spellID"] = 204054,
      },
      [79900] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61865,
          }, -- [1]
        },
        ["spellID"] = 215661,
      },
      [79908] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61874,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61854,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61866,
          }, -- [3]
        },
        ["spellID"] = 326732,
      },
      [79940] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61898,
          }, -- [1]
        },
        ["spellID"] = 382536,
      },
      [79948] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61907,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61897,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61899,
          }, -- [3]
        },
        ["spellID"] = 269569,
      },
      [79829] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61834,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61816,
          }, -- [2]
        },
        ["spellID"] = 633,
      },
      [79837] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61826,
          }, -- [1]
        },
        ["spellID"] = 385450,
      },
      [79845] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61832,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [2]
        },
        ["spellID"] = 385427,
      },
      [79853] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [2]
        },
        ["spellID"] = 204018,
      },
      [79861] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61807,
          }, -- [2]
        },
        ["spellID"] = 231663,
      },
      [79869] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61810,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61819,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [3]
        },
        ["spellID"] = 190784,
      },
      [79885] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 383396,
      },
      [79893] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61857,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61843,
          }, -- [2]
        },
        ["spellID"] = 383388,
      },
      [79901] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61866,
          }, -- [1]
        },
        ["spellID"] = 387640,
      },
      [79909] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61844,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61865,
          }, -- [2]
        },
        ["spellID"] = 326734,
      },
      [79941] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61899,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61876,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61869,
          }, -- [3]
        },
        ["spellID"] = 498,
      },
      [79949] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61898,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61858,
          }, -- [2]
        },
        ["spellID"] = 383271,
      },
      [79830] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61822,
          }, -- [1]
        },
        ["spellID"] = 384897,
      },
      [79838] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61838,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61813,
          }, -- [2]
        },
        ["spellID"] = 24275,
      },
      [79846] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [2]
        },
        ["spellID"] = 376996,
      },
      [79854] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [2]
        },
        ["spellID"] = 384909,
      },
      [79862] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61827,
          }, -- [1]
        },
        ["spellID"] = 385728,
      },
      [79870] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61832,
          }, -- [1]
        },
        ["spellID"] = 377043,
      },
      [79886] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 343721,
      },
      [79894] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61860,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61844,
          }, -- [2]
        },
        ["spellID"] = 183218,
      },
      [79902] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61873,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61867,
          }, -- [2]
        },
        ["spellID"] = 383344,
      },
      [79910] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61844,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61865,
          }, -- [2]
        },
        ["spellID"] = 85804,
      },
      [79942] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61899,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61876,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61869,
          }, -- [3]
        },
        ["spellID"] = 184662,
      },
      [79831] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61802,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61821,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61809,
          }, -- [3]
        },
        ["spellID"] = 384376,
      },
      [79839] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61831,
          }, -- [2]
        },
        ["spellID"] = 234299,
      },
      [79847] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 385129,
      },
      [79855] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 171648,
      },
      [79863] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61822,
          }, -- [2]
        },
        ["spellID"] = 385414,
      },
      [79871] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [1]
        },
        ["spellID"] = 183778,
      },
      [79887] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 387196,
      },
      [79895] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61855,
          }, -- [1]
        },
        ["spellID"] = 383304,
      },
      [79903] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61873,
          }, -- [1]
        },
        ["spellID"] = 382275,
      },
      [79911] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61874,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61861,
          }, -- [2]
        },
        ["spellID"] = 384392,
      },
      [79943] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61900,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61871,
          }, -- [2]
        },
        ["spellID"] = 383342,
      },
      [79832] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61814,
          }, -- [1]
        },
        ["spellID"] = 96231,
      },
      [79840] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61808,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 377053,
      },
      [79848] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61824,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [3]
        },
        ["spellID"] = 6940,
      },
      [79856] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 152262,
      },
      [79864] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61839,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61816,
          }, -- [2]
        },
        ["spellID"] = 385633,
      },
      [79872] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 384027,
      },
      [79880] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 386967,
      },
      [79888] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 384162,
      },
      [79896] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 383314,
      },
      [79904] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61871,
          }, -- [1]
        },
        ["spellID"] = 383263,
      },
      [79912] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61874,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61861,
          }, -- [2]
        },
        ["spellID"] = 384442,
      },
      [79944] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61850,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61901,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61870,
          }, -- [3]
        },
        ["spellID"] = 267344,
      },
      [79833] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 385349,
      },
      [79841] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61838,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61834,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61839,
          }, -- [3]
        },
        ["spellID"] = 1044,
      },
      [79849] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61836,
          }, -- [1]
        },
        ["spellID"] = 384815,
      },
      [79857] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 391142,
      },
      [79865] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61805,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [2]
        },
        ["spellID"] = 377128,
      },
      [79873] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61842,
          }, -- [1]
        },
        ["spellID"] = 375576,
      },
      [79881] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61906,
          }, -- [1]
        },
        ["spellID"] = 383228,
      },
      [79889] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61856,
          }, -- [1]
        },
        ["spellID"] = 343527,
      },
      [79897] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61863,
          }, -- [1]
        },
        ["spellID"] = 383327,
      },
      [79905] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61869,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61868,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61872,
          }, -- [3]
        },
        ["spellID"] = 231832,
      },
      [79913] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61853,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61875,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61852,
          }, -- [3]
        },
        ["spellID"] = 255937,
      },
      [79937] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61898,
          }, -- [1]
        },
        ["spellID"] = 267610,
      },
      [79945] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61902,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61904,
          }, -- [2]
        },
        ["spellID"] = 184575,
      },
      [79826] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61808,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61825,
          }, -- [3]
        },
        ["spellID"] = 1022,
      },
      [79834] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 385464,
      },
      [79842] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61830,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 115750,
      },
      [79850] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61826,
          }, -- [1]
        },
        ["spellID"] = 385425,
      },
      [79858] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61836,
          }, -- [2]
        },
        ["spellID"] = 385416,
      },
      [79866] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61820,
          }, -- [1]
        },
        ["spellID"] = 385125,
      },
      [79874] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61862,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61845,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61843,
          }, -- [3]
        },
        ["spellID"] = 383276,
      },
      [79882] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 384052,
      },
      [79890] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61859,
          }, -- [1]
        },
        ["spellID"] = 383876,
      },
      [79898] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61862,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61864,
          }, -- [2]
        },
        ["spellID"] = 383274,
      },
      [79906] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61873,
          }, -- [1]
        },
        ["spellID"] = 386901,
      },
      [79914] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 383185,
      },
    },
    [65] = {
      [79922] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61882,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61881,
          }, -- [2]
        },
        ["spellID"] = 388006,
      },
      [79930] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61890,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61892,
          }, -- [2]
        },
        ["spellID"] = 183998,
      },
      [79954] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61910,
          }, -- [1]
        },
        ["spellID"] = 114158,
      },
      [79962] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61887,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61920,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61883,
          }, -- [3]
        },
        ["spellID"] = 31821,
      },
      [79843] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61830,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 20066,
      },
      [79851] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [2]
        },
        ["spellID"] = 384914,
      },
      [79859] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61841,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61835,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61821,
          }, -- [3]
        },
        ["spellID"] = 385515,
      },
      [79867] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61802,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61814,
          }, -- [2]
        },
        ["spellID"] = 377016,
      },
      [79915] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 238060,
      },
      [79923] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61880,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61884,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61879,
          }, -- [3]
        },
        ["spellID"] = 200474,
      },
      [79931] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61888,
          }, -- [1]
        },
        ["spellID"] = 387801,
      },
      [79955] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61911,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61909,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61849,
          }, -- [3]
        },
        ["spellID"] = 387781,
      },
      [79963] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61921,
          }, -- [1]
        },
        ["spellID"] = 200430,
      },
      [79844] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
        },
        ["spellID"] = 114154,
      },
      [79852] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [2]
        },
        ["spellID"] = 384820,
      },
      [79860] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61835,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 213644,
      },
      [79868] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61839,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61813,
          }, -- [2]
        },
        ["spellID"] = 385639,
      },
      [79876] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 388007,
      },
      [79916] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61878,
          }, -- [1]
        },
        ["spellID"] = 200652,
      },
      [79924] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61885,
          }, -- [1]
        },
        ["spellID"] = 200482,
      },
      [79932] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61887,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61892,
          }, -- [2]
        },
        ["spellID"] = 388005,
      },
      [79956] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61912,
          }, -- [1]
        },
        ["spellID"] = 387993,
      },
      [79964] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61922,
          }, -- [1]
        },
        ["spellID"] = 387805,
      },
      [79845] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61832,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [2]
        },
        ["spellID"] = 385427,
      },
      [79853] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [2]
        },
        ["spellID"] = 204018,
      },
      [79861] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61807,
          }, -- [2]
        },
        ["spellID"] = 231663,
      },
      [79869] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61810,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61819,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [3]
        },
        ["spellID"] = 190784,
      },
      [79877] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61848,
          }, -- [1]
        },
        ["spellID"] = 375576,
      },
      [79917] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 387879,
      },
      [79925] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61886,
          }, -- [1]
        },
        ["spellID"] = 214202,
      },
      [79933] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61895,
          }, -- [1]
        },
        ["spellID"] = 387998,
      },
      [79957] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61917,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61913,
          }, -- [2]
        },
        ["spellID"] = 82326,
      },
      [79965] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61884,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61847,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61923,
          }, -- [3]
        },
        ["spellID"] = 325966,
      },
      [79846] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [2]
        },
        ["spellID"] = 376996,
      },
      [79854] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61803,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [2]
        },
        ["spellID"] = 384909,
      },
      [79862] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61827,
          }, -- [1]
        },
        ["spellID"] = 385728,
      },
      [79870] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61832,
          }, -- [1]
        },
        ["spellID"] = 377043,
      },
      [79878] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 387893,
      },
      [79918] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 208408,
      },
      [79926] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 200025,
      },
      [79934] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61895,
          }, -- [1]
        },
        ["spellID"] = 223306,
      },
      [79950] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 196926,
      },
      [79958] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61914,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61916,
          }, -- [2]
        },
        ["spellID"] = 20473,
      },
      [79966] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 148039,
      },
      [79847] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 385129,
      },
      [79855] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 171648,
      },
      [79863] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61828,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61822,
          }, -- [2]
        },
        ["spellID"] = 385414,
      },
      [79871] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [1]
        },
        ["spellID"] = 183778,
      },
      [79879] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 387786,
      },
      [79919] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 248033,
      },
      [79927] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 156910,
      },
      [79935] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61891,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61893,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61896,
          }, -- [3]
        },
        ["spellID"] = 157047,
      },
      [79951] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61908,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61910,
          }, -- [2]
        },
        ["spellID"] = 231667,
      },
      [79959] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61894,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61917,
          }, -- [2]
        },
        ["spellID"] = 85222,
      },
      [79840] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61808,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 377053,
      },
      [79848] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61824,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [3]
        },
        ["spellID"] = 6940,
      },
      [79856] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 152262,
      },
      [79864] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61839,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61816,
          }, -- [2]
        },
        ["spellID"] = 385633,
      },
      [79920] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61884,
          }, -- [1]
        },
        ["spellID"] = 387808,
      },
      [79928] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 388018,
      },
      [79936] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61887,
          }, -- [1]
        },
        ["spellID"] = 231642,
      },
      [79952] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61846,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61921,
          }, -- [2]
        },
        ["spellID"] = 387791,
      },
      [79960] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61918,
          }, -- [1]
        },
        ["spellID"] = 53576,
      },
      [79841] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61838,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61834,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61839,
          }, -- [3]
        },
        ["spellID"] = 1044,
      },
      [79849] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61836,
          }, -- [1]
        },
        ["spellID"] = 384815,
      },
      [79857] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 391142,
      },
      [79865] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61805,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61833,
          }, -- [2]
        },
        ["spellID"] = 377128,
      },
      [79839] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61837,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61831,
          }, -- [2]
        },
        ["spellID"] = 234299,
      },
      [79838] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61838,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61813,
          }, -- [2]
        },
        ["spellID"] = 24275,
      },
      [79837] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61826,
          }, -- [1]
        },
        ["spellID"] = 385450,
      },
      [79836] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61806,
          }, -- [2]
        },
        ["spellID"] = 230332,
      },
      [79835] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [1]
        },
        ["spellID"] = 10326,
      },
      [79921] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61882,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61881,
          }, -- [2]
        },
        ["spellID"] = 216331,
      },
      [79929] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61889,
          }, -- [1]
        },
        ["spellID"] = 387814,
      },
      [79833] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 385349,
      },
      [79834] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61818,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61840,
          }, -- [2]
        },
        ["spellID"] = 385464,
      },
      [79826] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61808,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61817,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61825,
          }, -- [3]
        },
        ["spellID"] = 1022,
      },
      [79961] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61896,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61919,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61849,
          }, -- [3]
        },
        ["spellID"] = 498,
      },
      [79842] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61830,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61829,
          }, -- [2]
        },
        ["spellID"] = 115750,
      },
      [79850] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61826,
          }, -- [1]
        },
        ["spellID"] = 385425,
      },
      [79858] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61836,
          }, -- [2]
        },
        ["spellID"] = 385416,
      },
      [79866] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61820,
          }, -- [1]
        },
        ["spellID"] = 385125,
      },
      [79953] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61910,
          }, -- [1]
        },
        ["spellID"] = 114165,
      },
      [79832] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61814,
          }, -- [1]
        },
        ["spellID"] = 96231,
      },
      [79831] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61802,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61821,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61809,
          }, -- [3]
        },
        ["spellID"] = 384376,
      },
      [79830] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61822,
          }, -- [1]
        },
        ["spellID"] = 384897,
      },
      [79829] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61834,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 61816,
          }, -- [2]
        },
        ["spellID"] = 633,
      },
      [79828] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [2]
        },
        ["spellID"] = 223817,
      },
      [79827] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61823,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 61811,
          }, -- [2]
        },
        ["spellID"] = 105809,
      },
    },
    [1467] = {
      [52155] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40356,
          }, -- [1]
        },
        ["spellID"] = 375577,
      },
      [52159] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 360806,
      },
      [52163] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40360,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40363,
          }, -- [2]
        },
        ["spellID"] = 374251,
      },
      [52167] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40368,
          }, -- [1]
        },
        ["spellID"] = 363916,
      },
      [52171] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40361,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40359,
          }, -- [2]
        },
        ["spellID"] = 375517,
      },
      [52175] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40349,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40377,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40373,
          }, -- [3]
        },
        ["spellID"] = 369459,
      },
      [52179] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40385,
          }, -- [1]
        },
        ["spellID"] = 368432,
      },
      [52183] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40377,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40379,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40384,
          }, -- [3]
        },
        ["spellID"] = 375510,
      },
      [52187] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 372469,
      },
      [52191] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40392,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40352,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40381,
          }, -- [3]
        },
        ["spellID"] = 369913,
      },
      [52195] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40371,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40396,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40394,
          }, -- [3]
        },
        ["spellID"] = 370553,
      },
      [52243] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 370867,
      },
      [52247] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40441,
          }, -- [1]
        },
        ["spellID"] = 386336,
      },
      [52251] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40443,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40445,
          }, -- [2]
        },
        ["spellID"] = 386348,
      },
      [52255] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40447,
          }, -- [1]
        },
        ["spellID"] = 370783,
      },
      [52259] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40442,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40446,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40444,
          }, -- [3]
        },
        ["spellID"] = 376888,
      },
      [52263] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40457,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40452,
          }, -- [2]
        },
        ["spellID"] = 371038,
      },
      [52267] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40456,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40458,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40351,
          }, -- [3]
        },
        ["spellID"] = 375722,
      },
      [52271] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40464,
          }, -- [1]
        },
        ["spellID"] = 369908,
      },
      [52275] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40463,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40465,
          }, -- [2]
        },
        ["spellID"] = 370962,
      },
      [52152] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40356,
          }, -- [1]
        },
        ["spellID"] = 375561,
      },
      [52156] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40356,
          }, -- [1]
        },
        ["spellID"] = 375574,
      },
      [52160] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40354,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40373,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40358,
          }, -- [3]
        },
        ["spellID"] = 387761,
      },
      [52164] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375443,
      },
      [52168] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40392,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40366,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40369,
          }, -- [3]
        },
        ["spellID"] = 370897,
      },
      [52172] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 369990,
      },
      [52176] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40377,
          }, -- [1]
        },
        ["spellID"] = 375542,
      },
      [52180] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375507,
      },
      [52184] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40385,
          }, -- [1]
        },
        ["spellID"] = 369909,
      },
      [52188] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40387,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40369,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40364,
          }, -- [3]
        },
        ["spellID"] = 360995,
      },
      [52192] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40381,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40365,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40393,
          }, -- [3]
        },
        ["spellID"] = 375520,
      },
      [52196] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40375,
          }, -- [1]
        },
        ["spellID"] = 375544,
      },
      [52244] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375796,
      },
      [52248] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40437,
          }, -- [1]
        },
        ["spellID"] = 370839,
      },
      [52252] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40438,
          }, -- [1]
        },
        ["spellID"] = 370781,
      },
      [52256] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40448,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40450,
          }, -- [2]
        },
        ["spellID"] = 368847,
      },
      [52260] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40452,
          }, -- [1]
        },
        ["spellID"] = 386272,
      },
      [52264] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40442,
          }, -- [1]
        },
        ["spellID"] = 370455,
      },
      [52268] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40459,
          }, -- [1]
        },
        ["spellID"] = 375618,
      },
      [52272] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40449,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40451,
          }, -- [2]
        },
        ["spellID"] = 370837,
      },
      [52149] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375757,
      },
      [52280] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40467,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40469,
          }, -- [2]
        },
        ["spellID"] = 357211,
      },
      [52157] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40357,
          }, -- [1]
        },
        ["spellID"] = 374348,
      },
      [52161] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40361,
          }, -- [1]
        },
        ["spellID"] = 370886,
      },
      [52165] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 368838,
      },
      [52169] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40365,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40370,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40364,
          }, -- [3]
        },
        ["spellID"] = 375554,
      },
      [52173] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40374,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40355,
          }, -- [2]
        },
        ["spellID"] = 370665,
      },
      [52177] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40385,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40378,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40374,
          }, -- [3]
        },
        ["spellID"] = 372048,
      },
      [52181] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40382,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40380,
          }, -- [2]
        },
        ["spellID"] = 351338,
      },
      [52185] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40386,
          }, -- [1]
        },
        ["spellID"] = 369939,
      },
      [52189] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40388,
          }, -- [1]
        },
        ["spellID"] = 365585,
      },
      [52193] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40394,
          }, -- [1]
        },
        ["spellID"] = 371806,
      },
      [52241] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 370819,
      },
      [52245] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40440,
          }, -- [1]
        },
        ["spellID"] = 370452,
      },
      [52249] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40443,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40441,
          }, -- [2]
        },
        ["spellID"] = 370845,
      },
      [52253] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40447,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40445,
          }, -- [2]
        },
        ["spellID"] = 375783,
      },
      [52257] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40446,
          }, -- [1]
        },
        ["spellID"] = 386283,
      },
      [52261] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40455,
          }, -- [1]
        },
        ["spellID"] = 375087,
      },
      [52265] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40457,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40439,
          }, -- [2]
        },
        ["spellID"] = 375777,
      },
      [52269] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40460,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40462,
          }, -- [2]
        },
        ["spellID"] = 359073,
      },
      [52273] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40449,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40451,
          }, -- [2]
        },
        ["spellID"] = 365937,
      },
      [52150] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375528,
      },
      [52154] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374227,
      },
      [52158] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40373,
          }, -- [1]
        },
        ["spellID"] = 387341,
      },
      [52162] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40372,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40362,
          }, -- [2]
        },
        ["spellID"] = 376930,
      },
      [52166] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375406,
      },
      [52170] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40371,
          }, -- [1]
        },
        ["spellID"] = 375556,
      },
      [52174] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40353,
          }, -- [1]
        },
        ["spellID"] = 365933,
      },
      [52178] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374346,
      },
      [52182] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40383,
          }, -- [1]
        },
        ["spellID"] = 376164,
      },
      [52186] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 371032,
      },
      [52190] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40391,
          }, -- [1]
        },
        ["spellID"] = 358385,
      },
      [52194] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40376,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40383,
          }, -- [2]
        },
        ["spellID"] = 376166,
      },
      [52276] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40466,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40468,
          }, -- [2]
        },
        ["spellID"] = 376872,
      },
      [52278] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40454,
          }, -- [1]
        },
        ["spellID"] = 371016,
      },
      [52147] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40374,
          }, -- [1]
        },
        ["spellID"] = 387787,
      },
      [52279] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40461,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40468,
          }, -- [2]
        },
        ["spellID"] = 375721,
      },
      [52277] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40454,
          }, -- [1]
        },
        ["spellID"] = 386405,
      },
      [52242] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 369846,
      },
      [52246] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40441,
          }, -- [1]
        },
        ["spellID"] = 386342,
      },
      [52250] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40438,
          }, -- [1]
        },
        ["spellID"] = 370821,
      },
      [52254] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40436,
          }, -- [1]
        },
        ["spellID"] = 375801,
      },
      [52258] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40452,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40450,
          }, -- [2]
        },
        ["spellID"] = 375725,
      },
      [52262] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40456,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40453,
          }, -- [2]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40451,
          }, -- [3]
        },
        ["spellID"] = 375797,
      },
      [52266] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40457,
          }, -- [1]
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40439,
          }, -- [2]
        },
        ["spellID"] = 369375,
      },
      [52270] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = true,
            ["targetNode"] = 40459,
          }, -- [1]
        },
        ["spellID"] = 371034,
      },
      [52274] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40464,
          }, -- [1]
        },
        ["spellID"] = 369089,
      },
      [52151] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374968,
      },
      [52153] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["visualStyle"] = 1,
            ["type"] = 2,
            ["isActive"] = false,
            ["targetNode"] = 40356,
          }, -- [1]
        },
        ["spellID"] = 370888,
      },
    },
    [1468] = {
      [52155] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40356,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375577,
      },
      [52159] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 360806,
      },
      [52163] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40360,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40363,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 374251,
      },
      [52167] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40368,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 363916,
      },
      [52171] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40361,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40359,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 375517,
      },
      [52175] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40349,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40377,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40373,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 369459,
      },
      [52179] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40385,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 368432,
      },
      [52183] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40377,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40379,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40384,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 375510,
      },
      [52187] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 372469,
      },
      [52191] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40392,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40352,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40381,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 369913,
      },
      [52195] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40371,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40396,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40394,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 370553,
      },
      [52199] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 359816,
      },
      [52203] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40420,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40434,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 370062,
      },
      [52207] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40408,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 372233,
      },
      [52211] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40406,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40407,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40413,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 371270,
      },
      [52215] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40409,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376236,
      },
      [52219] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40418,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 369297,
      },
      [52223] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40401,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40421,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40407,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 373834,
      },
      [52227] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 376204,
      },
      [52231] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40416,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40426,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 366155,
      },
      [52235] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40432,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40404,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40397,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 367226,
      },
      [52239] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40435,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40401,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40399,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 373270,
      },
      [52152] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40356,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375561,
      },
      [52156] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40356,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375574,
      },
      [52160] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40354,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40373,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40358,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 387761,
      },
      [52164] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375443,
      },
      [52168] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40392,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40366,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40369,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 370897,
      },
      [52172] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 369990,
      },
      [52176] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40377,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375542,
      },
      [52180] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375507,
      },
      [52184] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40385,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 369909,
      },
      [52188] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40387,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40369,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40364,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 360995,
      },
      [52192] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40381,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40365,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40393,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 375520,
      },
      [52196] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40375,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375544,
      },
      [52200] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40400,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 369908,
      },
      [52204] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 377100,
      },
      [52208] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40408,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40422,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 381922,
      },
      [52212] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 385696,
      },
      [52216] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40408,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 368412,
      },
      [52220] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40419,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 371426,
      },
      [52224] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40422,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375783,
      },
      [52228] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 376207,
      },
      [52232] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40429,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40427,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 364343,
      },
      [52236] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40403,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40433,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 370960,
      },
      [52240] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40400,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 377099,
      },
      [52153] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40356,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 370888,
      },
      [52157] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40357,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 374348,
      },
      [52161] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40361,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 370886,
      },
      [52165] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 368838,
      },
      [52169] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40365,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40370,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40364,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 375554,
      },
      [52173] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40374,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40355,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 370665,
      },
      [52177] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40385,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40378,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40374,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 372048,
      },
      [52181] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40382,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40380,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 351338,
      },
      [52185] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40386,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 369939,
      },
      [52189] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40388,
            ["type"] = 2,
            ["isActive"] = true,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 365585,
      },
      [52193] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40394,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 371806,
      },
      [52197] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
        },
        ["spellID"] = 376150,
      },
      [52201] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40398,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 371257,
      },
      [52205] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40403,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40402,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 359793,
      },
      [52209] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40408,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40422,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 376210,
      },
      [52213] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40410,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40412,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 373861,
      },
      [52217] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40409,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40420,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 372527,
      },
      [52221] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40415,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40404,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40417,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 375722,
      },
      [52225] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40423,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376239,
      },
      [52229] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40424,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40415,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
          {
            ["targetNode"] = 40411,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [3]
        },
        ["spellID"] = 357170,
      },
      [52233] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40416,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40430,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 355936,
      },
      [52237] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40434,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 377086,
      },
      [52150] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375528,
      },
      [52154] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374227,
      },
      [52158] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40373,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 387341,
      },
      [52162] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40372,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40362,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 376930,
      },
      [52166] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 375406,
      },
      [52170] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40371,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 375556,
      },
      [52174] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40353,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 365933,
      },
      [52178] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374346,
      },
      [52182] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40383,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376164,
      },
      [52186] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 371032,
      },
      [52190] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40391,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 358385,
      },
      [52194] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40376,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40383,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 376166,
      },
      [52198] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 376138,
      },
      [52202] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40400,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
          {
            ["targetNode"] = 40422,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [2]
        },
        ["spellID"] = 381921,
      },
      [52206] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 370537,
      },
      [52210] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40405,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376240,
      },
      [52214] = {
        ["idx"] = 2,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40409,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376237,
      },
      [52218] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40414,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 378196,
      },
      [52222] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40420,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 376179,
      },
      [52226] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 371832,
      },
      [52230] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40425,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 363534,
      },
      [52234] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40431,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 362874,
      },
      [52238] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40434,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 377082,
      },
      [52147] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
          {
            ["targetNode"] = 40374,
            ["type"] = 2,
            ["isActive"] = false,
            ["visualStyle"] = 1,
          }, -- [1]
        },
        ["spellID"] = 387787,
      },
      [52151] = {
        ["idx"] = 1,
        ["visibleEdges"] = {
        },
        ["spellID"] = 374968,
      },
    },
  }
end

function Private.GetTalentInfo(specId)
  -- TODO: only evoker & paladin talents collected, will do more when structure of talentInfo will be final
  local talents = {}
  local talentInfo = Private.TalentInfo[specId]
  if talentInfo then
    for talentId, talentData in pairs(talentInfo) do
      local spellName, _, icon = GetSpellInfo(talentData.spellID)
      if spellName then
        talents[talentId] = ("|T"..icon..":16|t " .. spellName)
      end
    end
  end
  return talents
end
