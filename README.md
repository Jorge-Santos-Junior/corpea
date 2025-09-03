Tutorial: Desenvolvendo uma Aplicação Web de Busca com BaseX e XQuery

Projeto: Corpus de Escrita Acadêmica (CorpEA)

Este tutorial detalha a construção da aplicação web CorpEA, uma ferramenta de busca em um corpus de textos acadêmicos. O objetivo é demonstrar, de forma prática, como tecnologias como HTML, CSS e XQuery podem ser combinadas na plataforma BaseX para criar uma aplicação web dinâmica e funcional a partir de um banco de dados em XML.

1. A Interface do Usuário (Frontend)

A interface é a parte da aplicação com a qual o usuário interage diretamente. Ela é construída com HTML (para a estrutura) e CSS (para o estilo visual).

1.1. Estrutura das Páginas (HTML)

As páginas da nossa aplicação são geradas dinamicamente pelas funções XQuery. Todas elas seguem uma estrutura HTML básica:

HTML


<html>
    <head>
        <title>Busca no CorpEA</title>
        <meta charset="utf-8"/>
        
        <link href="/static/style-7.css" rel="stylesheet"/>
    </head>
    <body>
        <h1 style="text-align: center;">Corpus de Escrita Acadêmica - CorpEA</h1>

        <nav class="header-nav">
            <a href="/utilizacao" class="nav-button">Como utilizar o CorpEA</a>
            </nav>
        
        <div class="main-container">
            <div class="content">
                </div>
        </div>   

        <footer>
            </footer>
    </body>
</html>

    • <head>: Contém metadados importantes, como o título da página (<title>) e o link para o nosso arquivo de estilos (<link>), que define a aparência da página.

    • <body>: Contém todo o conteúdo visível da página, como o título principal (<h1>), a barra de navegação (

<nav>), o contêiner principal (

<div>) e o rodapé (

<footer>).


1.2. O Formulário de Busca

O coração da página inicial é o formulário (<form>). É através dele que o usuário envia os critérios de pesquisa para o servidor.

    • <form method="get" action="/busca">: Define que os dados serão enviados via método GET (ou seja, os parâmetros aparecerão na URL) para o caminho /busca do servidor.

    • <input type="text" name="palavra" ...>: Cria um campo de texto para a busca por palavra-chave. O atributo
name="palavra" é crucial, pois é o nome que o XQuery usará para recuperar o valor digitado.

    • <input type="radio" name="universidade" ...>: Cria botões de rádio. O usuário só pode selecionar uma opção por grupo com o mesmo
name.

    • <button type="submit" ...>: O botão que, ao ser clicado, envia os dados do formulário para a ação definida (/busca).


1.3. Estilo e Aparência (CSS)

O arquivo style-7.css é responsável por toda a aparência da aplicação. Ele seleciona elementos HTML (como h1, body) ou classes (como .nav-button, .content) e aplica regras de estilo.
    • Layout: display: flex; é usado na barra de navegação para alinhar os botões horizontalmente.

    • Cores e Fontes: background-color, color, e font-family definem a paleta de cores e a tipografia da aplicação.
    • Interatividade: A pseudo-classe :hover é usada para mudar a cor de fundo de um botão quando o mouse passa por cima, dando um feedback visual ao usuário.
    • Destaque da Busca: A regra mais importante para nossa funcionalidade de busca é:
CSS
b {
    color: black;
    background-color: yellow;
}

Esta regra simples define que qualquer texto dentro de uma tag <b> terá um fundo amarelo, criando o efeito de destaque.

2. A Lógica do Servidor (Backend com XQuery)

O backend é onde a "mágica" acontece. As funções XQuery, anotadas com a sintaxe RESTXQ, recebem as requisições do navegador, processam os dados do banco XML e geram as páginas HTML como resposta. O arquivo corpea7-1-Doug.xqm contém toda essa lógica.

2.1. Funções de Páginas Estáticas

Funções como page:start, page:utilizacao, page:projeto e page:metodologia são as mais simples. Elas apenas retornam um bloco de HTML fixo para renderizar as páginas informativas.

    • declare %rest:GET: Indica que a função responde a requisições HTTP do tipo GET.
    • declare %rest:path('/'): Define o caminho da URL que aciona esta função. / é a página inicial.
    • declare %output:method('xhtml'): Instrui o BaseX a renderizar o resultado como um documento XHTML, garantindo a formatação correta no navegador.

2.2. A Função Principal de Busca: page:busca

Esta é a função mais complexa e central da aplicação. Vamos detalhar sua estrutura:
Declaração da Função:

XQuery


declare
  %rest:GET
  %rest:path('/busca')
  %output:method('xhtml')
  %rest:query-param("palavra", "{$palavra}", "")
  %rest:query-param("universidade", "{$universidade}")
  ...
function page:busca($palavra as xs:string, $universidade as xs:string*, ...)

    • %rest:query-param(...): Cada uma dessas anotações declara um parâmetro que a função espera receber da URL (enviado pelo formulário). Por exemplo, %rest:query-param("palavra", "{$palavra}", "") pega o valor do parâmetro palavra da URL e o armazena na variável XQuery $palavra. Se o parâmetro não existir, ele usa um valor padrão (neste caso, uma string vazia).
    • function page:busca(...): A assinatura da função lista todas as variáveis que receberão os parâmetros, com seus tipos de dados definidos (ex: xs:string, xs:string* para múltiplos valores).
Lógica Interna da Função:
    1. Carregando os Dados:
XQuery
let $db := fn:doc("ea6.xml")

A primeira coisa que a função faz é carregar o banco de dados ea6.xml na memória, atribuindo-o à variável $db. A let é usada para declarar e atribuir uma variável.
    2. Coletando os Resultados (let $resultados := ...):
XQuery
let $resultados :=
  for $e in $db//universidade
  let $textoBusca := $e/(p1-r1, ...)
  where
    (string-length($palavra) = 0 or $textoBusca/text() contains text {$palavra})
    and (empty($universidade) or $e/@uni = $universidade)
    ...
  return $e

        ◦ for $e in $db//universidade: Inicia um loop, iterando sobre cada elemento <universidade> encontrado no banco de dados. Cada elemento é temporariamente atribuído à variável $e.
        ◦ where: Esta é a cláusula de filtragem. Ela contém uma série de condições que um elemento $e deve satisfazer para ser incluído nos resultados. As condições são unidas por and.
            ▪ (empty($universidade) or $e/@uni = $universidade): Esta é uma condição padrão para filtros opcionais. Se a variável $universidade estiver vazia (o usuário não selecionou nada), a condição é verdadeira. Caso contrário, ela verifica se o atributo @uni do elemento atual $e é igual ao valor selecionado pelo usuário.
            ▪ (string-length($palavra) = 0 or $textoBusca/text() contains text {$palavra}): Lida com a busca por palavra. Se nenhuma palavra foi digitada, a condição é verdadeira. Caso contrário, ela usa a função contains text para realizar uma busca de texto completo.
        ◦ return $e: Se um elemento $e passar por todas as condições da cláusula where, ele é retornado e adicionado ao conjunto de resultados na variável $resultados.
    3. Realizando as Contagens (let $totalRespostas := ... e let $totalOcorrencias := ...):
XQuery
let $totalRespostas := count($resultados)
let $totalOcorrencias :=
  if (string-length($palavra) > 0) then
    sum(
      for $r in $resultados
      return ft:count(...)
    )
  else ()

        ◦ count($resultados): A função count() simplesmente conta quantos elementos estão na sequência $resultados.
        ◦ if...then...else: Esta é uma estrutura condicional.
            ▪ if (string-length($palavra) > 0): A contagem de ocorrências só é executada se o usuário realmente digitou uma palavra.
            ▪ then sum(...): Se a condição for verdadeira, a função sum() é usada para somar os resultados de um novo loop for.
            ▪ Este loop interno usa a função ft:count() para contar as ocorrências da palavra em cada um dos resultados.
    4. Gerando o HTML de Resposta (return <html>...):
Esta é a parte final. A função constrói a página HTML que será enviada de volta ao navegador.
        ◦ As variáveis $totalRespostas e $totalOcorrencias são inseridas diretamente no HTML usando expressões entre chaves {...}.
        ◦ Um último loop for $e in $resultados é usado para iterar sobre os resultados já filtrados e exibir cada um deles.
        ◦ Dentro deste loop, a função ft:mark($e/p1-r1[...], "b") é usada. Como vimos, ela encontra a palavra pesquisada e a envolve com a tag
<b>, permitindo que o CSS a destaque em amarelo.

2.3. Exibindo os Resultados (A Cláusula return)

Depois que a aplicação coletou os dados na variável $resultados e calculou as contagens, a etapa final da função page:busca é gerar o código HTML que será enviado ao navegador.
Esta seção do código itera sobre a variável $resultados, que contém apenas as entradas que já passaram por todos os filtros. Para cada entrada, ela constrói um item de lista <li> com as informações relevantes.
A lógica de exibição é dividida em dois cenários principais usando uma grande estrutura if...then...else.

Cenário A: Usuário Selecionou uma Pergunta Específica

Este bloco é executado se a variável $pergunta não estiver vazia, ou seja, o usuário clicou em um dos botões de rádio das perguntas.
Código:

XQuery


if (not(empty($pergunta))) then
    (
        if ($pergunta = "p1-r1") then <li>...</li> else (),
        if ($pergunta = "p1-r2") then <li>...</li> else (),
        ...
    )

Explicação da Lógica:
    • if (not(empty($pergunta))) then: Esta é a condição principal. A função empty() verifica se uma sequência está vazia. A função not() inverte o resultado. Portanto, not(empty($pergunta)) é verdadeiro se a variável $pergunta contiver algum valor.
    • if ($pergunta = "p1-r1") then <li>...</li> else (): Dentro do bloco principal, temos uma série de testes. Cada um verifica se o valor de $pergunta corresponde a um ID de pergunta específico (ex: "p1-r1").
        ◦ then: Se a condição for verdadeira, ele gera o <li> (item de lista) correspondente àquela pergunta, exibindo o texto da pergunta, a resposta do acadêmico, o nome do acadêmico e o link para o manuscrito.
        ◦ else (): Esta é uma construção muito comum em XQuery. Se a condição for falsa, ele retorna (), que é uma sequência vazia. Isso significa que "não faça nada" ou "não gere nenhum HTML aqui". Isso garante que apenas a <li> da pergunta selecionada seja renderizada.
    • Destaque Condicional: Dentro de cada <li>, temos outra verificação:
XQuery
if (string-length($palavra) > 0) then ft:mark(...) else $e/p1-r1

Isso torna o destaque opcional. Se o usuário também digitou uma palavra na busca (string-length($palavra) > 0), a função ft:mark() é usada. Caso contrário, o texto da resposta ($e/p1-r1) é exibido normalmente, sem destaque.

Cenário B: Busca por Palavra Sem Selecionar Pergunta

Este bloco é executado se a variável $pergunta estiver vazia. Ele é responsável por exibir todas as respostas de um acadêmico que contenham a palavra-chave pesquisada.
Código:
XQuery


else
    (
        if ($e/p1-r1/text() contains text {$palavra}) then <li>...</li> else (),
        if ($e/p1-r2/text() contains text {$palavra}) then <li>...</li> else (),
        ...
    )

Explicação da Lógica:
    • else: Este bloco só é ativado se a condição principal if (not(empty($pergunta))) for falsa.
    • if ($e/p1-r1/text() contains text {$palavra}) then ...: A lógica aqui é diferente do Cenário A. Em vez de verificar qual pergunta foi selecionada, verificamos se a resposta de cada pergunta ($e/p1-r1, $e/p1-r2, etc.) contém a palavra pesquisada ($palavra).
    • Resultado: Se a palavra for encontrada em p1-r1, a <li> para p1-r1 é gerada. Se também for encontrada em p2-r3, a <li> para p2-r3 também é gerada, e assim por diante. Isso permite que múltiplas respostas do mesmo autor apareçam nos resultados, desde que todas correspondam à busca por palavra. O destaque com ft:mark é aplicado da mesma forma que no cenário anterior.

Glossário de Comandos e Funções XQuery Utilizados

Para ajudar no aprendizado, aqui está um resumo dos principais comandos e funções usados nesta aplicação:
    • let $variavel := ...: Usado para declarar uma variável e atribuir um valor a ela. Essencial para organizar o código, armazenando resultados de buscas ou cálculos para uso posterior.
    • for $item in $sequencia return ...: A principal estrutura de loop em XQuery. Ele itera sobre cada item em uma sequência ($sequencia), atribui o item atual a uma variável ($item) e executa a expressão no return para cada um.
    • where ...: Usada após um for ou let para filtrar os itens da sequência. Apenas os itens para os quais a condição na cláusula where for verdadeira continuarão a ser processados.
    • return ...: Define a expressão que será executada para cada item em um loop for. É o que gera o resultado final do loop.
    • if (condição) then expressão1 else expressão2: A estrutura condicional padrão. Se a condição for verdadeira, expressão1 é executada. Caso contrário, expressão2 é executada.
    • fn:doc("arquivo.xml"): Abre e analisa um documento XML, tornando-o acessível para consultas. É o ponto de partida para acessar o banco de dados.
    • empty($sequencia): Retorna true se a sequência não contiver nenhum item, e false caso contrário. Muito útil para verificar se uma variável de filtro foi preenchida pelo usuário.
    • count($sequencia): Retorna o número de itens em uma sequência. Usamos para contar o total de respostas encontradas.
    • ft:count($nós): Uma função do módulo Full-Text que conta o número de ocorrências de uma busca contains text dentro de um conjunto de nós. Usamos para contar quantas vezes a palavra-chave aparece.
    • sum($sequencia): Calcula a soma de uma sequência de valores numéricos. Usamos para somar as contagens de ocorrências de todos os resultados.
    • contains text: O operador principal de busca de texto completo. Ele verifica se um nó de texto contém uma palavra ou termo, ignorando maiúsculas/minúsculas e pontuação.
    • ft:mark($nós, "tag"): A função de destaque. Recebe um conjunto de nós que passaram por um filtro contains text e envolve as palavras correspondentes com a tag HTML especificada (em nosso caso, <b>).
    • string-join($sequencia, "separador"): Concatena todos os itens de uma sequência em uma única string, inserindo um "separador" entre eles. Usamos para exibir os filtros selecionados de forma legível.
    • concat("str1", "str2", ...): Concatena duas ou mais strings. Usamos para construir as URLs dos links para os manuscritos.
Esse tutorial foi gerado com Gemini 2.5 Pro em 21/07/25 e tem como objetivo demonstrar como uma aplicação web robusta pode ser construída com XQuery, combinando lógica de busca, processamento de dados e geração dinâmica de HTML em um único ambiente.
