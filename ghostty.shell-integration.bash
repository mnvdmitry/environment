# Ghostty shell-integration helper для bash
# Этот файл не обязателен: если в ghostty.config указан `command = /bin/bash --login`,
# то источником конфига становится ~/.bash_profile → ~/.bashrc.
#
# Оставлен для случая, когда нужно явно подключить интеграцию из ghostty
# через директиву shell-integration-features или внешний source.
# shellcheck shell=bash

if [ -n "$GHOSTTY_RESOURCES_DIR" ] && \
   [ -f "$GHOSTTY_RESOURCES_DIR/shell-integration/bash/ghostty.bash" ]; then
    builtin source "$GHOSTTY_RESOURCES_DIR/shell-integration/bash/ghostty.bash"
fi
