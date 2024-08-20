local has_lualine, lualine = pcall(require, "lualine")
if not has_lualine then
    return
end

local has_neopywal, neopywal_lualine = pcall(require, "neopywal.theme.plugins.lualine")
if not has_neopywal then
    return
end

neopywal_lualine.setup()

lualine.setup({
    options = {
        theme = "neopywal",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'dashboard',
          -- 'NeogitStatus',
          -- 'NeogitCommitView',
          -- 'NeogitPopup',
          -- 'NeogitConsole',
        },
    },
})
