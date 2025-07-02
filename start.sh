#!/bin/bash

# Скрипт для запуска локального сервера

echo "🚀 Запуск сайта GLONECT..."
echo "📁 Директория: $(pwd)"
echo ""

# Определяем IP адрес WSL
WSL_IP=$(hostname -I | awk '{print $1}')
echo "🌐 WSL IP: $WSL_IP"

# Запускаем Python HTTP сервер
echo "🔧 Запуск HTTP сервера на порту 8000..."
python3 -m http.server 8000 &
SERVER_PID=$!

echo ""
echo "✅ Сервер запущен!"
echo ""
echo "📌 Доступ к сайту:"
echo "   • Из WSL: http://localhost:8000"
echo "   • Из Windows: http://localhost:8000"
echo "   • По IP WSL: http://$WSL_IP:8000"
echo ""
echo "💡 Для остановки сервера нажмите Ctrl+C"
echo ""

# Ждем нажатия Ctrl+C
trap "echo ''; echo '🛑 Остановка сервера...'; kill $SERVER_PID 2>/dev/null; exit" INT
wait $SERVER_PID