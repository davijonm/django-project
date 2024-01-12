# Use a imagem base do Python
FROM python:3.11

# Configuração do diretório de trabalho
WORKDIR /mnt/code

# Copie os arquivos de requisitos para o contêiner
COPY requirements.txt .

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código-fonte do Django para o contêiner
COPY processing ./processing

# Executar o servidor na inicialização do container e aguardar 3s para o db inicializar antes
CMD ["sh", "-c", "sleep 3 && python manage.py runserver 0.0.0.0:8000"]
