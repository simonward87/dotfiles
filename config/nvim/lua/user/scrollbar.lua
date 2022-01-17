local status_ok, scrollbar = pcall(require, "scrollbar")
if not status_ok then
	return
end

scrollbar.setup({
	handle = {
		color = "gray28", -- gray20 also good
	},
})
