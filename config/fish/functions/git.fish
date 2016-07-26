# Git Functions
function gi;   git init; end
function ga;   git add $argv; end
function gc;   git commit $argv; end
function gp;   git push $argv; end
function gpt;  git push --tags $argv; end
function gpl;  git pull --prune; end
function gl;   git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative | cat; end
function grl;  git reflog --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative | cat; end
function gd;   git diff $argv; end
function gdc;  git diff --cached $argv; end
function gch;  git checkout $argv; end
function gchb; git checkout -b $argv; end
function gb;   git branch $argv; end
function gs;   git status -sb; end
function grs;  git reset --soft $argv; end
function grh;  git reset --hard $argv; end
function gcp;  git cherry-pick $argv; end
function grm;  git rm -f $argv; end
