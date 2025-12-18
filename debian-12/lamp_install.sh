echo "=== [1/9] Atualizando repositórios ===" 
apt update &>/dev/null

echo "=== [2/9] Atualizando pacotes do sistema ==="
apt upgrade -y &>/dev/null

echo "=== [3/9] Instalando Apache ==="
apt install apache2 &>/dev/null

echo "=== [4/9] Instalando MariaDB ==="
apt install mariadb-server -y &>/dev/null

echo "=== [5/9] Inicializando PHP ==="
apt install php libapache2-mod-php php-mysql php-cli php-fpm -y &>/dev/null

echo "=== [6/9] Inicializando serviços Apache, MariaDB e PHP ==="
systemctl enable apache2 mariadb php &>/dev/null

echo "=== [7/9] Iniciando serviços Apache, MariaDB e PHP ==="
systemctl start apache2 mariadb php &>/dev/null

echo "<?php" > /var/www/html/info.php &>/dev/null
echo "phpinfo();" >> /var/www/html/info.php &>/dev/null
echo "?>" >> /var/www/html/info.php &>/dev/null

echo "=== [8/9] Reiniciando serviços Apache, MariaDB e PHP ==="
systemctl restart apache2 mariadb php

echo "=== [9/9] Configurando Firewall para permitir tráfego HTTP ==="
firewall-cmd --permanent --add-port80/tcp &>/dev/null
firewall-cmd --reload &>/dev/null

echo "=== Instalação do LAMP concluída! ==="
echo "Acesse a página de informações do PHP em http://SEU_IP/info.php"
