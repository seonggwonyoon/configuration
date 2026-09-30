# configuration

macOS 개발 환경 설정. fish, tmux, Neovim, git 설정과 Homebrew 패키지 목록을 관리한다.
`home/` 아래 설정 파일을 GNU Stow 로 `$HOME` 에 심볼릭 링크한다.

## 새 Mac 설치

선행 조건:

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

설치:

```sh
git clone <이 저장소> ~/Personal/configuration
cd ~/Personal/configuration
./install.sh --dry-run   # 할 일 미리보기
./install.sh             # 패키지·앱 설치 + 설정 링크 + mise 도구 설치 (App Store 앱은 로그인 필요)
```

`install.sh` 는 여러 번 실행해도 안전하다. 링크할 자리에 다른 파일이 있으면
`~/.dotfiles-backup/<시각>/` 으로 옮긴 뒤 링크한다. 로그인 셸 변경과 macOS 기본값은 건드리지 않는다.

터미널은 macOS 기본 터미널을 쓴다. 기본 터미널이 로그인 셸을 띄우므로 fish 를 로그인 셸로 지정한다.
`install.sh` 는 이 단계를 건너뛰니 한 번 직접 실행한다.

```sh
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

## 저장소에 없는 로컬 파일

머신마다 다르거나 개인 정보가 들어 있어서 저장소에 넣지 않는다. 새 Mac 에서는 직접 만든다.

| 파일 | 내용 |
|---|---|
| `~/.gitconfig.local` | git 이름, 이메일, 서명 키와 서명 방식 |
| `~/.gitconfig-workspace` | `~/Workspace/` 아래 저장소용 회사 git 설정 |
| `~/.config/fish/conf.d/op_account.fish` | 디렉터리별 1Password 계정 전환 |
| `~/.config/fish/conf.d/rustup.fish` | rustup 설치 시 자동 생성 |
| `~/.config/fish/completions/` | 도구가 생성한 자동완성 |

`~/.gitconfig.local` 예시:

```ini
[user]
	name = 이름
	email = 이메일
	signingkey = 키
[commit]
	gpgsign = true
```

## 구조

```text
Brewfile         CLI 도구, GUI 앱, App Store 앱
install.sh       패키지 설치, 백업, 링크
home/            $HOME 에 링크되는 설정
  .gitconfig
  .config/fish/      conf.d/, functions/
  .config/tmux/      tmux.conf (Gruvbox Dark 상태바)
  .config/git/       ignore (전역 gitignore)
  .config/nvim/      init.lua, nvim-pack-lock.json
  .config/mise/      config.toml (terraform, helm, argocd, eksctl, istioctl)
  .config/starship.toml
```

## 자주 쓰는 작업

설정 파일 추가: `home/` 아래 `$HOME` 기준 같은 경로에 파일을 두고 `./install.sh --no-brew` 를 실행한다.

패키지 목록 관리:

```sh
brew bundle check --verbose --file=Brewfile                  # 빠진 패키지 확인
brew bundle cleanup --file=Brewfile                          # 목록에 없는 설치 항목 확인
mise upgrade                                                 # mise 도구 최신 버전으로
```

백업에서 복구:

```sh
B=~/.dotfiles-backup/<시각>
stow --dir ~/Personal/configuration --target ~ --delete home
cp -Rp "$B"/. ~
```

## 키 설정

tmux (prefix: 백틱)

| 키 | 동작 |
|---|---|
| `` ` `` `` ` `` | 직전 창 |
| `` ` `` `e` | 백틱 입력 |
| `` ` `` `c` | 현재 경로에서 새 창 |
| `` ` `` `\|` / `-` | 현재 경로에서 좌우 / 상하 분할 |
| `Shift` + 방향키 | pane 이동 |
| `` ` `` `Esc` | 복사 모드. `v` 선택, `C-v` 사각 선택, `y` 클립보드로 복사 |
| `` ` `` `r` | 설정 다시 읽기 |

Neovim (leader: Space). 플러그인은 내장 `vim.pack` 으로 관리하고 LSP 서버는 Brewfile 로 설치한다.

| 키 | 동작 |
|---|---|
| `Space ff` / `fg` / `fb` / `fh` | 파일 / 내용 / 버퍼 / 최근 파일 검색 |
| `Space fd` | 현재 파일 진단 목록 |
| `gd`, `grr`, `grn`, `gra`, `K` | 정의, 참조, 이름 변경, 코드 액션, 문서 |
| `[d` / `]d` | 이전 / 다음 진단 |
| `Space e` | 파일 탐색기 (netrw) |
| `Space gg` | lazygit |
| `Space gn` / `gp` / `ga` / `gu` / `gb` | 다음 / 이전 변경, 스테이지, 되돌리기, blame |
| `Space tn` / `tc` / `to`, `]t` / `[t` | 탭 새로 / 닫기 / 하나만, 탭 이동 |
| `Space w` / `q` / `bd` | 저장 / 닫기 / 버퍼 삭제 |

저장하면 LSP 서버가 포맷한다. 플러그인 업데이트: `:lua vim.pack.update()`

fish 약어: `vi`, `vim` 은 `nvim`, `bu` 는 `brew update; and brew upgrade`.
