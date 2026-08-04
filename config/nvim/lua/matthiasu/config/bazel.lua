local function copy_bazel_target_under_cursor()
    local target_name = vim.fn.expand("<cfile>"):gsub("[\"']", "")
    if target_name == "" then
        vim.notify("No target found under cursor", vim.log.levels.WARN)
        return
    end

    if target_name:match("^//") then
        vim.fn.setreg("+", target_name)
        vim.notify("Copied full target: " .. target_name, vim.log.levels.INFO)
        return
    end

    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file == "" then return end

    local build_file = vim.fs.find({ "BUILD", "BUILD.bazel" }, { upward = true, path = current_file })[1]
    local workspace_root = vim.fs.root(current_file, { "WORKSPACE", "WORKSPACE.bazel", "MODULE.bazel" })

    if not build_file or not workspace_root then
        vim.notify("Not inside a valid Bazel workspace or package", vim.log.levels.ERROR)
        return
    end

    -- 3. Compute relative package path
    local package_dir = vim.fs.dirname(build_file)
    local relative_pkg = vim.fs.relpath(workspace_root, package_dir) or ""

    -- 4. Format and copy to system clipboard
    local full_target = (relative_pkg == "") and ("//" .. target_name) or ("//" .. relative_pkg .. ":" .. target_name)

    vim.fn.setreg("+", full_target)
    vim.notify("Copied Bazel target: " .. full_target, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("BazelCopyTarget", copy_bazel_target_under_cursor,
    { desc = "Copy Bazel target under cursor" })

vim.keymap.set("n", "<leader>by", copy_bazel_target_under_cursor, { desc = "Copy Bazel target under cursor" })
