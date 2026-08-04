local function copy_bazel_target_under_cursor()
    -- 1. Get the current cursor position and line
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
    if not line then return end

    -- 2. Extract the Bazel target name (valid characters include letters, digits, and _/.+=-)
    -- This pattern safely captures the full word string under the cursor
    local target_pattern = "[%w_%.%/%+%=-]+"
    local start_idx, end_idx = 1, 1
    while true do
        start_idx, end_idx = line:find(target_pattern, end_idx)
        if not start_idx then break end
        if col + 1 >= start_idx and col + 1 <= end_idx then
            break
        end
        end_idx = end_idx + 1
    end

    -- Fallback to standard cword if pattern calculation fails
    local target_name = (start_idx and line:sub(start_idx, end_idx)) or vim.fn.expand("<cword>")
    if target_name == "" then
        vim.notify("No target found under cursor", vim.log.levels.WARN)
        return
    end

    -- 3. Strip any quotes if the cursor was on a string target definition
    target_name = target_name:gsub('["\']', '')

    -- If it is already a fully qualified target (e.g., starts with //), just copy it
    if target_name:match("^//") then
        vim.fn.setreg("+", target_name)
        vim.notify("Copied full target: " .. target_name, vim.log.levels.INFO)
        return
    end

    -- 4. Find the nearest BUILD file directory to determine the package path
    local current_file_dir = vim.fn.expand("%:p:h")
    local build_file = vim.fs.find({ "BUILD", "BUILD.bazel" }, {
        path = current_file_dir,
        upward = true,
        stop = vim.loop.os_homedir(),
    })[1]

    if not build_file then
        vim.notify("Not inside a Bazel package (No BUILD file found upwards)", vim.log.levels.ERROR)
        return
    end

    -- 5. Find the Workspace root to compute the package path relative to it
    local workspace_file = vim.fs.find({ "WORKSPACE", "WORKSPACE.bazel", "MODULE.bazel" }, {
        path = current_file_dir,
        upward = true,
        stop = vim.loop.os_homedir(),
    })[1]

    if not workspace_file then
        vim.notify("Not inside a Bazel Workspace (No WORKSPACE or MODULE file found)", vim.log.levels.ERROR)
        return
    end

    local workspace_dir = vim.fs.dirname(workspace_file)
    local package_dir = vim.fs.dirname(build_file)

    -- 6. Format the final target string relative to the workspace root
    local relative_package = package_dir:sub(#workspace_dir + 2)
    local full_target = "//" .. relative_package .. ":" .. target_name

    -- Clean up extra slashes if target is at workspace root
    full_target = full_target:gsub("//:", "//")

    -- 7. Copy to the '+' system clipboard register
    vim.fn.setreg("+", full_target)
    vim.notify("Copied Bazel target: " .. full_target, vim.log.levels.INFO)
end

-- Create a user command for easy execution or debugging
vim.api.nvim_create_user_command("BazelCopyTarget", copy_bazel_target_under_cursor, {})

-- Bind to your preferred shortcut (e.g., <leader>by to "Bazel Yank")
vim.keymap.set("n", "<leader>by", copy_bazel_target_under_cursor, { desc = "Copy Bazel target under cursor" })
