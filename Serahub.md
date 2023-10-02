getgenv().config = {

    ["Team"] = "Pirates",

    ["Race"] = {

        ["V3"] = true,

        ["V4"] = true

    },

    ["Info Screen"] = true,

    ["SkipFruit"] = {

        "Portal-Portal"

    },

    ["Skip Race V4 User"] = true,

    ["MainSkillToggle"] = {

        ["Melee"] = {

            ["Enable"] = true,

            ["Delay"] = 2,

            ["Skills"] = {

                ["Z"] = {["Enable"] = true,["HoldTime"] = 1.5},

                ["X"] = {["Enable"] = true,["HoldTime"] = 0},

                ["C"] = {["Enable"] = true,["HoldTime"] = 0},

            },

        },

        ["Blox Fruit"] = {

            ["Enable"] = true,

            ["Delay"] = 3,

            ["Skills"] = {

                ["Z"] = {["Enable"] = true,["HoldTime"] = 3},

                ["X"] = {["Enable"] = true,["HoldTime"] = 0},

                ["C"] = {["Enable"] = true,["HoldTime"] = 0},

                ["V"] = {["Enable"] = true,["HoldTime"] = 0},

                ["F"] = {["Enable"] = false,["HoldTime"] = 0},

            },

        },

        ["Gun"] = {

            ["Enable"] = true,

            ["Delay"] = 3,

            ["Skills"] = {

                ["Z"] = {["Enable"] = true,["HoldTime"] = 0},

                ["X"] = {["Enable"] = true,["HoldTime"] = 0},

            },

        },

        ["Sword"] = {

            ["Enable"] = false,

            ["Delay"] = 1,

            ["Skills"] = {

                ["Z"] = {["Enable"] = true,["HoldTime"] = 0},

                ["X"] = {["Enable"] = true,["HoldTime"] = 0},

            },

        }

    },

    ["Webhooks"] = {

        ["Link Webhook"] = "",

        ["Toggle Webhook"] = true

    },

    ["ChatSpam"] = {"Sera Hub On Top", "I got a VGA", "No Skill? Using SeraHub"},

    ["MinBountyHunt"] = 0,

    ["MaxBountyHunt"] = 30000000,

    ["SafeHealth"] = 4000,

    ["FixingTicks"] = 1200,

    ["FixingTicksPerPlayer"] = 100,

}

loadstring(game:HttpGet("https://raw.githubusercontent.com/LumosSera/SeraHub/main/aut.lua"))()
