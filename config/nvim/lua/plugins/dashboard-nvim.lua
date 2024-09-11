return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local logo = [[
┬ ┬┬┌─┐  ┌─┐┬ ┬┌┐┌┌┬┐   
├─┤││    └─┐│ ││││ │    
┴ ┴┴└─┘  └─┘└─┘┘└┘ ┴    
┌┬┐┬─┐┌─┐┌─┐┌─┐┌┐┌┌─┐┌─┐
 ││├┬┘├─┤│  │ ││││├┤ └─┐
─┴┘┴└─┴ ┴└─┘└─┘┘└┘└─┘└─┘
    ]]
    logo = "\n" .. logo .. "\n"
    opts.config.header = vim.split(logo, "\n")
  end,
}
