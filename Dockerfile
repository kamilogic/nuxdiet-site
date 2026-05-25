# ─────────────────────────────────────────────────────────
# Dockerfile — NuxDiet Site Estático
# ─────────────────────────────────────────────────────────
#
# Usa nginx:alpine como base — imagem leve (~8MB) e segura
# para servir arquivos estáticos em produção.
#
# Fluxo:
#   1. Parte da imagem oficial do nginx com Alpine Linux
#   2. Remove a página padrão do nginx
#   3. Copia os arquivos do site para o diretório público do nginx
#   4. Expõe a porta 80 para acesso HTTP
#   5. Inicia o nginx em modo foreground (necessário para Docker)
# ─────────────────────────────────────────────────────────

FROM nginx:alpine

LABEL maintainer="Leonardo Becker"
LABEL project="nuxdiet-site"
LABEL description="Site estático do NuxDiet servido via nginx"

# Remove o conteúdo padrão do nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia os arquivos do site para o diretório público do nginx
COPY src/ /usr/share/nginx/html/

# Copia configuração customizada do nginx (cache e compressão)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Porta que o nginx vai escutar
EXPOSE 80

# Inicia o nginx em foreground (padrão para containers Docker)
CMD ["nginx", "-g", "daemon off;"]
