#!/bin/bash

# PWR Chain Validator - Simple Management Script
# CryptoCompass Branded Installation Script
# Простой скрипт для управления PWR Chain Validator

# Color functions for CryptoCompass branding
show_red()     { echo -e "\e[31m$1\e[0m"; }
show_green()   { echo -e "\e[32m$1\e[0m"; }
show_yellow()  { echo -e "\e[1;33m$1\e[0m"; }
show_blue()    { echo -e "\e[34m$1\e[0m"; }
show_purple()  { echo -e "\e[35m$1\e[0m"; }
show_cyan()    { echo -e "\e[36m$1\e[0m"; }
show_white()   { echo -e "\e[1;37m$1\e[0m"; }
show_bold()    { echo -e "\e[1m$1\e[0m"; }

# Combined color functions
show_success() { echo -e "\e[32m\e[1m$1\e[0m"; }
show_error()   { echo -e "\e[31m\e[1m$1\e[0m"; }
show_warning() { echo -e "\e[1;33m\e[1m$1\e[0m"; }
show_info()    { echo -e "\e[36m\e[1m$1\e[0m"; }
show_header()  { echo -e "\e[1;37m\e[1m$1\e[0m"; }

# CryptoCompass logo
show_logo() {
    clear
    echo -e "\e[36m\e[1m"
    echo "  ╔══════════════════════════════════════════════════════════════╗"
    echo "  ║                                                              ║"
    echo "  ║    ██████╗██████╗ ██╗   ██╗██████╗ ████████╗ ██████╗         ║"
    echo "  ║   ██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗╚══██╔══╝██╔═══██╗        ║"
    echo "  ║   ██║     ██████╔╝ ╚████╔╝ ██████╔╝   ██║   ██║   ██║        ║"
    echo "  ║   ██║     ██╔══██╗  ╚██╔╝  ██╔═══╝    ██║   ██║   ██║        ║"
    echo "  ║   ╚██████╗██║  ██║   ██║   ██║        ██║   ╚██████╔╝        ║"
    echo "  ║    ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝    ╚═════╝         ║"
    echo "  ║                                                              ║"
    echo "  ║  ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗███████╗ ║"
    echo "  ║ ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝ ║"
    echo "  ║ ██║     ██║   ██║██╔████╔██║██████╔╝███████║███████╗███████╗ ║"
    echo "  ║ ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██║╚════██║╚════██║ ║"
    echo "  ║ ╚██████╗╚██████╔╝██║     ██║██║     ██║  ██║███████║███████║ ║"
    echo "  ║  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝ ║"
    echo "  ║                                                              ║"
    echo "  ║                    PWR Chain Validator                       ║"
    echo "  ║                   Simple Management Script                   ║"
    echo "  ║                                                              ║"
    echo "  ╚══════════════════════════════════════════════════════════════╝"
    echo -e "\e[0m"
    echo ""
    echo -e "\e[1;37m\e[1m🌐 CryptoCompass Resources:\e[0m"
    echo -e "\e[36m\e[1m• Twitter/X:\e[0m \e[1;37mhttps://x.com/0xGreenFlag\e[0m"
    echo -e "\e[36m\e[1m• YouTube:\e[0m \e[1;37mhttps://www.youtube.com/@beloglazovpro\e[0m"
    echo -e "\e[36m\e[1m• Telegram:\e[0m \e[1;37mhttps://t.me/beloglazovpro\e[0m"
    echo ""
}

# Language selection
select_language() {
    show_logo
    show_yellow "Выберите язык / Select Language:"
    show_white "1) Русский"
    show_white "2) English"
    echo ""
    read -p "$(show_cyan "Выбор / Choice [1-2]: ")" lang_choice

    case $lang_choice in
        1) LANG="ru" ;;
        2) LANG="en" ;;
        *) show_error "Неверный выбор / Invalid choice"; select_language ;;
    esac
}

# Text strings based on language
get_text() {
    case $LANG in
        "ru")
            case $1 in
                "main_menu") echo "Главное меню" ;;
                "install") echo "Установка" ;;
                "manage") echo "Управление" ;;
                "remove") echo "Удаление" ;;
                "exit") echo "Выход" ;;
                "requirements") echo "Требования к системе:" ;;
                "cpu") echo "• CPU: 2 vCPU" ;;
                "ram") echo "• RAM: 4 GB" ;;
                "disk") echo "• Диск: 100 GB HDD или больше" ;;
                "bandwidth") echo "• Пропускная способность: 400Mbps загрузка, 800Mbps выгрузка" ;;
                "ports") echo "• Открытые порты: TCP 8231, 8085, 9864; UDP 7621" ;;
                "continue") echo "Продолжить установку?" ;;
                "yes_no") echo "[y/n]: " ;;
                "installing") echo "Установка PWR Validator Node..." ;;
                "updating") echo "Обновление системы..." ;;
                "installing_java") echo "Установка Java..." ;;
                "opening_ports") echo "Открытие портов..." ;;
                "downloading") echo "Загрузка файлов валидатора..." ;;
                "setup_password") echo "Настройка пароля..." ;;
                "enter_password") echo "Введите пароль для валидатора: " ;;
                "confirm_password") echo "Подтвердите пароль: " ;;
                "passwords_dont_match") echo "Пароли не совпадают!" ;;
                "enter_ip") echo "Введите IP адрес вашего сервера: " ;;
                "starting_node") echo "Запуск ноды..." ;;
                "installation_complete") echo "Установка завершена!" ;;
                "get_address") echo "Получение адреса валидатора..." ;;
                "node_running") echo "Нода запущена" ;;
                "node_stopped") echo "Нода остановлена" ;;
                "press_enter") echo "Нажмите Enter для продолжения..." ;;
                "invalid_choice") echo "Неверный выбор!" ;;
                "logs") echo "Логи" ;;
                "update") echo "Обновление" ;;
                "restart") echo "Перезапуск" ;;
                "back") echo "Назад" ;;
                "node_restarted") echo "Нода перезапущена!" ;;
                "node_stopped_msg") echo "Нода остановлена!" ;;
                "address") echo "Адрес валидатора: " ;;
                "show_address") echo "Показать адрес ноды" ;;
                "show_seed") echo "Показать сид-фразу" ;;
                "seed_phrase") echo "Сид-фраза валидатора" ;;
                "node_address") echo "Адрес ноды" ;;
                "remove_confirm") echo "Вы уверены, что хотите удалить PWR Validator?" ;;
                "removing") echo "Удаление PWR Validator..." ;;
                "removed") echo "PWR Validator удален!" ;;
                "not_installed") echo "PWR Validator не установлен" ;;
                "already_installed") echo "PWR Validator уже установлен" ;;
            esac
            ;;
        "en")
            case $1 in
                "main_menu") echo "Main Menu" ;;
                "install") echo "Install" ;;
                "manage") echo "Manage" ;;
                "remove") echo "Remove" ;;
                "exit") echo "Exit" ;;
                "requirements") echo "System Requirements:" ;;
                "cpu") echo "• CPU: 2 vCPU" ;;
                "ram") echo "• RAM: 4 GB" ;;
                "disk") echo "• Disk: 100 GB HDD or higher" ;;
                "bandwidth") echo "• Bandwidth: 400Mbps download, 800Mbps upload" ;;
                "ports") echo "• Open ports: TCP 8231, 8085, 9864; UDP 7621" ;;
                "continue") echo "Continue with installation?" ;;
                "yes_no") echo "[y/n]: " ;;
                "installing") echo "Installing PWR Validator Node..." ;;
                "updating") echo "Updating system..." ;;
                "installing_java") echo "Installing Java..." ;;
                "opening_ports") echo "Opening ports..." ;;
                "downloading") echo "Downloading validator files..." ;;
                "setup_password") echo "Setting up password..." ;;
                "enter_password") echo "Enter validator password: " ;;
                "confirm_password") echo "Confirm password: " ;;
                "passwords_dont_match") echo "Passwords don't match!" ;;
                "enter_ip") echo "Enter your server IP address: " ;;
                "starting_node") echo "Starting node..." ;;
                "installation_complete") echo "Installation completed!" ;;
                "get_address") echo "Getting validator address..." ;;
                "node_running") echo "Node is running" ;;
                "node_stopped") echo "Node is stopped" ;;
                "press_enter") echo "Press Enter to continue..." ;;
                "invalid_choice") echo "Invalid choice!" ;;
                "logs") echo "Logs" ;;
                "update") echo "Update" ;;
                "restart") echo "Restart" ;;
                "back") echo "Back" ;;
                "node_restarted") echo "Node restarted!" ;;
                "node_stopped_msg") echo "Node stopped!" ;;
                "address") echo "Validator address: " ;;
                "show_address") echo "Show Node Address" ;;
                "show_seed") echo "Show Seed Phrase" ;;
                "seed_phrase") echo "Validator Seed Phrase" ;;
                "node_address") echo "Node Address" ;;
                "remove_confirm") echo "Are you sure you want to remove PWR Validator?" ;;
                "removing") echo "Removing PWR Validator..." ;;
                "removed") echo "PWR Validator removed!" ;;
                "not_installed") echo "PWR Validator not installed" ;;
                "already_installed") echo "PWR Validator already installed" ;;
            esac
            ;;
    esac
}

# Check if validator is installed
is_validator_installed() {
    if [[ -d ~/pwr-validator ]] && [[ -f ~/pwr-validator/validator.jar ]]; then
        return 0
    else
        return 1
    fi
}

# Check if node is running
is_node_running() {
    if pgrep -f "validator.jar" > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Show system requirements
show_requirements() {
    show_yellow "$(get_text "requirements")"
    show_white "$(get_text "cpu")"
    show_white "$(get_text "ram")"
    show_white "$(get_text "disk")"
    show_white "$(get_text "bandwidth")"
    show_white "$(get_text "ports")"
    echo ""
}

# Update system
update_system() {
    show_info "$(get_text "updating")"

    # Suppress VM warnings and update system
    sudo apt update 2>/dev/null || true
    sudo apt upgrade -y 2>/dev/null || true

    show_success "Система обновлена / System updated"
}

# Install Java
install_java() {
    show_info "$(get_text "installing_java")"

    # Check if Java 21+ is already installed
    if command -v java &> /dev/null; then
        java_version=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
        if [[ "$java_version" -ge 21 ]]; then
            show_success "Java $java_version уже установлена / Java $java_version already installed"
            return 0
        else
            show_warning "Установлена Java $java_version, требуется Java 21+ / Java $java_version installed, Java 21+ required"
        fi
    fi

    # Try to install Java 21 (required for PWR Validator)
    show_info "Установка Java 21 (требуется для PWR Validator) / Installing Java 21 (required for PWR Validator)"

    if sudo apt update && sudo apt install openjdk-21-jre-headless -y 2>/dev/null; then
        show_success "Java 21 установлена / Java 21 installed"
    elif sudo apt install openjdk-17-jre-headless -y 2>/dev/null; then
        show_success "Java 17 установлена / Java 17 installed"
        show_warning "Рекомендуется Java 21 для PWR Validator / Java 21 recommended for PWR Validator"
    elif sudo apt install openjdk-11-jre-headless -y 2>/dev/null; then
        show_success "Java 11 установлена / Java 11 installed"
        show_warning "Рекомендуется Java 21 для PWR Validator / Java 21 recommended for PWR Validator"
    else
        show_error "Не удалось установить Java / Failed to install Java"
        show_warning "Попробуйте установить Java 21 вручную / Try installing Java 21 manually"
        show_info "Команда: sudo apt install openjdk-21-jre-headless / Command: sudo apt install openjdk-21-jre-headless"
        exit 1
    fi
}

# Open required ports
open_ports() {
    show_info "$(get_text "opening_ports")"

    if command -v ufw &> /dev/null; then
        sudo ufw allow 8231/tcp
        sudo ufw allow 8085/tcp
        sudo ufw allow 9864/tcp
        sudo ufw allow 7621/udp
        sudo ufw reload
    else
        sudo iptables -A INPUT -p tcp --dport 8231 -j ACCEPT
        sudo iptables -A INPUT -p tcp --dport 8085 -j ACCEPT
        sudo iptables -A INPUT -p tcp --dport 9864 -j ACCEPT
        sudo iptables -A INPUT -p udp --dport 7621 -j ACCEPT
        sudo netfilter-persistent save 2>/dev/null || true
    fi
}

# Download validator files
download_validator() {
    show_info "$(get_text "downloading")"

    mkdir -p ~/pwr-validator
    cd ~/pwr-validator

    show_info "Получение последней версии / Getting latest version..."

    # Get latest release version from GitHub API
    latest_version=$(curl -s https://api.github.com/repos/pwrlabs/PWR-Validator/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    if [[ -z "$latest_version" ]]; then
        show_error "Не удалось получить версию / Could not get version"
        show_warning "Используется версия по умолчанию / Using default version"
        latest_version="15.63.38"
    fi

    show_info "Скачивание версии $latest_version / Downloading version $latest_version"

    # Download latest validator.jar
    if wget -O validator.jar "https://github.com/pwrlabs/PWR-Validator/releases/download/$latest_version/validator.jar" 2>/dev/null; then
        show_success "validator.jar скачан (версия $latest_version) / validator.jar downloaded (version $latest_version)"
    else
        show_error "Ошибка скачивания validator.jar / Error downloading validator.jar"
        exit 1
    fi

    # Download latest config.json
    if wget -O config.json "https://github.com/pwrlabs/PWR-Validator/raw/refs/heads/main/config.json" 2>/dev/null; then
        show_success "config.json скачан / config.json downloaded"
    else
        show_warning "Ошибка скачивания config.json / Error downloading config.json"
    fi

    if [[ ! -f validator.jar ]]; then
        show_error "Ошибка загрузки validator.jar / Error downloading validator.jar"
        exit 1
    fi
}

# Setup password
setup_password() {
    show_info "$(get_text "setup_password")"

    while true; do
        read -s -p "$(show_cyan "$(get_text "enter_password")")" password
        echo ""
        read -s -p "$(show_cyan "$(get_text "confirm_password")")" password_confirm
        echo ""

        if [[ "$password" == "$password_confirm" ]]; then
            echo "$password" > password
            break
        else
            show_error "$(get_text "passwords_dont_match")"
        fi
    done
}

# Get server IP
get_server_ip() {
    show_info "Определение IPv4 адреса сервера / Detecting server IPv4 address..."

    # Try local method first (most reliable)
    local_ip=$(hostname -I 2>/dev/null | awk '{print $1}' | grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')

    if [[ -n "$local_ip" ]]; then
        server_ip="$local_ip"
        show_success "Определен локальный IPv4: $server_ip / Detected local IPv4: $server_ip"
    else
        # Fallback to external methods
        server_ip=$(curl -4 -s ifconfig.me 2>/dev/null || curl -4 -s ipinfo.io/ip 2>/dev/null || curl -4 -s icanhazip.com 2>/dev/null || curl -4 -s checkip.amazonaws.com 2>/dev/null || echo "")

        # Validate IPv4 format
        if [[ -z "$server_ip" ]] || ! [[ $server_ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
            show_error "Не удалось определить IPv4 адрес / Could not determine IPv4 address"
            show_warning "Попробуйте запустить скрипт снова / Try running the script again"
            exit 1
        else
            show_success "Определен внешний IPv4: $server_ip / Detected external IPv4: $server_ip"
        fi
    fi
}

# Start validator node
start_node() {
    show_info "$(get_text "starting_node")"
    cd ~/pwr-validator

    pkill -f "validator.jar" 2>/dev/null || true

    # Use nohup.out as per official documentation
    nohup java --enable-native-access=ALL-UNNAMED -Xms1g -Xmx6g -jar validator.jar --ip "$server_ip" --password password > nohup.out 2>&1 &
    sleep 3

    if pgrep -f "validator.jar" > /dev/null; then
        show_success "$(get_text "installation_complete")"
        show_success "$(get_text "node_running")"
    else
        show_error "Ошибка запуска ноды / Error starting node"
        exit 1
    fi
}

# Get validator address
get_validator_address() {
    show_info "$(get_text "get_address")"
    cd ~/pwr-validator

    if [[ -f validator.jar ]] && [[ -f password ]]; then
        address=$(java -jar validator.jar get-address password 2>/dev/null)
        if [[ -n "$address" ]]; then
            show_success "$(get_text "address")"
            show_cyan "$address"
        else
            show_error "Не удалось получить адрес / Could not get address"
        fi
    else
        show_error "Файлы валидатора не найдены / Validator files not found"
    fi
}

# Show node address
show_node_address() {
    show_info "$(get_text "node_address")"
    cd ~/pwr-validator

    if [[ -f validator.jar ]] && [[ -f password ]]; then
        address=$(java -jar validator.jar get-address password 2>/dev/null)
        if [[ -n "$address" ]]; then
            echo ""
            show_success "$(get_text "node_address"):"
            show_cyan "$address"
            echo ""
            show_info "Этот адрес используется для получения PWR токенов / This address is used to receive PWR tokens"
        else
            show_error "Не удалось получить адрес ноды / Could not get node address"
            show_warning "Убедитесь, что нода запущена / Make sure the node is running"
        fi
    else
        show_error "Файлы валидатора не найдены / Validator files not found"
        show_warning "Сначала установите PWR Validator / Install PWR Validator first"
    fi
}

# Show seed phrase
show_seed_phrase() {
    show_info "$(get_text "seed_phrase")"
    cd ~/pwr-validator

    if [[ -f validator.jar ]] && [[ -f password ]]; then
        seed_phrase=$(java -jar validator.jar get-seed-phrase password 2>/dev/null)
        if [[ -n "$seed_phrase" ]]; then
            echo ""
            show_success "$(get_text "seed_phrase"):"
            show_cyan "$seed_phrase"
            echo ""
            show_warning "⚠️ ВАЖНО / IMPORTANT:"
            show_white "• Сохраните эту сид-фразу в безопасном месте / Save this seed phrase in a safe place"
            show_white "• Никому не сообщайте эту информацию / Do not share this information with anyone"
            show_white "• Используйте для восстановления кошелька / Use to restore wallet"
        else
            show_error "Не удалось получить сид-фразу / Could not get seed phrase"
            show_warning "Убедитесь, что нода запущена / Make sure the node is running"
        fi
    else
        show_error "Файлы валидатора не найдены / Validator files not found"
        show_warning "Сначала установите PWR Validator / Install PWR Validator first"
    fi
}

# View logs
view_logs() {
    cd ~/pwr-validator

    if [[ -f nohup.out ]]; then
        show_info "📋 Последние 1000 строк лога (официальный метод) / Last 1000 log lines (official method):"
        show_yellow "═══════════════════════════════════════════════════════════════"
        tail -n 1000 nohup.out
        show_yellow "═══════════════════════════════════════════════════════════════"
        echo ""
        show_info "Для просмотра логов в реальном времени используйте: / For real-time log viewing use:"
        show_cyan "tail -n 1000 nohup.out -f"
    elif [[ -f validator.log ]]; then
        show_info "📋 Последние 50 строк лога / Last 50 log lines:"
        show_yellow "═══════════════════════════════════════════════════════════════"
        tail -n 50 validator.log
        show_yellow "═══════════════════════════════════════════════════════════════"
        show_warning "Используется альтернативный файл лога / Using alternative log file"
    else
        show_error "Файл лога не найден / Log file not found"
        show_info "Проверьте, запущена ли нода / Check if node is running"
    fi
}

# Restart node
restart_node() {
    show_info "🔄 $(get_text "restart")..."

    pkill -f "validator.jar" 2>/dev/null || true
    sleep 2

    cd ~/pwr-validator
    if [[ -f validator.jar ]] && [[ -f password ]]; then
        # Auto-detect IPv4 for restart (local method first)
        local_ip=$(hostname -I 2>/dev/null | awk '{print $1}' | grep -E '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$')

        if [[ -n "$local_ip" ]]; then
            server_ip="$local_ip"
        else
            # Fallback to external methods
            server_ip=$(curl -4 -s ifconfig.me 2>/dev/null || curl -4 -s ipinfo.io/ip 2>/dev/null || curl -4 -s icanhazip.com 2>/dev/null || curl -4 -s checkip.amazonaws.com 2>/dev/null || echo "")

            # Validate IPv4 format
            if [[ -z "$server_ip" ]] || ! [[ $server_ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
                show_error "Не удалось определить IPv4 адрес / Could not determine IPv4 address"
                return 1
            fi
        fi

        nohup java --enable-native-access=ALL-UNNAMED -Xms1g -Xmx6g -jar validator.jar --ip "$server_ip" --password password > nohup.out 2>&1 &
        sleep 3

        if pgrep -f "validator.jar" > /dev/null; then
            show_success "$(get_text "node_restarted")"
        else
            show_error "Ошибка перезапуска ноды / Error restarting node"
        fi
    else
        show_error "Файлы валидатора не найдены / Validator files not found"
    fi
}

# Update validator
update_validator() {
    show_info "🔄 $(get_text "update")..."

    # Check if validator is installed first
    if ! is_validator_installed; then
        show_error "Валидатор не установлен / Validator not installed"
        return 1
    fi

    cd ~/pwr-validator
    sudo pkill java
    sleep 5
    sudo pkill -9 java
    sudo rm -rf validator.jar config.json nohup.out

    show_info "Получение последней версии / Getting latest version..."

    # Get latest release version from GitHub API
    latest_version=$(curl -s https://api.github.com/repos/pwrlabs/PWR-Validator/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    if [[ -z "$latest_version" ]]; then
        show_error "Не удалось получить версию / Could not get version"
        show_warning "Используется версия по умолчанию / Using default version"
        latest_version="15.63.38"
    fi

    show_info "Скачивание версии $latest_version / Downloading version $latest_version"

    # Download latest validator.jar
    if wget -O validator.jar "https://github.com/pwrlabs/PWR-Validator/releases/download/$latest_version/validator.jar" 2>/dev/null; then
        show_success "validator.jar обновлен до версии $latest_version / validator.jar updated to version $latest_version"
    else
        show_error "Ошибка скачивания validator.jar / Error downloading validator.jar"
        return 1
    fi

    # Download latest config.json
    if wget -O config.json "https://github.com/pwrlabs/PWR-Validator/raw/refs/heads/main/config.json" 2>/dev/null; then
        show_success "config.json обновлен / config.json updated"
    else
        show_warning "Ошибка скачивания config.json / Error downloading config.json"
    fi

    show_success "Валидатор обновлен до версии $latest_version! / Validator updated to version $latest_version!"
    show_warning "Перезапустите ноду для применения обновлений / Restart node to apply updates"
}

# Remove validator
remove_validator() {
    show_warning "⚠️ $(get_text "remove_confirm")"
    read -p "$(show_cyan "$(get_text "yes_no")")" confirm_remove

    if [[ $confirm_remove =~ ^[Yy]$ ]]; then
        show_info "$(get_text "removing")"

        # Stop node
        pkill -f "validator.jar" 2>/dev/null || true

        # Remove files
        rm -rf ~/pwr-validator
        rm -f ~/.pwr_ip

        show_success "$(get_text "removed")"
    else
        show_warning "Удаление отменено / Removal cancelled"
    fi
}

# Main installation function
main_installation() {
    if is_validator_installed; then
        show_warning "$(get_text "already_installed")"
        read -p "$(show_cyan "$(get_text "press_enter")")"
        return
    fi

    show_requirements
    read -p "$(show_cyan "$(get_text "continue") $(get_text "yes_no")")" continue_install

    if [[ ! $continue_install =~ ^[Yy]$ ]]; then
        show_warning "Установка отменена / Installation cancelled"
        return
    fi

    show_info "$(get_text "installing")"

    update_system
    install_java
    open_ports
    download_validator
    setup_password
    get_server_ip
    start_node

    echo ""
    get_validator_address
    echo ""
    show_warning "Важно / Important:"
    show_white "• Нода синхронизируется с блокчейном / Node is syncing with blockchain"
    show_white "• Для получения PWR токенов обратитесь в Discord / For PWR tokens contact Discord"
    show_white "• После получения токенов нода автоматически станет валидатором / After getting tokens node will become validator"
    echo ""

    read -p "$(show_cyan "$(get_text "press_enter")")"
}

# Management menu
show_management_menu() {
    while true; do
        show_logo
        show_green "$(get_text "manage")"
        echo ""
        show_white "1) $(get_text "logs")"
        show_white "2) $(get_text "update")"
        show_white "3) $(get_text "restart")"
        show_white "4) $(get_text "show_address")"
        show_white "5) $(get_text "show_seed")"
        show_white "0) $(get_text "back")"
        echo ""

        read -p "$(show_cyan "Выбор / Choice [0-5]: ")" choice

        case $choice in
            1)
                view_logs
                echo ""
                read -p "$(show_yellow "$(get_text "press_enter")")"
                ;;
            2)
                update_validator
                echo ""
                read -p "$(show_yellow "$(get_text "press_enter")")"
                ;;
            3)
                restart_node
                echo ""
                read -p "$(show_yellow "$(get_text "press_enter")")"
                ;;
            4)
                show_node_address
                echo ""
                read -p "$(show_yellow "$(get_text "press_enter")")"
                ;;
            5)
                show_seed_phrase
                echo ""
                read -p "$(show_yellow "$(get_text "press_enter")")"
                ;;
            0)
                return
                ;;
            *)
                show_error "$(get_text "invalid_choice")"
                sleep 2
                ;;
        esac
    done
}

# Main menu
show_main_menu() {
    while true; do
        show_logo
        show_green "$(get_text "main_menu")"
        echo ""
        show_white "1) 🚀 $(get_text "install")"
        show_white "2) ⚙️ $(get_text "manage")"
        show_white "3) 🗑️ $(get_text "remove")"
        show_white "0) ❌ $(get_text "exit")"
        echo ""

        read -p "$(show_cyan "Выбор / Choice [0-3]: ")" choice

        case $choice in
            1)
                main_installation
                ;;
            2)
            if is_validator_installed; then
                show_management_menu
            else
                show_error "$(get_text "not_installed")"
                read -p "$(show_cyan "$(get_text "press_enter")")"
            fi
                ;;
            3)
                if is_validator_installed; then
                    remove_validator
                    read -p "$(show_cyan "$(get_text "press_enter")")"
                else
                    show_error "$(get_text "not_installed")"
                    read -p "$(show_cyan "$(get_text "press_enter")")"
                fi
                ;;
            0)
                show_success "До свидания! / Goodbye!"
                exit 0
                ;;
            *)
                show_error "$(get_text "invalid_choice")"
                sleep 2
                ;;
        esac
    done
}

# Main function
main() {
    select_language
    show_main_menu
}

# Run main function
main "$@"
