return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local virt_text = require("nvim-dap-virtual-text")
      local masondap = require("mason-nvim-dap")

      dapui.setup()
      virt_text.setup()
      masondap.setup({
        automatic_installation = true,
      })

      -- general dap commands
      vim.keymap.set("n", "<leader>dt", function() dapui.toggle() end, {noremap = true})
      vim.keymap.set("n", "<leader>dc", function() dap.continue() end, {noremap = true})
      vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, {noremap = true})
      vim.keymap.set("n", "<leader>dr", function() dapui.open({reset = true}) end, {noremap = true})
    end,
  },
}
