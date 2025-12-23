local F = {}

function F.toggle_window_zoom()
    vim.cmd [[

    if g:win_zoom
      let g:win_zoom = 0
      :exe "normal \<C-W>="
    else
        let g:win_zoom = 1
        :exe "normal \<C-W>_\<C-W>|"
    endif
  ]]
end

return F
