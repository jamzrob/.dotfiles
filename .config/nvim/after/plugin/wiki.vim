function! GoNext()
    if g:qf
        cnext
    else
        lnext
    endif
endfunction

function! GoPrev()
    if g:qf
        cprev
    else
        lprev
    endif
endfunction


let g:qf_open = 0
let g:ll_open = 0
let g:qf = 0
let g:ll = 0

fun! ToggleList(list_type_to_open)

    if a:list_type_to_open == 1
        let g:qf = 1
        let g:qf_open = 1
        let g:ll = 0
        copen

    " open location

    elseif a:list_type_to_open == 0
        let g:ll = 1
        let g:qf = 0
    " Toggle last open

    elseif a:list_type_to_open == 2
        if g:qf == 1
            if g:qf_open == 1
                let g:qf_open = 0
                lclose
            else
                let g:qf_open = 1
                lopen
            end
        else

            if g:ll_open == 1
                let g:ll_open = 0
                lclose
            else
                let g:ll_open = 1
                lopen
            end
        end
    else
        let g:qf_open = 0
        let g:ll_open = 0
        lclose
        cclose
    end
endfun


" Vim Wiki
function! VimwikiFindAllTasks()
    VimwikiSearch /- \[.\]/
    let g:ll_open = 1
    lopen
endfunction

function! VimwikiFindIncompleteTasks()
    VimwikiSearch /- \[ \]/
    let g:ll_open = 1
    lopen
endfunction


