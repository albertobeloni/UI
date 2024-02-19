local UI = LibStub("AceAddon-3.0"):NewAddon("UI", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

-- /console taintLog 1
-- /console taintLog 0
-- /console scriptErrors 1
-- /console scriptErrors 0

--------------------------------------------------------------------------------
-- Modules
--------------------------------------------------------------------------------

local ActionBars = UI:NewModule("ActionBars")
local Paging = UI:NewModule("Paging")
local PetActionBar = UI:NewModule("PetActionBar")
local StanceBar = UI:NewModule("StanceBar")
local Chat = UI:NewModule("Chat")
local StatusTrackingBar = UI:NewModule("StatusTrackingBar")
local PlayerFrame = UI:NewModule("PlayerFrame")
local FocusFrame = UI:NewModule("FocusFrame")
local PetFrame = UI:NewModule("PetFrame")
local TargetFrame = UI:NewModule("TargetFrame")
local Minimap = UI:NewModule("Minimap")
local Layouts = UI:NewModule("Layouts")
local Bags = UI:NewModule("Bags")
local Menu = UI:NewModule("Menu")
local BuffFrame = UI:NewModule("BuffFrame")
local DebuffFrame = UI:NewModule("DebuffFrame")
local Tooltips = UI:NewModule("Tooltips")

--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------

local options = {
    name = "UI",
    handler = UI,
    type = "group",
    args = {
        chat = {
            name = "Chat",
            type = "group",
            order = 1,
            args = {
                chatModule = {
                    name = "Enable Chat Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("chatModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                chatOpacity = {
                    name = "Chat Opacity",
                    type = "range",
                    width = "full",
                    order = 1,
                    min = 0,
                    max = 1,
                    step = 0.05,
                    get = function()
                        return UI:GetOption("chatOpacity")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatOpacity", value)
                    end
                },
                chatInCombat = {
                    name = "Show Chat in Combat",
                    type = "toggle",
                    width = "full",
                    order = 2,
                    get = function()
                        return UI:GetOption("chatInCombat")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatInCombat", value)
                    end
                },
                chatInInstance = {
                    name = "Show Chat in Instances",
                    type = "toggle",
                    width = "full",
                    order = 3,
                    get = function()
                        return UI:GetOption("chatInInstance")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatInInstance", value)
                    end
                },
                chatOnUpdate = {
                    name = "Show Chat on Update",
                    type = "toggle",
                    width = "full",
                    order = 4,
                    get = function()
                        return UI:GetOption("chatOnUpdate")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatOnUpdate", value)
                    end
                },
                chatUpdateDuration = {
                    name = "Update Duration",
                    type = "range",
                    width = "full",
                    order = 5,
                    min = 0,
                    max = 10,
                    step = 1,
                    get = function()
                        return UI:GetOption("chatUpdateDuration")
                    end,
                    set = function(info, value)
                        UI:SetOption("chatUpdateDuration", value)
                    end
                }
            }
        },
        actionBars = {
            name = "Action Bars",
            type = "group",
            order = 2,
            args = {
                actionBarsHeader = {
                    name = "Action Bars",
                    type = "header",
                    order = 0
                },
                actionBarsModule = {
                    name = "Enable Action Bars Module",
                    type = "toggle",
                    width = "full",
                    order = 1,
                    get = function()
                        return UI:GetOption("actionBarsModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBarsModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBarsHideMacroNames = {
                    name = "Hide Macro Names",
                    type = "toggle",
                    width = "full",
                    order = 2,
                    get = function()
                        return UI:GetOption("actionBarsHideMacroNames")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBarsHideMacroNames", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar1Condition = {
                    name = "Main Action Bar Condition",
                    type = "input",
                    width = "full",
                    order = 3,
                    get = function()
                        return UI:GetOption("actionBar1Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar1Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar2Condition = {
                    name = "Action Bar 2 Condition",
                    type = "input",
                    width = "full",
                    order = 4,
                    get = function()
                        return UI:GetOption("actionBar2Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar2Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar3Condition = {
                    name = "Action Bar 3 Condition",
                    type = "input",
                    width = "full",
                    order = 5,
                    get = function()
                        return UI:GetOption("actionBar3Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar3Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar4Condition = {
                    name = "Action Bar 4 Condition",
                    type = "input",
                    width = "full",
                    order = 6,
                    get = function()
                        return UI:GetOption("actionBar4Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar4Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar5Condition = {
                    name = "Action Bar 5 Condition",
                    type = "input",
                    width = "full",
                    order = 7,
                    get = function()
                        return UI:GetOption("actionBar5Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar5Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar6Condition = {
                    name = "Action Bar 6 Condition",
                    type = "input",
                    width = "full",
                    order = 8,
                    get = function()
                        return UI:GetOption("actionBar6Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar6Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar7Condition = {
                    name = "Action Bar 7 Condition",
                    type = "input",
                    width = "full",
                    order = 9,
                    get = function()
                        return UI:GetOption("actionBar7Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar7Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                actionBar8Condition = {
                    name = "Action Bar 8 Condition",
                    type = "input",
                    width = "full",
                    order = 10,
                    get = function()
                        return UI:GetOption("actionBar8Condition")
                    end,
                    set = function(info, value)
                        UI:SetOption("actionBar8Condition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                petActionBarHeader = {
                    name = "Pet Action Bar",
                    type = "header",
                    order = 11
                },
                petActionBarModule = {
                    name = "Enable Pet Action Bar Module",
                    type = "toggle",
                    width = "full",
                    order = 12,
                    get = function()
                        return UI:GetOption("petActionBarModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("petActionBarModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                petActionBarCondition = {
                    name = "Pet Bar Condition",
                    type = "input",
                    width = "full",
                    order = 13,
                    get = function()
                        return UI:GetOption("petActionBarCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("petActionBarCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                stanceBarHeader = {
                    name = "Stance Bar",
                    type = "header",
                    order = 14
                },
                stanceBarModule = {
                    name = "Enable Stance Bar Module",
                    type = "toggle",
                    width = "full",
                    order = 15,
                    get = function()
                        return UI:GetOption("stanceBarModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("stanceBarModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                stanceBarCondition = {
                    name = "Stance Bar Condition",
                    type = "input",
                    width = "full",
                    order = 16,
                    get = function()
                        return UI:GetOption("stanceBarCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("stanceBarCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        paging = {
            name = "Paging",
            type = "group",
            order = 3,
            args = {
                pagingModule = {
                    name = "Enable Paging Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("pagingModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("pagingModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                pagingDefaultPage = {
                    name = "Default Page",
                    type = "select",
                    width = "full",
                    order = 1,
                    values = {1,2,3,4,5,6},
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("pagingDefaultPage")
                    end,
                    set = function(info, value)
                        UI:SetOption("pagingDefaultPage", value)
                    end
                },
                pagingCombatPage = {
                    name = "Combat Page",
                    type = "select",
                    width = "full",
                    order = 2,
                    values = {1,2,3,4,5,6},
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("pagingCombatPage")
                    end,
                    set = function(info, value)
                        UI:SetOption("pagingCombatPage", value)
                    end
                }
            }
        },
        statusTrackingBar = {
            name = "Status Tracking Bar",
            type = "group",
            order = 4,
            args = {
                statusTrackingBarModule = {
                    name = "Enable Status Tracking Bar Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("statusTrackingBarModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("statusTrackingBarModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        unitFrames = {
            name = "Unit Frames",
            type = "group",
            order = 5,
            args = {
                playerFrameHeader = {
                    name = "Player Frame",
                    type = "header",
                    order = 0
                },
                playerFrameModule = {
                    name = "Enable Player Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 1,
                    get = function()
                        return UI:GetOption("playerFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("playerFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                playerFrameCondition = {
                    name = "Player Frame Condition",
                    type = "input",
                    width = "full",
                    order = 2,
                    get = function()
                        return UI:GetOption("playerFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("playerFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                playerFramePowerBarCondition = {
                    name = "Power Bar Condition",
                    type = "input",
                    width = "full",
                    order = 3,
                    get = function()
                        return UI:GetOption("playerFramePowerBarCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("playerFramePowerBarCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                focusFrameHeader = {
                    name = "Focus Frame",
                    type = "header",
                    order = 4
                },
                focusFrameModule = {
                    name = "Enable Focus Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 5,
                    get = function()
                        return UI:GetOption("focusFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("focusFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                focusFrameCondition = {
                    name = "Focus Frame Condition",
                    type = "input",
                    width = "full",
                    order = 6,
                    get = function()
                        return UI:GetOption("focusFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("focusFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                petFrameHeader = {
                    name = "Pet Frame",
                    type = "header",
                    order = 7
                },
                petFrameModule = {
                    name = "Enable Pet Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 8,
                    get = function()
                        return UI:GetOption("petFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("petFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                petFrameCondition = {
                    name = "Pet Frame Condition",
                    type = "input",
                    width = "full",
                    order = 9,
                    get = function()
                        return UI:GetOption("petFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("petFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                targetFrameHeader = {
                    name = "Target Frame",
                    type = "header",
                    order = 10
                },
                targetFrameModule = {
                    name = "Enable Target Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 11,
                    get = function()
                        return UI:GetOption("targetFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("targetFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                targetFrameCondition = {
                    name = "Target Frame Condition",
                    type = "input",
                    width = "full",
                    order = 12,
                    get = function()
                        return UI:GetOption("targetFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("targetFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        minimap = {
            name = "Minimap",
            type = "group",
            order = 6,
            args = {
                minimapModule = {
                    name = "Enable Minimap Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("minimapModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("minimapModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                minimapCondition = {
                    name = "Minimap Condition",
                    type = "input",
                    width = "full",
                    order = 1,
                    get = function()
                        return UI:GetOption("minimapCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("minimapCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        layouts = {
            name = "Layouts",
            type = "group",
            order = 7,
            args = {
                layoutsModule = {
                    name = "Enable Layouts Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("layoutsModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("layoutsModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                group5Layout = {
                    name = "Party Layout",
                    type = "select",
                    width = "full",
                    order = 1,
                    handler = Layouts,
                    values = "List",
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("group5Layout")
                    end,
                    set = function(info, value)
                        UI:SetOption("group5Layout", value)
                    end
                },
                group10Layout = {
                    name = "Raid Layout (10)",
                    type = "select",
                    width = "full",
                    order = 2,
                    handler = Layouts,
                    values = "List",
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("group10Layout")
                    end,
                    set = function(info, value)
                        UI:SetOption("group10Layout", value)
                    end
                },
                group25Layout = {
                    name = "Raid Layout (25)",
                    type = "select",
                    width = "full",
                    order = 3,
                    handler = Layouts,
                    values = "List",
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("group25Layout")
                    end,
                    set = function(info, value)
                        UI:SetOption("group25Layout", value)
                    end
                },
                group40Layout = {
                    name = "Raid Layout (40)",
                    type = "select",
                    width = "full",
                    order = 4,
                    handler = Layouts,
                    values = "List",
                    style = "dropdown",
                    get = function()
                        return UI:GetOption("group40Layout")
                    end,
                    set = function(info, value)
                        UI:SetOption("group40Layout", value)
                    end
                }
            }
        },
        bags = {
            name = "Bags",
            type = "group",
            order = 8,
            args = {
                bagsModule = {
                    name = "Enable Bags Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("bagsModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("bagsModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        menu = {
            name = "Menu",
            type = "group",
            order = 9,
            args = {
                menuModule = {
                    name = "Enable Menu Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("menuModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("menuModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        buffAndDebuff = {
            name = "Buff and Debuff",
            type = "group",
            order = 10,
            args = {
                buffFrameHeader = {
                    name = "Buff Frame",
                    type = "header",
                    order = 0
                },
                buffFrameModule = {
                    name = "Enable Buff Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 1,
                    get = function()
                        return UI:GetOption("buffFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("buffFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                buffFrameCondition = {
                    name = "Buff Frame Condition",
                    type = "input",
                    width = "full",
                    order = 2,
                    get = function()
                        return UI:GetOption("buffFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("buffFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                debuffFrameHeader = {
                    name = "Debuff Frame",
                    type = "header",
                    order = 3
                },
                debuffFrameModule = {
                    name = "Enable Debuff Frame Module",
                    type = "toggle",
                    width = "full",
                    order = 4,
                    get = function()
                        return UI:GetOption("debuffFrameModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("debuffFrameModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                debuffFrameCondition = {
                    name = "Debuff Frame Condition",
                    type = "input",
                    width = "full",
                    order = 5,
                    get = function()
                        return UI:GetOption("debuffFrameCondition")
                    end,
                    set = function(info, value)
                        UI:SetOption("debuffFrameCondition", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                }
            }
        },
        tooltips = {
            name = "Tooltips",
            type = "group",
            order = 11,
            args = {
                tooltipsModule = {
                    name = "Enable Tooltips Module",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("tooltipsModule")
                    end,
                    set = function(info, value)
                        UI:SetOption("tooltipsModule", value)
                        ReloadUI()
                    end,
                    confirm = "ConfirmReload"
                },
                tooltipsUnitInCombat = {
                    name = "Hide Unit Tooltips in Combat",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("tooltipsUnitInCombat")
                    end,
                    set = function(info, value)
                        UI:SetOption("tooltipsUnitInCombat", value)
                    end
                },
                tooltipsActionInCombat = {
                    name = "Hide Action Tooltips in Combat",
                    type = "toggle",
                    width = "full",
                    order = 0,
                    get = function()
                        return UI:GetOption("tooltipsActionInCombat")
                    end,
                    set = function(info, value)
                        UI:SetOption("tooltipsActionInCombat", value)
                    end
                }
            }
        }
    }
}

local defaults = {
    profile = {

        -- Chat Module
        chatModule = true,
        chatOpacity = 0,
        chatInCombat = false,
        chatInInstance = false,
        chatOnUpdate = false,
        chatUpdateDuration = 5,

        -- Action Bars Module
        actionBarsModule = true,
        actionBarsHideMacroNames = true,
        actionBar1Condition = "",
        actionBar2Condition = "[flying] hide; [mod:shift][harm,exists,nodead][help,exists,group][combat] show; hide",
        actionBar3Condition = "[flying][nomod:alt,harm,exists,nodead][nomod:alt,help,exists,group] hide; [mod:alt,nomod:ctrl] show; hide",
        actionBar4Condition = "",
        actionBar5Condition = "",
        actionBar6Condition = "",
        actionBar7Condition = "",
        actionBar8Condition = "",

        -- Paging Module
        pagingModule = false,
        pagingDefaultPage = 1,
        pagingCombatPage = 2,

        -- Pet Bar Module
        petActionBarModule = true,
        petActionBarCondition = "[nomod:alt,mod:ctrl,@pet,exists] show; hide",

        -- Stance Bar Module
        stanceBarModule = true,
        stanceBarCondition = "[nomod:alt,mod:ctrl] show; hide",

        -- Status Tracking Bar Module
        statusTrackingBarModule = true,

        -- Player Frame Module
        playerFrameModule = true,
        playerFrameCondition = "[@player,dead] hide; [harm,exists,nodead][help,exists,group][combat] show; hide",
        playerFramePowerBarCondition = "[combat] hide; show",

        -- Focus Frame Module
        focusFrameModule = true,
        focusFrameCondition = "[mod:ctrl,mod:alt,harm,exists,nodead][mod:ctrl,mod:alt,help,exists,group] hide; [nomod:ctrl,nomod:alt,@focus,exists][mod:ctrl,@focus,exists][mod:alt,@focus,exists] show; hide",

        -- Pet Frame Module
        petFrameModule = true,
        petFrameCondition = "",

        -- Target Frame Module
        targetFrameModule = true,
        -- targetFrameCondition = "[harm,exists,nodead][help,exists,combat][help,exists,group] show; hide",
        targetFrameCondition = "[mod:ctrl,mod:alt,exists] show; hide",

        -- Minimap Module
        minimapModule = true,
        minimapCondition = "",

        -- Layouts Module
        layoutsModule = true,
        group5Layout = nil,
        group10Layout = nil,
        group25Layout = nil,
        group40Layout = nil,

        -- Bags Module
        bagsModule = true,

        -- Menu Module
        menuModule = true,

        -- Buff Frame Module
        buffFrameModule = true,
        buffFrameCondition = "",

        -- Debuff Frame Module
        debuffFrameModule = true,
        debuffFrameCondition = "",

        -- Tooltips Module
        tooltipsModule = true,
        tooltipsUnitInCombat = true,
        tooltipsActionInCombat = true,

    }
}

function UI:OnInitialize()
    LibStub("AceConfig-3.0"):RegisterOptionsTable("UI", options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("UI", "UI")

    self.database = LibStub("AceDB-3.0"):New("UIDB", defaults, true)
    self.events = {}
    self.locked = false
    self.lockedFrames = {}
    self.protectedFrames = {}

    EventRegistry:RegisterCallback("EditMode.Enter", function()
        EventRegistry:TriggerEvent("UI.Lock")
        UI:Lock()
    end)
    EventRegistry:RegisterCallback("EditMode.Exit", function()
        UI:Unlock()
        EventRegistry:TriggerEvent("UI.Unlock")
    end)
end

function UI:OnEnable()

    if self:GetOption("actionBarsModule") then
        ActionBars:Enable()
    end

    if self:GetOption("petActionBarModule") then
        PetActionBar:Enable()
    end

    if self:GetOption("stanceBarModule") then
        StanceBar:Enable()
    end

    if self:GetOption("pagingModule") then
        Paging:Enable()
    end

    if self:GetOption("chatModule") then
        Chat:Enable()
    end

    if self:GetOption("statusTrackingBarModule") then
        StatusTrackingBar:Enable()
    end

    if self:GetOption("playerFrameModule") then
        PlayerFrame:Enable()
    end

    if self:GetOption("focusFrameModule") then
        FocusFrame:Enable()
    end

    if self:GetOption("petFrameModule") then
        PetFrame:Enable()
    end

    if self:GetOption("targetFrameModule") then
        TargetFrame:Enable()
    end

    if self:GetOption("minimapModule") then
        Minimap:Enable()
    end

    if self:GetOption("layoutsModule") then
        Layouts:Enable()
    end

    if self:GetOption("bagsModule") then
        Bags:Enable()
    end

    if self:GetOption("menuModule") then
        Menu:Enable()
    end

    if self:GetOption("buffFrameModule") then
        BuffFrame:Enable()
    end

    if self:GetOption("debuffFrameModule") then
        DebuffFrame:Enable()
    end

    if self:GetOption("tooltipsModule") then
        Tooltips:Enable()
    end

    for event in pairs(self.events) do
        self:RegisterEvent(event, "OnEvent")
    end

end

function UI:OnDisable()
end

function UI:OnEvent(event, ...)

    if self.events[event] then

        for _, callback in ipairs(self.events[event]) do
            callback(event, ...)
        end

    end

end

--------------------------------------------------------------------------------
-- Utilities
--------------------------------------------------------------------------------

function UI:ConfirmReload()
    return "This action will reload the UI"
end

function UI:Event(event, callback)

    if not self.events[event] then
        self.events[event] = {}
    end

    table.insert(self.events[event], callback)
end

function UI:SetOption(key, value)
    self.database.profile[key] = value
end

function UI:GetOption(key)
    return self.database.profile[key]
end

function UI:Protect(Frame)
    self.protectedFrames[Frame] = true
end

function UI:Lock(Frame)

    if Frame then
        self.lockedFrames[Frame] = true
    else
        self.locked = true
    end

end

function UI:Unlock(Frame)

    if Frame then
        self.lockedFrames[Frame] = false
    else
        self.locked = false
    end

end

function UI:OnLock(callback)
    EventRegistry:RegisterCallback("UI.Lock", callback)
end

function UI:OnUnlock(callback)
    EventRegistry:RegisterCallback("UI.Unlock", callback)
end

function UI:IsLocked(Frame)

    if Frame then
        local isProtected, isProtectedExplicitly = Frame:IsProtected()

        if isProtected and InCombatLockdown() then
            return true
        elseif isProtectedExplicitly and InCombatLockdown() then
            return true
        elseif self.protectedFrames[Frame] and InCombatLockdown() then
            return self.protectedFrames[Frame]
        elseif self.lockedFrames[Frame] then
            return self.lockedFrames[Frame]
        end

        return self.locked
    end

    return self.locked
end

function UI:Register(Frame, state, condition)

    if not UI:IsLocked(Frame) then
        RegisterAttributeDriver(Frame, "state-" .. state, condition)
    end

end

function UI:Unregister(Frame, state)

    if not self:IsLocked(Frame) then
        UnregisterAttributeDriver(Frame, "state-" .. state, condition)
    end

end

function UI:FadeIn(Frame, alpha, callback, ...)

    if not UI:IsLocked(Frame) then
        local settings = {}

        settings.finishedFunc = callback
        settings.finishedArg1, settings.finishedArg2, settings.finishedArg3, settings.finishedArg4 = ...

        settings.mode = "IN"
        settings.timeToFade = 0
        settings.startAlpha = Frame:GetAlpha()
        settings.endAlpha = alpha or 1

        UIFrameFade(Frame, settings)
    end

end

function UI:FadeOut(Frame, alpha, callback, ...)

    if not self:IsLocked(Frame) then
        local settings = {}

        settings.finishedFunc = callback
        settings.finishedArg1, settings.finishedArg2, settings.finishedArg3, settings.finishedArg4 = ...

        settings.mode = "OUT"
        settings.timeToFade = 0
        settings.startAlpha = Frame:GetAlpha()
        settings.endAlpha = alpha or 0

        UIFrameFade(Frame, settings)
    end

end

function UI:HasRoot(Frame, root)

    if Frame and Frame:GetName() == root then
        return true
    elseif Frame and Frame:GetParent() then
        return self:HasRoot(Frame:GetParent(), root)
    end

    return false
end

function UI:OnLeave(root, callback, ...)
    local focus = GetMouseFocus()

    if not self:HasRoot(focus, root) then
        callback(...)
    end

end

function UI:HasTarget()
    return UnitExists("target")
end

function UI:HideFrame(Frame)

    if Frame then
        Frame:UnregisterAllEvents()
        UI:Unhook(Frame, "OnShow")
        UI:SecureHookScript(Frame, "OnShow", function(self)
            self:Hide()
        end)
        Frame:Hide()
    end

end

--------------------------------------------------------------------------------
-- Action Bars
--------------------------------------------------------------------------------

function ActionBars:Enable()
    self.actionBars = {}

    self.actionBars["actionBar1"] = MainMenuBar
    self.actionBars["actionBar2"] = MultiBarBottomLeft
    self.actionBars["actionBar3"] = MultiBarBottomRight
    self.actionBars["actionBar4"] = MultiBarRight
    self.actionBars["actionBar5"] = MultiBarLeft
    self.actionBars["actionBar6"] = MultiBar5
    self.actionBars["actionBar7"] = MultiBar6
    self.actionBars["actionBar8"] = MultiBar7

    self.actionBarsEnabled = {}
    self.actionBarsDisabled = {}

    UI:SecureHookScript(SettingsPanel, "OnShow", function()
        ActionBars:Show()
        ActionBars:Lock()
    end)
    UI:SecureHookScript(SettingsPanel, "OnHide", function()
        ActionBars:Unlock()
        ActionBars:Register()
    end)

    UI:SecureHookScript(SpellBookFrame, "OnShow", function()
        ActionBars:Show()
        ActionBars:Lock()
    end)
    UI:SecureHookScript(SpellBookFrame, "OnHide", function()
        ActionBars:Unlock()
        ActionBars:Register()
    end)

    UI:Event("PLAYER_ENTERING_WORLD", function()
        ActionBars:Register()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        ActionBars:Disable()
        ActionBars:Register()
    end)

    UI:Event("ACTIONBAR_SHOWGRID", function()
        ActionBars:Show()
    end)
    UI:Event("ACTIONBAR_HIDEGRID", function()
        ActionBars:Register()
    end)

    UI:Event("UNIT_ENTERED_VEHICLE", function()

        if UnitHasVehicleUI("player") then
            ActionBars:Hide()
            ActionBars:Lock()
        end

    end)
    UI:Event("UNIT_EXITED_VEHICLE", function()
        ActionBars:Unlock()
        ActionBars:Register()
    end)

    UI:Event("PET_BATTLE_OPENING_START", function()
        ActionBars:Hide()
        ActionBars:Lock()
    end)
    UI:Event("PET_BATTLE_CLOSE", function()
        ActionBars:Unlock()
        ActionBars:Register()
    end)

    UI:Event("PLAYER_TARGET_CHANGED", function()

        if UnitIsUnit("target", "player") then
            ActionBars:Show()
            ActionBars:Lock()
        else
            ActionBars:Unlock()
            ActionBars:Register()
        end

    end)

    UI:OnLock(function()
        ActionBars:Show()
    end)
    UI:OnUnlock(function()
        ActionBars:Register()
    end)
end

function ActionBars:Disable()
    self:Show(actionBarsEnabled)
    self:Hide(actionBarsDisabled)
end

function ActionBars:Update()
    local actionBar2, actionBar3, actionBar4, actionBar5, actionBar6, actionBar7, actionBar8 = GetActionBarToggles()

    self.actionBarsEnabled = {}
    self.actionBarsDisabled = {}

    self.actionBarsEnabled["actionBar1"] = self.actionBars["actionBar1"]

    if actionBar2 then
        self.actionBarsEnabled["actionBar2"] = self.actionBars["actionBar2"]
    else
        self.actionBarsDisabled["actionBar2"] = self.actionBars["actionBar2"]
    end

    if actionBar3 then
        self.actionBarsEnabled["actionBar3"] = self.actionBars["actionBar3"]
    else
        self.actionBarsDisabled["actionBar3"] = self.actionBars["actionBar3"]
    end

    if actionBar4 then
        self.actionBarsEnabled["actionBar4"] = self.actionBars["actionBar4"]
    else
        self.actionBarsDisabled["actionBar4"] = self.actionBars["actionBar4"]
    end

    if actionBar5 then
        self.actionBarsEnabled["actionBar5"] = self.actionBars["actionBar5"]
    else
        self.actionBarsDisabled["actionBar5"] = self.actionBars["actionBar5"]
    end

    if actionBar6 then
        self.actionBarsEnabled["actionBar6"] = self.actionBars["actionBar6"]
    else
        self.actionBarsDisabled["actionBar6"] = self.actionBars["actionBar6"]
    end

    if actionBar7 then
        self.actionBarsEnabled["actionBar7"] = self.actionBars["actionBar7"]
    else
        self.actionBarsDisabled["actionBar7"] = self.actionBars["actionBar7"]
    end

    if actionBar8 then
        self.actionBarsEnabled["actionBar8"] = self.actionBars["actionBar8"]
    else
        self.actionBarsDisabled["actionBar8"] = self.actionBars["actionBar8"]
    end

end

function ActionBars:Show(actionBars)
    actionBars = actionBars or self.actionBarsEnabled

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Register(ActionBar, "visibility", "show")
        end

    end

    self:Unregister(actionBars)
end

function ActionBars:Hide(actionBars)
    actionBars = actionBars or self.actionBarsEnabled

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Register(ActionBar, "visibility", "hide")
        end

    end

    self:Unregister(actionBars)
end

function ActionBars:Register(actionBars)
    self:Update()

    actionBars = actionBars or self.actionBarsEnabled

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Register(ActionBar, "visibility", condition)
        end

        if UI:GetOption("actionBarsHideMacroNames") then

            for index = 1, 12 do

                if ActionBar == self.actionBars["actionBar1"] then
                    _G["ActionButton" .. index .. "Name"]:SetAlpha(0)
                else
                    _G[ActionBar:GetName() .. "Button" .. index .. "Name"]:SetAlpha(0)
                end

            end

        end

    end

end

function ActionBars:Unregister(actionBars)
    actionBars = actionBars or self.actionBars

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Unregister(ActionBar, "visibility", condition)
        end

    end

end

function ActionBars:Lock(actionBars)
    actionBars = actionBars or self.actionBars

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Lock(ActionBar)
        end

    end

end

function ActionBars:Unlock(actionBars)
    actionBars = actionBars or self.actionBars

    for actionBar, ActionBar in pairs(actionBars) do
        local condition = UI:GetOption(actionBar .. "Condition")

        if condition ~= "" then
            UI:Unlock(ActionBar)
        end

    end

end

--------------------------------------------------------------------------------
-- Pet Action Bar
--------------------------------------------------------------------------------

function PetActionBar:Enable()
    self.Frame = _G["PetActionBar"]
    self.condition = "petActionBarCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function()
        PetActionBar:Register()
    end)

    UI:Event("PET_BAR_SHOWGRID", function()
        PetActionBar:Show()
    end)
    UI:Event("PET_BAR_HIDEGRID", function()
        PetActionBar:Register()
    end)

    UI:Event("UNIT_ENTERED_VEHICLE", function()

        if UnitHasVehicleUI("player") then
            PetActionBar:Hide()
            PetActionBar:Lock()
        end

    end)
    UI:Event("UNIT_EXITED_VEHICLE", function()
        PetActionBar:Unlock()
        PetActionBar:Register()
    end)

    UI:Event("PET_BATTLE_OPENING_START", function()
        PetActionBar:Hide()
        PetActionBar:Lock()
    end)
    UI:Event("PET_BATTLE_CLOSE", function()
        PetActionBar:Unlock()
        PetActionBar:Register()
    end)

    UI:OnLock(function()
        PetActionBar:Show()
    end)
    UI:OnUnlock(function()
        PetActionBar:Register()
    end)
end

function PetActionBar:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function PetActionBar:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function PetActionBar:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function PetActionBar:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function PetActionBar:Lock()
    UI:Lock(self.Frame)
end

function PetActionBar:Unlock()
    UI:Unlock(self.Frame)
end

--------------------------------------------------------------------------------
-- Stance Bar
--------------------------------------------------------------------------------

function StanceBar:Enable()

    if not GetShapeshiftFormInfo(1) then
        return
    end

    self.Frame = _G["StanceBar"]
    self.condition = "stanceBarCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function()
        StanceBar:Register()
    end)

    UI:Event("UNIT_ENTERED_VEHICLE", function()

        if UnitHasVehicleUI("player") then
            StanceBar:Hide()
            StanceBar:Lock()
        end

    end)
    UI:Event("UNIT_EXITED_VEHICLE", function()
        StanceBar:Unlock()
        StanceBar:Register()
    end)

    UI:Event("PET_BATTLE_OPENING_START", function()
        StanceBar:Hide()
        StanceBar:Lock()
    end)
    UI:Event("PET_BATTLE_CLOSE", function()
        StanceBar:Unlock()
        StanceBar:Register()
    end)

    UI:OnLock(function()
        StanceBar:Show()
    end)
    UI:OnUnlock(function()
        StanceBar:Register()
    end)
end

function StanceBar:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function StanceBar:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function StanceBar:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function StanceBar:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function StanceBar:Lock()
    UI:Lock(self.Frame)
end

function StanceBar:Unlock()
    UI:Unlock(self.Frame)
end

--------------------------------------------------------------------------------
-- Paging
--------------------------------------------------------------------------------

function Paging:Enable()
    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        Paging:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_REGEN_DISABLED", function(event, ...)
        Paging:Evaluate(event, ...)
    end)
    UI:Event("PLAYER_REGEN_ENABLED", function(event, ...)
        Paging:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_TARGET_CHANGED", function(event, ...)
        Paging:Evaluate(event, ...)
    end)

    UI:Event("UPDATE_STEALTH", function(event, ...)
        Paging:Evaluate(event, ...)
    end)

    UI:Event("UPDATE_BONUS_ACTIONBAR", function(event, ...)
        Paging:Evaluate(event, ...)
    end)

    UI:OnLock(function()
        Paging:Evaluate()
    end)
    UI:OnLock(function()
        Paging:Evaluate()
    end)
end

function Paging:Update()
    self.defaultPage = UI:GetOption("pagingDefaultPage")
    self.combatPage = UI:GetOption("pagingCombatPage")
end

function Paging:Page(page)

    if not UI:IsLocked(MainMenuBar) then
        ChangeActionBarPage(page)
    end

end

function Paging:Evaluate(event, ...)
    Paging:Update()

    if event == "PLAYER_REGEN_DISABLED" or InCombatLockdown() or UnitAffectingCombat("player") then
        return self:Page(self.combatPage)
    end

    if IsStealthed() then
        return self:Page(1)
    end

    if UnitCanAttack("player", "target") and not UnitIsDead("target") then
        return self:Page(self.combatPage)
    end

    if UnitCanAssist("player", "target") and UnitIsPlayer("target") then
        return self:Page(self.combatPage)
    end

    if GetBonusBarIndex() == 11 then -- Dynamic Flying (Dragonriding)
        return self:Page(1)
    end

    if event == "PLAYER_REGEN_ENABLED" then
        return self:Page(self.defaultPage)
    end

    self:Page(self.defaultPage)
end

--------------------------------------------------------------------------------
-- Chat
--------------------------------------------------------------------------------

function Chat:Enable()
    self.Frame = CreateFrame("Frame", "ChatContainer", UIParent)

    self.disabled = false

    self.Frame:SetPoint("BOTTOMLEFT", "ChatFrame1", "BOTTOMLEFT", 0, 0)
    self.Frame:SetPoint("TOPRIGHT", "ChatFrame1", "TOPRIGHT", 0, 0)
    self.Frame:SetFrameStrata("LOW")

    UI:Event("PLAYER_ENTERING_WORLD", function()

        if UI:GetOption("chatInInstance") and IsInInstance() then
            self.disabled = true
            return
        end

        Chat:Update()
        Chat:Hide()
    end)

    UI:Event("PLAYER_REGEN_DISABLED", function()

        if UI:GetOption("chatInCombat") then
            Chat:Show()
            Chat.disabled = true
        end

    end)
    UI:Event("PLAYER_REGEN_ENABLED", function()

        if UI:GetOption("chatInCombat") then
            Chat.disabled = false
            Chat:Hide()
        end

    end)

    UI:OnLock(function()
        Chat:Show()
    end)
    UI:OnUnlock(function()
        Chat:Hide()
    end)
end

function Chat:Update()

    for i = 1, NUM_CHAT_WINDOWS do
        local ChatFrame = _G["ChatFrame" .. i]
        local ChatFrameBackground = _G["ChatFrame" .. i .. "Background"]
        local ChatTab = _G["ChatFrame" .. i .. "Tab"]
        local ChatEditBox = _G["ChatFrame" .. i .. "EditBox"]
        local ChatButtonFrame = _G["ChatFrame" .. i .. "ButtonFrame"]
        local ChatButtonFrameBackground = _G["ChatFrame" .. i .. "ButtonFrameBackground"]

        if ChatFrame.isDocked then
            ChatFrame:SetParent(self.Frame)
            ChatEditBox:SetParent(self.Frame)

            if not UI:IsHooked(ChatFrame, "OnEnter") then
                UI:SecureHookScript(ChatFrame, "OnEnter", function()
                    Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatFrame, "OnLeave") then
                UI:SecureHookScript(ChatFrame, "OnLeave", function()
                Chat:Hide()
                end)
            end

            if not UI:IsHooked(ChatFrameBackground, "OnEnter") then
                UI:SecureHookScript(ChatFrameBackground, "OnEnter", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatFrameBackground, "OnLeave") then
                UI:SecureHookScript(ChatFrameBackground, "OnLeave", function()
                Chat:Hide()
                end)
            end

            if not UI:IsHooked(ChatTab, "OnEnter") then
                UI:SecureHookScript(ChatTab, "OnEnter", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatTab, "OnLeave") then
                UI:SecureHookScript(ChatTab, "OnLeave", function()
                Chat:Hide()
                end)
            end
            if not UI:IsHooked(ChatTab, "OnDragStart") then
                UI:SecureHookScript(ChatTab, "OnDragStart", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatTab, "OnDragStop") then
                UI:SecureHookScript(ChatTab, "OnDragStop", function()
                Chat:Update()
                end)
            end

            if not UI:IsHooked(ChatEditBox, "OnEnter") then
                UI:SecureHookScript(ChatEditBox, "OnEnter", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatEditBox, "OnLeave") then
                UI:SecureHookScript(ChatEditBox, "OnLeave", function()
                Chat:Hide()
                end)
            end
            if not UI:IsHooked(ChatEditBox, "OnEditFocusGained") then
                UI:SecureHookScript(ChatEditBox, "OnEditFocusGained", function()
                Chat:Show()
                Chat:Lock()
                end)
            end
            if not UI:IsHooked(ChatEditBox, "OnEditFocusLost") then
                UI:SecureHookScript(ChatEditBox, "OnEditFocusLost", function()
                Chat:Unlock()
                Chat:Hide()
                end)
            end

            if not UI:IsHooked(ChatButtonFrame, "OnEnter") then
                UI:SecureHookScript(ChatButtonFrame, "OnEnter", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatButtonFrame, "OnLeave") then
                UI:SecureHookScript(ChatButtonFrame, "OnLeave", function()
                Chat:Hide()
                end)
            end

            if not UI:IsHooked(ChatButtonFrameBackground, "OnEnter") then
                UI:SecureHookScript(ChatButtonFrameBackground, "OnEnter", function()
                Chat:Show()
                end)
            end
            if not UI:IsHooked(ChatButtonFrameBackground, "OnLeave") then
                UI:SecureHookScript(ChatButtonFrameBackground, "OnLeave", function()
                Chat:Hide()
                end)
            end

            if not UI:IsHooked(ChatFrame, "AddMessage") then
                UI:SecureHook(ChatFrame, "AddMessage", function(self, message, ...)
                local CurrentChatFrame = FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK)

                if UI:GetOption("chatOnUpdate") and (CurrentChatFrame == self and CurrentChatFrame.isDocked) then
                    Chat:Show()

                    if Chat.timer then
                        Chat.timer:Cancel()
                        Chat.timer = nil
                    end

                    Chat.timer = C_Timer.NewTimer(UI:GetOption("chatUpdateDuration"), function(self)
                        Chat:Hide()
                    end)
                end

                end)
            end
        else
            ChatFrame:SetParent(UIParent)
            ChatEditBox:SetParent(UIParent)

            UI:Unhook(ChatFrame, "OnEnter")
            UI:Unhook(ChatFrame, "OnLeave")

            UI:Unhook(ChatFrameBackground, "OnEnter")
            UI:Unhook(ChatFrameBackground, "OnLeave")

            UI:Unhook(ChatTab, "OnEnter")
            UI:Unhook(ChatTab, "OnLeave")

            UI:Unhook(ChatEditBox, "OnEnter")
            UI:Unhook(ChatEditBox, "OnLeave")
            UI:Unhook(ChatEditBox, "OnEditFocusGained")
            UI:Unhook(ChatEditBox, "OnEditFocusLost")

            UI:Unhook(ChatButtonFrame, "OnEnter")
            UI:Unhook(ChatButtonFrame, "OnLeave")

            UI:Unhook(ChatButtonFrameBackground, "OnEnter")
            UI:Unhook(ChatButtonFrameBackground, "OnLeave")
        end

    end

    GeneralDockManager:SetParent(self.Frame)
    QuickJoinToastButton:SetParent(self.Frame)

    self.Frame:SetScript("OnEnter", function(self)
        Chat:Show()
    end)
    self.Frame:SetScript("OnLeave", function(self)
        Chat:Hide()
    end)
end

function Chat:Show()

    if not self.disabled then
        local CurrentChatFrame = FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK)

        if CurrentChatFrame.isDocked then
            UI:FadeIn(CurrentChatFrame.FontStringContainer)
        end

        UI:FadeIn(self.Frame)
    end

end

function Chat:Hide()
    UI:OnLeave(self.Frame:GetName(), function(self)

        if not self.disabled then
            local CurrentChatFrame = FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK)

            if CurrentChatFrame.isDocked then
                UI:FadeOut(CurrentChatFrame.FontStringContainer, UI:GetOption("chatOpacity"))
            end

            UI:FadeOut(self.Frame, UI:GetOption("chatOpacity"))
        end

    end, self)
end

function Chat:Lock()
    UI:Lock(self.Frame)
end

function Chat:Unlock()
    UI:Unlock(self.Frame)
end

--------------------------------------------------------------------------------
-- Status Tracking Bar
--------------------------------------------------------------------------------

function StatusTrackingBar:Enable()
    self.Frame = CreateFrame("Frame", "StatusTrackingBarContainer", UIParent)

    StatusTrackingBarManager:SetParent(self.Frame)

    self.Frame:SetPoint("BOTTOMLEFT", "StatusTrackingBarManager", "BOTTOMLEFT", 0, 0)
    self.Frame:SetPoint("TOPRIGHT", "StatusTrackingBarManager", "TOPRIGHT", 0, 0)
    self.Frame:SetFrameStrata("LOW")

    UI:Event("PLAYER_ENTERING_WORLD", function()
        StatusTrackingBar:Hide()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        StatusTrackingBar:Hide()
    end)

    self.Frame:SetScript("OnEnter", function(self)
        StatusTrackingBar:Show()
    end)
    self.Frame:SetScript("OnLeave", function(self)
        StatusTrackingBar:Hide()
    end)

    UI:OnLock(function()
        StatusTrackingBar:Show()
    end)
    UI:OnUnlock(function()
        StatusTrackingBar:Hide()
    end)
end

function StatusTrackingBar:Show()
    UI:FadeIn(self.Frame)
end

function StatusTrackingBar:Hide()
    UI:OnLeave(self.Frame:GetName(), function()
        UI:FadeOut(self.Frame)
    end, self)
end

--------------------------------------------------------------------------------
-- Player Frame
--------------------------------------------------------------------------------

function PlayerFrame:Enable()
    self.Frame = _G["PlayerFrame"]
    self.condition = "playerFrameCondition"

    self.powerBars = {
        nil,
        _G["PaladinPowerBarFrame"],
        nil,
        _G["RogueComboPointBarFrame"],
        nil,
        _G["RuneFrame"],
        nil,
        _G["MageArcaneChargesFrame"],
        _G["WarlockPowerFrame"],
        _G["MonkHarmonyBarFrame"],
        _G["DruidComboPointBarFrame"],
        nil,
        _G["EssencePlayerFrame"]
    }

    _, _, self.classID = UnitClass("player")

    self.PowerBar = self.powerBars[self.classID]

    UI:Protect(self.PowerBar)

    self.powerBarCondition = "playerFramePowerBarCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        PlayerFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function(event, ...)
        PlayerFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_TARGET_CHANGED", function(event, ...)
        PlayerFrame:Evaluate(event, ...)
    end)

    UI:Event("UNIT_FACTION", function(event, ...)
        PlayerFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_UPDATE_RESTING", function(event, ...)
        PlayerFrame:Evaluate(event, ...)
    end)

    UI:Event("UNIT_HEALTH", function(event, unit)

        if unit == "player" then
            PlayerFrame:Evaluate(event, unit)
        end

    end)

    UI:OnLock(function()
        PlayerFrame:Show()
    end)
    UI:OnUnlock(function()
        PlayerFrame:Evaluate()
    end)
end

function PlayerFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function PlayerFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function PlayerFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

    if UI:GetOption(self.powerBarCondition) ~= "" and self.PowerBar then
        local powerBarCondition = UI:GetOption(self.powerBarCondition)

        if self.classID == 11 then
            powerBarCondition = "[noform:2] hide; " .. powerBarCondition
        end

        UI:Register(self.PowerBar, "visibility", powerBarCondition)
    end

end

function PlayerFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function PlayerFrame:Lock()
    UI:Lock(self.Frame)
end

function PlayerFrame:Unlock()
    UI:Unlock(self.Frame)
end

function PlayerFrame:Evaluate(event, ...)
    UI:Register(AlternatePowerBar, "visibility", "show")

    if UnitIsUnit("target", "player") or (UnitIsUnit("target", "pet") and UnitExists("pet")) then
        self:Show()
        return
    end

    if event == "UNIT_HEALTH" and not InCombatLockdown() then

        if UnitHealth("player") ~= UnitHealthMax("player") then
            self:Show()
            return
        else
            self:Register()
            return
        end

    end

    self:Register()
end

--------------------------------------------------------------------------------
-- Focus Frame
--------------------------------------------------------------------------------

function FocusFrame:Enable()
    self.Frame = _G["FocusFrame"]
    self.condition = "focusFrameCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        FocusFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function(event, ...)
        FocusFrame:Evaluate(event, ...)
    end)

    UI:OnLock(function()
        FocusFrame:Show()
    end)
    UI:OnUnlock(function()
        FocusFrame:Evaluate()
    end)
end

function FocusFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "[@focus, exists] show")
    end

    self:Unregister()
end

function FocusFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function FocusFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function FocusFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function FocusFrame:Evaluate(event, ...)
    self:Register()
end

--------------------------------------------------------------------------------
-- Pet Frame
--------------------------------------------------------------------------------

function PetFrame:Enable()
    self.Frame = _G["PetFrame"]
    self.condition = "petFrameCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        PetFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function(event, ...)
        PetFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_TARGET_CHANGED", function(event, ...)
        PetFrame:Evaluate(event, ...)
    end)

    UI:Event("UNIT_PET", function(event, ...)
        PetFrame:Evaluate(event, ...)
    end)

    UI:OnLock(function()
        PetFrame:Show()
    end)
    UI:OnUnlock(function()
        PetFrame:Evaluate()
    end)
end

function PetFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function PetFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function PetFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function PetFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function PetFrame:Lock()
    UI:Lock(self.Frame)
end

function PetFrame:Unlock()
    UI:Unlock(self.Frame)
end

function PetFrame:Evaluate(event, ...)

    if (UnitIsUnit("target", "player") or UnitIsUnit("target", "pet")) and UnitExists("pet") then
        return self:Show()
    end

    if UnitHealth("pet") ~= UnitHealthMax("pet") then
        self:Show()
        return self:Lock()
    end

    self:Unlock()
    self:Register()
end

--------------------------------------------------------------------------------
-- Target Frame
--------------------------------------------------------------------------------

function TargetFrame:Enable()
    self.Frame = _G["TargetFrame"]
    self.condition = "targetFrameCondition"

    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        TargetFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function(event, ...)
        TargetFrame:Evaluate(event, ...)
    end)

    UI:Event("PLAYER_TARGET_CHANGED", function(event, ...)
        TargetFrame:Evaluate(event, ...)
    end)

    UI:OnLock(function()
        TargetFrame:Show()
    end)
    UI:OnUnlock(function()
        TargetFrame:Evaluate()
    end)
end

function TargetFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "[exists] show")
    end

    self:Unregister()
end

function TargetFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function TargetFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function TargetFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

function TargetFrame:Evaluate(event, ...)
    self:Register()
end

--------------------------------------------------------------------------------
-- Minimap
--------------------------------------------------------------------------------

function Minimap:Enable()
    self.Frame = CreateFrame("Frame", "MinimapContainer", UIParent)
    self.Minimap = _G["Minimap"]
    self.condition = "minimapCondition"

    UI:Protect(self.Minimap)

    self.Frame:SetPoint("BOTTOMLEFT", "MinimapCluster", "BOTTOMLEFT", 0, 0)
    self.Frame:SetPoint("TOPRIGHT", "MinimapCluster", "TOPRIGHT", 0, 0)
    self.Frame:SetFrameStrata("LOW")

    MinimapCluster:SetParent(self.Frame)

    self.components = {
        MinimapCluster.BorderTop,
        MinimapCluster.Tracking,
        MinimapCluster.ZoneTextButton,
        MinimapCluster.InstanceDifficulty,
        TimeManagerClockButton,
        GameTimeFrame
    }

    UI:Event("PLAYER_ENTERING_WORLD", function()
        Minimap:Hide()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        Minimap:Hide()
    end)

    self.Frame:SetScript("OnEnter", function(self)
        Minimap:Show()
    end)
    self.Frame:SetScript("OnLeave", function(self)
        Minimap:Hide()
    end)

    UI:OnLock(function()
        Minimap:Show()
    end)
    UI:OnUnlock(function()
        Minimap:Hide()
    end)
end

function Minimap:Show()

    for _, component in ipairs(self.components) do
        UI:FadeIn(component)
    end

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Minimap, "visibility", "show")
    end

    self:Unregister()
end

function Minimap:Hide()
    UI:OnLeave(self.Frame:GetName(), function(self)

        for _, component in ipairs(self.components) do
            UI:FadeOut(component)
        end

        self:Register()
    end, self)
end

function Minimap:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Minimap, "visibility", UI:GetOption(self.condition))
    end

end

function Minimap:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Minimap, "visibility")
    end

end

--------------------------------------------------------------------------------
-- Layouts
--------------------------------------------------------------------------------

function Layouts:Enable()
    Layouts:Update()

    UI:Event("PLAYER_ENTERING_WORLD", function(event, ...)
        Layouts:Evaluate(event, ...)
    end)

    UI:Event("GROUP_ROSTER_UPDATE", function(event, ...)
        Layouts:Evaluate(event, ...)
    end)

    UI:OnLock(function()
        Layouts:Evaluate("OnLock")
    end)
    UI:OnUnlock(function()
        Layouts:Update()
        Layouts:Evaluate()
    end)
end

function Layouts:Update()
    self.layouts = self:Get()
    self.activeLayout = self:GetActive()

    if self.activeLayout ~= self.defaultLayout then
        self.defaultLayout = self.activeLayout
    end

    self.group5Layout = UI:GetOption("group5Layout")
    self.group10Layout = UI:GetOption("group10Layout")
    self.group25Layout = UI:GetOption("group25Layout")
    self.group40Layout = UI:GetOption("group40Layout")
end

function Layouts:Activate(layout)

    if self:Has(layout) then
        C_EditMode.SetActiveLayout(layout)
        self.activeLayout = layout
    end

end

function Layouts:Get()
    local layouts = C_EditMode.GetLayouts()
    local presetLayouts = EditModePresetLayoutManager:GetCopyOfPresetLayouts()

    tAppendAll(presetLayouts, layouts.layouts)

    layouts.layouts = presetLayouts

    return layouts
end

function Layouts:GetActive()
    return self.layouts.activeLayout
end

function Layouts:Has(layout)

    if self.layouts.layouts[layout] then
        return true
    end

    return false
end

function Layouts:List()
    local layouts = {}
    layouts[0] = ""

    for index, layout in pairs(self:Get().layouts) do
        layouts[index] = layout.layoutName
    end

    return layouts
end

function Layouts:Evaluate(event, ...)
    local newLayout = self.defaultLayout

    if IsInGroup() or IsInRaid() then
        local members = GetNumGroupMembers()

        if members <= 5 and self.group5Layout and self:Has(self.group5Layout) then
            newLayout = self.group5Layout
        elseif members <= 10 and self.group10Layout and self:Has(self.group10Layout) then
            newLayout = self.group10Layout
        elseif members <= 25 and self.group25Layout and self:Has(self.group25Layout) then
            newLayout = self.group25Layout
        elseif members <= 40 and self.group40Layout and self:Has(self.group40Layout) then
            newLayout = self.group40Layout
        end

    end

    if event == "OnLock" then
        newLayout = self.defaultLayout
    end

    if newLayout ~= self.activeLayout then
        self:Activate(newLayout)
    end

end

--------------------------------------------------------------------------------
-- Bags
--------------------------------------------------------------------------------

function Bags:Enable()
    self.Frame = _G["BagsBar"]

    self.components = {
        MainMenuBarBackpackButton,
        CharacterReagentBag0Slot,
        CharacterBag0Slot,
        CharacterBag1Slot,
        CharacterBag2Slot,
        CharacterBag3Slot,
        BagBarExpandToggle
    }

    UI:SecureHookScript(self.Frame, "OnEnter", function(self)
        Bags:Show()
    end)
    UI:SecureHookScript(self.Frame, "OnLeave", function(self)
        Bags:Hide()
    end)

    for _, component in ipairs(self.components) do

        UI:SecureHookScript(component, "OnEnter", function(self)
            Bags:Show()
        end)
        UI:SecureHookScript(component, "OnLeave", function(self)
            Bags:Hide()
        end)

    end

    UI:Event("PLAYER_ENTERING_WORLD", function()
        Bags:Hide()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        Bags:Hide()
    end)

    UI:OnLock(function()
        Bags:Show()
    end)
    UI:OnUnlock(function()
        Bags:Hide()
    end)
end

function Bags:Show()
    UI:FadeIn(self.Frame)
end

function Bags:Hide()
    UI:OnLeave(self.Frame:GetName(), function(self)
        UI:FadeOut(self.Frame)
    end, self)
end

--------------------------------------------------------------------------------
-- Menu
--------------------------------------------------------------------------------

function Menu:Enable()
    self.Frame = _G["MicroMenuContainer"]

    self.components = {
        CharacterMicroButton,
        SpellbookMicroButton,
        TalentMicroButton,
        AchievementMicroButton,
        QuestLogMicroButton,
        GuildMicroButton,
        LFDMicroButton,
        CollectionsMicroButton,
        EJMicroButton,
        StoreMicroButton,
        MainMenuMicroButton,
        MicroMenu
    }

    UI:SecureHookScript(self.Frame, "OnEnter", function(self)
        Menu:Show()
    end)
    UI:SecureHookScript(self.Frame, "OnLeave", function(self)
        Menu:Hide()
    end)

    for _, component in ipairs(self.components) do

        UI:SecureHookScript(component, "OnEnter", function(self)
            Menu:Show()
        end)
        UI:SecureHookScript(component, "OnLeave", function(self)
            Menu:Hide()
        end)

    end

    UI:Event("PLAYER_ENTERING_WORLD", function()
        Menu:Hide()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        Menu:Hide()
    end)

    UI:OnLock(function()
        Menu:Show()
    end)
    UI:OnUnlock(function()
        Menu:Hide()
    end)
end

function Menu:Show()
    UI:FadeIn(self.Frame)
end

function Menu:Hide()
    UI:OnLeave(self.Frame:GetName(), function(self)
        UI:FadeOut(self.Frame)
    end, self)
end

--------------------------------------------------------------------------------
-- Buff Frame
--------------------------------------------------------------------------------

function BuffFrame:Enable()
    self.Frame = _G["BuffFrame"]
    self.condition = "buffFrameCondition"

    UI:Protect(self.Frame)

    self.Frame.CollapseAndExpandButton:SetChecked(false)
    self.Frame.CollapseAndExpandButton:UpdateOrientation()

    self.Frame:SetBuffsExpandedState()

    UI:FadeOut(self.Frame.CollapseAndExpandButton)

    UI:SecureHookScript(self.Frame, "OnEnter", function(self)
        UI:FadeIn(self.CollapseAndExpandButton)
    end)

    UI:SecureHookScript(self.Frame, "OnLeave", function(self)
        UI:OnLeave(self:GetName(), function(self)
            UI:FadeOut(self.CollapseAndExpandButton)
        end, self)
    end)

    UI:Event("PLAYER_ENTERING_WORLD", function()
        BuffFrame:Register()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        BuffFrame:Register()
    end)

    UI:OnLock(function()
        BuffFrame:Show()
    end)
    UI:OnUnlock(function()
        BuffFrame:Register()
    end)
end

function BuffFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function BuffFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function BuffFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function BuffFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

--------------------------------------------------------------------------------
-- Debuff Frame
--------------------------------------------------------------------------------

function DebuffFrame:Enable()
    self.Frame = _G["DebuffFrame"]
    self.condition = "debuffFrameCondition"

    UI:Protect(self.Frame)

    UI:Event("PLAYER_ENTERING_WORLD", function()
        DebuffFrame:Register()
    end)

    UI:Event("PLAYER_REGEN_ENABLED", function()
        DebuffFrame:Register()
    end)

    UI:OnLock(function()
        DebuffFrame:Show()
    end)
    UI:OnUnlock(function()
        DebuffFrame:Hide()
    end)
end

function DebuffFrame:Show()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "show")
    end

    self:Unregister()
end

function DebuffFrame:Hide()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", "hide")
    end

    self:Unregister()
end

function DebuffFrame:Register()

    if UI:GetOption(self.condition) ~= "" then
        UI:Register(self.Frame, "visibility", UI:GetOption(self.condition))
    end

end

function DebuffFrame:Unregister()

    if UI:GetOption(self.condition) ~= "" then
        UI:Unregister(self.Frame, "visibility")
    end

end

--------------------------------------------------------------------------------
-- Tooltips
--------------------------------------------------------------------------------

function Tooltips:Enable()
    self.Frame = _G["GameTooltip"]

    UI:Event("UPDATE_MOUSEOVER_UNIT", function(self)

        if UI:GetOption("tooltipsUnitInCombat") and InCombatLockdown() then
            Tooltips:Hide()
        end

    end, self)

    UI:SecureHook(self.Frame, "SetUnit", function()

        if UI:GetOption("tooltipsUnitInCombat") and InCombatLockdown() then
            Tooltips:Hide()
        end

    end)

    UI:SecureHook(self.Frame, "SetAction", function()

        if UI:GetOption("tooltipsActionInCombat") and InCombatLockdown() then
            Tooltips:Hide()
        end

    end)

    UI:SecureHook(self.Frame, "SetPetAction", function()

        if UI:GetOption("tooltipsActionInCombat") and InCombatLockdown() then
            Tooltips:Hide()
        end

    end)

    UI:SecureHook(self.Frame, "SetShapeshift", function()

        if UI:GetOption("tooltipsActionInCombat") and InCombatLockdown() then
            Tooltips:Hide()
        end

    end)

    UI:SecureHook("GameTooltip_SetDefaultAnchor", function(self, parent)
        self:SetOwner(parent, "ANCHOR_CURSOR_RIGHT", 30, -100)
    end)
end

function Tooltips:Show()
    self.Frame:Show()
end

function Tooltips:Hide()
    self.Frame:Hide()
end
