# 🚀 PWR Chain Validator - Simple Management Script

## Назначение / Purpose

Простой скрипт для установки и управления PWR Chain Validator Node с поддержкой русского и английского языков.

Simple script for installing and managing PWR Chain Validator Node with Russian and English language support.

### 🚀 Быстрый запуск / Quick Launch
```bash
bash <(curl -s https://raw.githubusercontent.com/st567/pwr-Chain/master/pwr_validator.sh)
```

---

## 💻 Требования к ноде / Node Requirements

| Компонент / Component | Требование / Requirement |
|----------------------|-------------------------|
| **CPU** | 2 vCPU |
| **RAM** | 4 GB |
| **Диск / Disk** | 100 GB HDD или больше / or higher |
| **Пропускная способность / Bandwidth** | 400Mbps загрузка / download, 800Mbps выгрузка / upload |
| **ОС / OS** | Ubuntu 18.04+, Debian 10+, CentOS 7+ |

### Открытые порты / Open Ports

| Порт / Port | Протокол / Protocol | Назначение / Purpose |
|-------------|-------------------|---------------------|
| 8231 | TCP | PWR Chain P2P |
| 8085 | TCP | RPC API |
| 9864 | TCP | WebSocket |
| 7621 | UDP | Discovery |

---

## 🌐 Социальные сети проекта / Project Social Media

### PWR Chain
- **Website**: [pwrlabs.io](https://www.pwrlabs.io/)
- **Discord**: [PWR Chain Official Server](https://discord.com/invite/YASmBk9EME)

---

## 🎛 Меню / Menu Structure

### Главное меню / Main Menu
1. **🚀 Установка / Install** - Полная установка PWR Validator Node
2. **⚙️ Управление / Manage** - Управление установленной нодой
3. **🗑️ Удаление / Remove** - Удаление PWR Validator
4. **❌ Выход / Exit** - Завершение работы

### Меню управления / Management Menu
1. **📋 Логи / Logs** - Просмотр логов ноды (официальный метод)
2. **🔄 Обновление / Update** - Обновление валидатора
3. **🔄 Перезапуск / Restart** - Перезапуск ноды
4. **📍 Показать адрес ноды / Show Node Address** - Получение адреса валидатора
5. **🔑 Показать сид-фразу / Show Seed Phrase** - Получение сид-фразы валидатора
6. **📥 Импорт кошелька / Import Wallet** - Импорт кошелька из сид-фразы
7. **⬅️ Назад / Back** - Возврат в главное меню

---

---

## 💾 Важные файлы / Important Files

### Бэкап критически важных файлов / Backup Critical Files

**⚠️ ВАЖНО / IMPORTANT**: После установки обязательно сохраните следующие файлы в безопасном месте:

**Important files to backup after installation:**

```bash
# Файлы находятся в / Files located in:
~/pwr-validator/

# Критически важные файлы / Critical files:
~/pwr-validator/wallet    # Кошелек валидатора / Validator wallet
~/pwr-validator/password  # Пароль валидатора / Validator password

# Получение сид-фразы / Getting seed phrase:
cd ~/pwr-validator && java -jar validator.jar get-seed-phrase password

# Импорт кошелька из сид-фразы / Import wallet from seed phrase:
cd ~/pwr-validator && java -jar validator.jar import-seed-phrase password "your_seed_phrase_here"
```
---

## 🔄 Восстановление кошелька / Wallet Recovery

### Импорт существующего кошелька / Import Existing Wallet

Если у вас есть сид-фраза от существующего кошелька PWR, вы можете импортировать его:

1. **Через меню управления:**
   - Запустите скрипт: `bash pwr_validator.sh`
   - Выберите "2) ⚙️ Управление / Manage"
   - Выберите "6) 📥 Импорт кошелька / Import Wallet"
   - Введите вашу сид-фразу

2. **Вручную через командную строку:**
   ```bash
   cd ~/pwr-validator
   java -jar validator.jar import-seed-phrase password "your_seed_phrase_here"
   ```

### ⚠️ Важные предупреждения / Important Warnings

- **Остановите ноду** перед импортом кошелька
- **Сохраните текущую сид-фразу** перед импортом (если нужно)
- Импорт **заменит** текущий кошелек
- После импорта **перезапустите ноду**

---

## 🔧 Устранение неполадок / Troubleshooting

### Проблемы с установкой / Installation Issues

#### Java не установлена / Java not installed
```bash
# Установка Java 21 (требуется для PWR Validator)
sudo apt install openjdk-21-jre-headless -y

# Альтернативные версии Java
sudo apt install openjdk-17-jre-headless -y
sudo apt install openjdk-11-jre-headless -y
```

#### Проблемы с портами / Port Issues
```bash
# Для UFW
sudo ufw allow 8231/tcp
sudo ufw allow 8085/tcp
sudo ufw allow 9864/tcp
sudo ufw allow 7621/udp
sudo ufw reload

# Для iptables
sudo iptables -A INPUT -p tcp --dport 8231 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8085 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 9864 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 7621 -j ACCEPT
sudo netfilter-persistent save
```

### Проблемы с нодой / Node Issues

#### Нода не запускается / Node won't start
```bash
# Проверьте логи (официальный метод PWR Chain)
tail -n 1000 ~/pwr-validator/nohup.out -f

# Альтернативный способ просмотра логов
tail -f ~/pwr-validator/validator.log

# Проверьте Java
java -version

# Перезапустите ноду через меню управления
```

#### Нода не синхронизируется / Node not syncing
```bash
# Проверьте подключение к сети
ping google.com

# Проверьте внешний IP
curl ifconfig.me

# Перезапустите ноду
```

---

## 📞 Поддержка / Support

### Получение помощи / Getting Help

1. **Discord**: Присоединитесь к официальному Discord серверу PWR Chain
2. **Документация**: Изучите официальную документацию PWR Chain

### Логи и диагностика / Logs and Diagnostics

```bash
# Основные логи (официальный метод PWR Chain)
tail -n 1000 ~/pwr-validator/nohup.out -f

# Альтернативный способ просмотра логов
tail -f ~/pwr-validator/validator.log

# Проверка процессов
ps aux | grep validator

# Получение адреса валидатора
cd ~/pwr-validator && java -jar validator.jar get-address password
```

---


**Создано командой CryptoCompass / Created by CryptoCompass Team**

*Версия / Version: 1.0.0*

---

## 🏆 CryptoCompass

### О нас / About Us

CryptoCompass - ваш проводник в мире криптовалют. Мы создаем простые и удобные инструменты для работы с блокчейн-нодами.

CryptoCompass - your guide in the world of cryptocurrencies. We create simple and convenient tools for working with blockchain nodes.

### 🌐 Наши социальные сети / Our Social Media

- **Twitter/X**: [@0xGreenFlag](https://x.com/0xGreenFlag) - Новости и обновления
- **YouTube**: [@beloglazovpro](https://www.youtube.com/@beloglazovpro) - Обучающие видео и гайды
- **Telegram**: [@beloglazovpro](https://t.me/beloglazovpro) - Канал CryptoCompass с эксклюзивным контентом

[![GitHub](https://img.shields.io/badge/GitHub-st567%2Fpwr--Chain-blue?style=flat-square&logo=github)](https://github.com/st567/pwr-Chain)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange?style=flat-square)](https://github.com/st567/pwr-Chain/releases)
