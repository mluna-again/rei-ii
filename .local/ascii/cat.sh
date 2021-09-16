#!/bin/bash

if [ $1 = "catbox" ]; then
cat <<'EOF'
  ,-.       _,---._ __  / \
 /  )    .-'       `./ /   \
(  (   ,'            `/    /|
 \  `-"             \'\   / |
  `.              ,  \ \ /  |
   /`.          ,'-`----Y   |
  (            ;        |   '
  |  ,-.    ,-'         |  /
  |  | (   |            | /
  )  |  \  `.___________|/
  `--'   `--'
EOF

elif [ $1 = "dumbcat" ]; then
cat <<'EOF'

  ／l、
ﾞ(ﾟ､ ｡７
  l、 ~ヽ
  じしf_,)ノ

EOF

elif [ $1 = "sleepcat" ]; then
cat <<'EOF'

⠀⠀⠀⠀⠀⠀⠀    ⠀⠀ ＿＿
　　　　　／＞　　フ
　　　　　|   _　 _l
　 　　　／` ミ＿xノ
　　 　 /　　　   |
　　　 /　 ヽ　　 ﾉ
　 　 │　 　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ 

EOF

else
printf "
options are:

catbox
dumbcat
sleepcat

"

fi
