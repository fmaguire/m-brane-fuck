import os

let code = if paramCount() > 0: readFile paramstr(1)
           else: readAll stdin

echo code
