export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="false"


plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

ITOR='mvim'
# fi

export ARCHFLAGS="-arch x86_64"
export PATH=$PATH:/Users/utkugedik/fvm/default/bin

eval "$(starship init zsh)"


eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$PATH":"$HOME/.pub-cache/bin"

alias fc="flutter clean && flutter pub get"
alias br="dart run build_runner build --delete-conflicting-outputs"


killport() {
  if [ $# -eq 0 ]
  then
    echo "Bir port numarası girmelisiniz."
    return 1
  fi

  local PORT=$1

  # Portu kullanan işlemin PID'ini bul
  local PID=$(sudo lsof -ti:$PORT)

  # Eğer bir PID bulunursa, işlemi sonlandır
  if [ ! -z "$PID" ]
  then
    echo "Port $PORT numarasını kullanan işlem bulundu: PID $PID. Sonlandırılıyor..."
    kill -9 $PID
    echo "Port $PORT serbest bırakıldı."
  else
    echo "Port $PORT şu anda kullanımda değil."
  fi
}

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/utkugedik/.dart-cli-completion/zsh-config.zsh ]] && . /Users/utkugedik/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

