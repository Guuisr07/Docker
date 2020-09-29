# Para definir qual versao e de qual maquina vamos usar os recuros
# Node, na sua ultima versao. Alpine para usar uma maquina com apena o node e que seja extremamente leve
FROM node:alpine   

#Para mostrar em qual diretorio o docker ira trabalhar na maquina do docker
WORKDIR /usr/src/app

#Copy serve para copiar os que tenha o package.json para poder rodar o npm install e inciar a aplicacao 
COPY package*.json ./
RUN npm install

#Para enviar todos os arquivos para a maquina, depois que ja rodou o npm install
#Devemos ignorar a pasta de arquivos node_modules que ja foi criada, para isso deve criar o arquivo chamado .dockerignore
COPY . .

#Para indicar qual porta do servidor dentro do docker precisa ser exposta para conseguir acessar no computador
EXPOSE 3000

#O CMD serve para passar qual o comando que o servidor deve rodar para aplicacao entrar no ar
CMD ["npm","start"]

#Para criar o container e preciso o docker build -t [NOME DA MAQUINA/CONTAINER] . [PONTO PARA REFERENCIAR AONDE ESTA O DOCKERFILE]
