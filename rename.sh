#!/bin/sh
#更改提交中所有邮箱为OLD_EMAIL或用户名为OLD_NAME的为新的用户名和新的邮箱，注释部分的可以变更邮箱

CORRECT_EMAIL="519061949@qq.com"
OLD_EMAIL="lknlkn1999@163.com"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
git filter-branch --env-filter '
OLD_NAME="bentleyer"
CORRECT_NAME="zhide730"

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
fi
if [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
fi
' -f --tag-name-filter cat -- --branches --tags    #-f为强行覆盖
#取消下面的#注释，将自动强行推送所有修改到主分支
git push origin dev --force
