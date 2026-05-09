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
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                search_down = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                search_up = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                filter = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                lua = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                help = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                calculator = {
                    icon_hl_group = 'FloatTitle',
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
                            },
                        },
                    },
                },
                input = {
                    opts = {
                        win_options = {
                            winhighlight = {
                                FloatBorder = "FloatBorder",
                                FloatTitle = "FloatTitle",
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
                        Normal = "NormalFloat",
                        FloatBorder = "FloatBorder",
                        FloatTitle = "FloatTitle",
                    },
                },
            },
            popupmenu = {
                win_options = {
                    winhighlight = {
                        Normal = "NormalFloat",
                        FloatBorder = "FloatBorder",
                        CursorLine = "PmenuSel",
                        PmenuMatch = "Special",
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
