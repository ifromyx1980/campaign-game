#!/bin/bash
# 双击启动网页版游戏
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
PORT=8800
echo "启动游戏服务器… 端口 $PORT"
python3 -m http.server $PORT >/dev/null 2>&1 &
SRV=$!
sleep 1
open "http://localhost:$PORT/"
echo "游戏已在浏览器打开：http://localhost:$PORT/"
echo "关闭此窗口或按 Ctrl+C 可停止服务器。"
trap "kill $SRV 2>/dev/null" EXIT
wait $SRV
