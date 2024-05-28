return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      config = {
        gopls = {
          capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  commitCharactersSupport = true,
                  deprecatedSupport = true,
                  documentationFormat = { "markdown", "plaintext" },
                  preselectSupport = true,
                  insertReplaceSupport = true,
                  labelDetailsSupport = true,
                  snippetSupport = true,
                  resolveSupport = {
                    properties = {
                      "documentation",
                      "details",
                      "additionalTextEdits",
                    },
                  },
                },
                contextSupport = true,
                dynamicRegistration = true,
              },
            },
          },
          filetypes = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
          message_level = vim.lsp.protocol.MessageType.Error,
          cmd = {
            "gopls", -- share the gopls instance if there is one already
            "-remote.debug=:0",
          },
          flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
          settings = {
            gopls = {
              -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
              -- not supported
              analyses = {
                unreachable = true,
                nilness = true,
                unusedparams = true,
                useany = true,
                unusedwrite = true,
                ST1003 = true,
                undeclaredname = true,
                fillreturns = true,
                nonewvars = true,
                fieldalignment = false,
                shadow = true,
              },
              codelenses = {
                generate = true, -- show the `go generate` lens.
                gc_details = true, -- Show a code lens toggling the display of gc's choices.
                test = true,
                tidy = true,
                vendor = true,
                regenerate_cgo = true,
                upgrade_dependency = true,
              },
              hints = {
                assignVariableTypes = true,
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                -- constantValues = true,
                -- functionTypeParameters = true,
                -- parameterNames = true,
                -- rangeVariableTypes = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              matcher = "Fuzzy",
              diagnosticsDelay = "500ms",
              symbolMatcher = "fuzzy",
              semanticTokens = true,
              gofumpt = true,
              buildFlags = { "-tags", "integration" },
            },
          },
          before_init = function(_, config)
            if vim.fn.executable("go") ~= 1 then
              return
            end

            local module = vim.fn.trim(vim.fn.system("go list -m"))
            if vim.v.shell_error ~= 0 then
              return
            end
            module = module:gsub("\n", ",")

            config.settings.gopls["formatting.local"] = module
          end,
        },
      },
    },
  },
  -- Golang support
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
      end
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "gomodifytags", "gofumpt", "iferr", "impl", "goimports" }
      )
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gopls" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "delve", "gopls", "gomodifytags", "gofumpt", "iferr", "impl", "goimports" }
      )
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "jay-babu/mason-nvim-dap.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "delve" })
        end,
      },
    },
    opts = {},
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp_cfg = false,
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    -- Prevents Neovim from freezing on plugin installation/update.
    -- See: <https://github.com/ray-x/go.nvim/issues/433>
    build = function()
      require("go.install").update_all()
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "nvim-neotest/neotest-go" },
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
      table.insert(opts.adapters, require("neotest-go")(require("astrocore").plugin_opts("neotest-go")))
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
}
