

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="false"


plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

ITOR='mvim'
# fi

export ARCHFLAGS="-arch x86_64"
export PATH=$PATH:/Users/utkugedik/fvm/default/bin:$PATH

eval "$(starship init zsh)"


eval "$(/opt/homebrew/bin/brew shellenv)"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH


alias fc="flutter clean && flutter pub get"
alias br="dart run build_runner build --delete-conflicting-outputs"
alias slang="dart run slang"


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

function flutterBuild() {
    local APPLE_ID="utku.gedik@miateknoloji.com"
    local APP_SPECIFIC_PASSWORD="oooz-isto-oqki-nfai"
    
    # pubspec.yaml dosyasından build number'ı al
    local BUILD_NUMBER=$(grep '^version: ' pubspec.yaml | sed 's/.*+\([0-9]*\)/\1/')

    # Flutter ve xcrun komutları
    flutter clean
    flutter build ipa --release --build-number=$BUILD_NUMBER
    xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa -u $APPLE_ID -p $APP_SPECIFIC_PASSWORD
}


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/utkugedik/.dart-cli-completion/zsh-config.zsh ]] && . /Users/utkugedik/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Added by Windsurf
export PATH="/Users/utkugedik/.codeium/windsurf/bin:$PATH"
