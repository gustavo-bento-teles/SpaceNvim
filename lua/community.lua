---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- força desativar o blink
  { "saghen/blink.cmp", enabled = false },

  -- adiciona o nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim", -- ícones e cores
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- ícone + texto
            maxwidth = 50,        -- corta descrições longas
            ellipsis_char = "...",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- abre popup manualmente
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirma item
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-e>"] = cmp.mapping.close(), -- fecha popup
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = true, -- preview da sugestão direto no buffer
        },
        duplicates = {
          buffer = 1,
          nvim_lsp = 0,
        },
        -- custom menu de origem
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = lspkind.symbolic(vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              buffer = "[Buf]",
              path = "[Path]",
              luasnip = "[Snip]",
            })[entry.source.name]
            return vim_item
          end,
        },
      })

      -- Highlights customizados (cores do popup)
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#FF9E64", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#FF9E64" })
      vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#7AA2F7" })
      vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9ECE6A" })
      vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#F7768E" })
    end,
  }

}