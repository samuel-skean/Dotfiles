vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    callback = function(ev)
        local historyFile = io.open(ev.file .. ".skeanhistory", "a")
        vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI", "TextChangedP"}, {
            callback = function(ev)
                historyFile:write(vim.inspect(ev) .. os.time() .. "\n")
                    -- I really hope this is buffered I/O. It seems lua does
                    -- use buffered I/O by default, and this has something to
                    -- do with POSIX, but I'm not sure if that applies to
                    -- things I use with "write()".
                    -- (https://stackoverflow.com/questions/18541636/is-stdin-stdout-stderr-buffered-or-unbuffered-in-lua)
                historyFile:write(vim.inspect(vim.fn.getpos("']")) .. vim.inspect(vim.fn.getpos("'[")))
                -- TODO: Somehow, use some delimiters to capture the line that changed. It looks like '[,'] captures the line that was most recently modified. No idea how to get it from lua, though.
            end
        })
    end
})

