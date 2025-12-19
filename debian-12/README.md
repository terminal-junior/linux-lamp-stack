
#  🐧 Guia de Instalação LAMP no Debian 12 
---

## O que é LAMP?

### LAMP é um acrônimo que representa uma pilha de software comum para servidores web:

   **Linux** (sistema operacional) \
   **Apache** (servidor web) \
   **MariaDB** (banco de dados) \
   **PHP** (linguagem de programação)

### Este guia irá ajudá-lo(a) a instalar cada componente passo a passo, explicando o que cada comando faz.

**Pré-requisitos**

   Uma instalação limpa do Debian 12 \
   Acesso de administrador (sudo/root) \
   Conexão com a internet \
   Acesse usando o comando: 
   ```bash
   sudo su
   ```
   ou
   ```bash
   sudo -i
   ```

## Passo 1: Atualizando repositórios

```bash
apt update

```

**O que isso faz:**

   **apt update**: Atualiza a lista de pacotes disponíveis nos repositórios configurados \
   Importante: Sempre execute este comando antes de instalar qualquer pacote para garantir que você tenha as versões mais recentes disponíveis

## Passo 2: Atualizando pacotes do sistema

```bash
apt upgrade -y

```
**O que isso faz:**

   **apt upgrade**: Atualiza todos os pacotes instalados para suas versões mais recentes \
   **-y**: Responde automaticamente "sim" a qualquer pergunta de confirmação \
   É como atualizar aplicativos no seu celular - mantém seu sistema seguro e estável

## Passo 3: Instalando Apache
```bash
apt install apache2 -y

```

**O que isso faz:**

   Instala o servidor web Apache (versão 2) \
   Apache é o software que responde às requisições de navegadores web \
   É como instalar um "atendente" que entrega páginas web quando alguém visita seu site \

## Passo 4: Instalando MariaDB
```bash
apt install mariadb-server -y 

```

**O que isso faz:**

   Instala o MariaDB, um sistema de gerenciamento de banco de dados \
   MariaDB é um "primo" do MySQL, mantendo compatibilidade \
   É como instalar um arquivo digital onde você pode armazenar dados do seu site (usuários, posts, etc.)

## Passo 5: Instalando PHP
```bash
apt install php libapache2-mod-php php-mysql php-cli php-fpm -y

```

**O que isso faz:**

   **php:** Instala o interpretador PHP principal \
   **libapache2-mod-php:** Conecta o PHP com o Apache \
   **php-mysql:** Permite que o PHP converse com o MariaDB \
   **php-cli:** Permite executar PHP pela linha de comando \
   **php-fpm:** Processador FastCGI para melhor performance \
   PHP é a "linguagem" que cria páginas web dinâmicas

## Passo 6: Habilitando serviços na inicialização

```bash
systemctl enable apache2 mariadb php

```

**O que isso faz:**

   **systemctl enable:** Configura os serviços para iniciarem automaticamente quando o sistema ligar \
   **apache2, mariadb, php:** Os três serviços que queremos que iniciem automaticamente \
   Imagine como configurar programas para abrirem quando você liga o computador

## Passo 7: Iniciando os serviços

```bash
systemctl start apache2 mariadb php

```

**O que isso faz:**

   **systemctl start:** Inicia os serviços imediatamente \
   Agora o Apache, MariaDB e PHP estão rodando no seu servidor \
   É como clicar no ícone de um programa para executá-lo

### Passo 7.1: Criando página de teste PHP

```bash
echo "<?php" > /var/www/html/info.php
echo "phpinfo();" >> /var/www/html/info.php
echo "?>" >> /var/www/html/info.php

```

**O que isso faz:**

   Cria um arquivo chamado info.php no diretório web padrão \
   **>:** Cria um novo arquivo (sobrescreve se existir) \
   **>>:** Adiciona conteúdo ao final do arquivo existente \
   O arquivo contém código PHP que mostra informações sobre a instalação \
   **/var/www/html/** é onde o Apache procura por páginas web

## Passo 8: Reiniciando serviços

```bash
systemctl restart apache2 mariadb php

```

**O que isso faz:**

   systemctl restart: Reinicia os serviços \
   Garante que todas as configurações recentes sejam carregadas \
   Útil após instalar novos módulos ou fazer mudanças importantes

## Passo 9: Instalando firewall

```bash
apt install firewalld -y

```

**O que isso faz:**

  Instala um firewall, para melhor segurança e proteção do sistema \
  Recomendo o uso de firewall

## Passo 9.1: Configurando firewall

```bash
firewall-cmd --permanent --add-port80/tcp 
firewall-cmd --reload

```

**O que isso faz:**

   **firewall-cmd**: Gerencia regras de firewall \
   **--permanent**: A regra persiste após reinicialização \
   **--add-port80/tcp**: Permite tráfego na porta 80 (HTTP) \
   **--reload**: Aplica as mudanças sem reiniciar o firewall
   
### Verificação da instalação
**Teste o Apache:**

   Abra um navegador web \
   Digite: http://endereço-ip-do-seu-servidor \
   Você deve ver a página padrão do Apache

**Teste o PHP:**

   Abra um navegador web \
   Digite: http://endereço-ip-do-seu-servidor/info.php \
   Você deve ver uma página com todas as informações da instalação PHP

---

# Extras (Opcional)

 ## 10: Teste o MariaDB:

```bash
sudo mysql --version

```

Isso deve mostrar a versão instalada do MariaDB.

## 11: Remover página info.php (por segurança):


```bash
sudo rm /var/www/html/info.php
```

 ## 12: Instalar phpMyAdmin (Interface Web para MariaDB para gerenciar bancos visualmente):


```bash
sudo apt install phpmyadmin -y

```

   Configurar seu próprio site: \
   Coloque seus arquivos em /var/www/html/ \
   Ou configure um Virtual Host personalizado \
   Configurar SSL com Let's Encrypt para HTTPS

## 13: Dicas para iniciantes

   Backup sempre: Antes de fazer mudanças, faça backups \
   Teste em ambiente seguro: Use uma máquina virtual para praticar \
   Documente: Anote todas as mudanças que fizer \
   Atualize regularmente: Execute apt update && apt upgrade periodicamente \
   Monitore logs: Use tail -f /var/log/apache2/error.log para ver erros em tempo real

---

## Sua instalação LAMP está pronta! Agora você pode começar a desenvolver aplicações web no seu servidor Debian 12.

---
