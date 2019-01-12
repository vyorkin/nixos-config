" open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first.
" mnemonic 'jump to [something]'

nn ,jm :CtrlP app/models<CR>
nn ,jc :CtrlP app/controllers<CR>
nn ,ja :CtrlP app/api<CR>
nn ,jv :CtrlP app/views<CR>
nn ,jh :CtrlP app/helpers<CR>

nn ,jl :CtrlP lib<CR>
nn ,jt :CtrlP lib/tasks<CR>

nn ,jp :CtrlP public<CR>
nn ,js :CtrlP spec<CR>
nn ,jf :CtrlP spec/factories<CR>
nn ,jd :CtrlP db<CR>
nn ,jdm :CtrlP db/migrate<CR>

nn ,jC :CtrlP config<CR>
" nn ,jcon :CtrlP config<CR>

nn ,jT :CtrlP test<CR>
nn ,jtest :CtrlP test<CR>

" nn ,jaj :CtrlP app/assets/javascripts<CR>
" nn ,jas :CtrlP app/assets/stylesheets<CR>

" nn ,jlo :CtrlP config/locales<CR>
nn ,jin :CtrlP config/initializers<CR>
nn ,jen :CtrlP config/environments<CR>

" nn ,jV :CtrlP vendor<CR>
" nn ,jven :CtrlP vendor<CR>

" app/gem specific jumps
nn ,jup :CtrlP app/uploaders<CR>

nn ,jra :CtrlP config/rails_admin<CR>
" nn ,jcap :CtrlP config/deploy<CR>

nn ,j1 :CtrlP app/forms<CR>
" nn ,jfor :CtrlP app/forms<CR>

nn ,j2 :CtrlP app/serializers<CR>
" nn ,jser :CtrlP app/serializers<CR>

nn ,j3 :CtrlP app/mailers<CR>
" nn ,jmail :CtrlP/mailers<CR>
