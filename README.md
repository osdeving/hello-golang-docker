# Docker multi-stage build

Demonstração de multi-stage build no Docker.

## Como funciona!?

Podemos usar uma imagem, tal como o ubuntu e instalar todas as dependências necessárias nessa imagem.

Com as dependências instaladas (p.ex.: apt install build-essentials se for linguagem C), podemos compilar ou gerar nossos executáveis.

Uma vez que os executáveis foram gerados, usamos uma imagem mais enxuta e colocamos nela apenas o executável que foi gerado na imagem anterior.

## Exemplo de multi-stage build e Golang

Neste exemplo usamos a imagem golang, pois a mesma não precisa instalar dependências. (se fosse ubuntu, teríamos que instalar o golang).

Nesta imagem geramos o executável

```go build hello.go```

Com o executável gerado, usamos uma imagem menor (a imagem scratch tem apenas 1.75MB) e nela incluimos o executável.

Dessa forma, podemos entregar uma imagem com apenas 1.75MB em vez 964MB da imagem do golang. A diferença é brutal hahaha

## Como testar

Inicialmente rode o comando

```docker run --rm osdeving/mygolang:prod```

Deverá aparecer "Fullcycle Rocks!!!" no terminal.

Uma vez testado, podemos fazer passo-a-passo.

Primeiramente estude o arquivo Dockerfile, repare que é copiado do sistema de arquivos local o arquivo hello.go para dentro da imagem. Logo, teremos que editar esse arquivo na máquina local.

Segundo, estude o arquivo Dockerfile.prod, aqui é onde temos uma imagem construída por estágios.
