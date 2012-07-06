" ²âÊÔVIMµÄPythonÖ§³Ö

function! s:py_ver()
python << EOF
import sys
print(sys.version)
import os
print(os.name)
EOF
endfunction  

function! s:py3_ver()
python3 << EOF
import sys
print(sys.version)
import os
print(os.name)
EOF
endfunction

command! -nargs=0 -bar PyV call s:py_ver()
command! -nargs=0 -bar Py3V call s:py3_ver()
