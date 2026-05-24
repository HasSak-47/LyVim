return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    ---@type NoiceConfig
    opts = {
        notify = {
            enabled = false,
        },
        cmdline = {
            format = {
                cmdline = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                search_down = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                search_up = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                filter = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                lua = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                help = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                calculator = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
                input = {
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "MyKaFloatBorder",
                                FloatTitle = "MyKaFloatTitle",
                            },
                        },
                    },
                },
            },
        },
        views = {
            cmdline_popup = {
                win_options = {
                    winhighlight = {
                        Normal = "MyKaNormalFloat",
                        FloatBorder = "MyKaFloatBorder",
                        FloatTitle = "MyKaFloatTitle",
                    },
                },
            },
            popupmenu = {
                win_options = {
                    winhighlight = {
                        Normal = "MyKaNormalFloat",
                        FloatBorder = "MyKaFloatBorder",
                        CursorLine = "MyKaPmenuSel",
                        PmenuMatch = "MyKaSpecial",
                    },
                },
            },
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
