module namespace page = 'http://basex.org/examples/web-page';

(: Página inicial :)
declare
  %rest:GET
  %rest:path('/')
  %output:method('xhtml')
function page:start() as element() {
    <html>
        <head>
            <title>Busca no CorpEA</title>
            <meta charset="utf-8"/>
            <link href="/static/style-7-dark.css" rel="stylesheet"/>
        </head>
        <body>
            <div class="header-container" style="display: flex; align-items: center; padding: 10px;">
                <h1 style="text-align: center; margin: 0;">Corpus de Escrita Acadêmica - CorpEA</h1>
                <button id="theme-toggle" class="theme-toggle-button">🌙</button>
            </div>
            
            <nav class="header-nav">
                <a href="/utilizacao" class="nav-button">Como utilizar o CorpEA</a>
                <a href="/projeto" class="nav-button">Sobre o Projeto</a>
                <a href="/metodologia" class="nav-button">Descrição Metodológica</a>
            </nav>
            <div class="main-container">
                <div class="content">
                    <form method="get" action="/busca">
                        <h3>Filtros de Busca:</h3>
                        <label for="palavra-busca">Termo de busca:</label> <input type="text" id="palavra-busca" name="palavra" placeholder="Digitar palavra"/>
                        <label>Universidade:</label> <input type="radio" name="universidade" value="UFGD"/> UFGD &#160;&#160; <input type="radio" name="universidade" value="UFTM"/> UFTM &#160;&#160; <input type="radio" name="universidade" value="UFSC"/> UFSC
                        <label>Curso de Graduação:</label> <input type="radio" name="curso" value="Artes Cênicas"/> Artes Cênicas &#160;&#160; <input type="radio" name="curso" value="Ciências Contábeis"/> Ciências Contábeis &#160;&#160; <input type="radio" name="curso" value="Ciências Socieais"/> Ciências Sociais &#160;&#160; <input type="radio" name="curso" value="Educação Física"/> Educação Física &#160;&#160; <input type="radio" name="curso" value="Geografia"/> Geografia &#160;&#160; <input type="radio" name="curso" value="História"/> História &#160;&#160; <input type="radio" name="curso" value="Letras"/> Letras &#160;&#160; <input type="radio" name="curso" value="Psicologia"/> Psicologia &#160;&#160; <input type="radio" name="curso" value="Serviço Social"/> Serviço Social
                        <label>Ano da Pesquisa:</label> <input type="radio" name="ano" value="2022"/> 2022 &#160;&#160; <input type="radio" name="ano" value="2024"/> 2024 &#160;&#160; <input type="radio" name="ano" value="2025"/> 2025
                        <label>Autodeclaração:</label> <input type="radio" name="autodeclara" value="Branco"/> Branco &#160;&#160; <input type="radio" name="autodeclara" value="Pardo"/> Pardo &#160;&#160; <input type="radio" name="autodeclara" value="Indígena"/> Indígena &#160;&#160; <input type="radio" name="autodeclara" value="Preto"/> Preto &#160;&#160; 
                        <label>Forma de Ingresso:</label> <input type="radio" name="ingresso" value="SISU"/> SISU &#160;&#160; <input type="radio" name="ingresso" value="Vestibular"/> Vestibular
                        <label>Fez Faculdade Anterior:</label> <input type="radio" name="faculAnt" value="Sim"/> Sim &#160;&#160; <input type="radio" name="faculAnt" value="Não"/> Não
                        <label>Perguntas:</label>
                        <input type="radio" name="pergunta" value="p1-r1"/> 1.1 Quais são suas expectativas em relação a esta disciplina?<br/>
                        <input type="radio" name="pergunta" value="p1-r2"/> 1.2 Quais são suas dificuldades no campo da leitura e da escrita? Especifique.<br/>
                        <input type="radio" name="pergunta" value="p1-r3"/> 1.3 Que funções e características da escrita acadêmica você já conhece? Explique.<br/>
                        <input type="radio" name="pergunta" value="p1-r4"/> 1.4 Faça um desenho mostrando como você se vê na universidade.<br/>
                        <input type="radio" name="pergunta" value="p2-r1"/> 2.1 Do que tratam as matérias que lhes foram entregues? Onde e quando foram publicadas?<br/>
                        <input type="radio" name="pergunta" value="p2-r2"/> 2.2 A que atividades acadêmicas estão relacionadas (ensino, pesquisa ou extensão)?<br/>
                        <input type="radio" name="pergunta" value="p2-r3"/> 2.3 Que matéria lhe chamou mais a atenção? Por quê?<br/>
                        <input type="radio" name="pergunta" value="p2-r4"/> 2.4 Do que trata essa matéria? Se tivesse que reportá-la a alguém, o que reportaria?<br/>

                        
                        <br/><button type="submit" class="nav-button">Buscar</button> <!-- Classe nav-button adicionada -->
                        
                    </form>
                </div>
            </div>   
            <footer>
                <div class="footer-logos">
                    <img src="/static/logo1.png" alt="Parceiro 1" class="partner-logo"/>
                    <img src="/static/logo2.png" alt="Parceiro 2" class="partner-logo"/>
                    <img src="/static/logo3.png" alt="Parceiro 3" class="partner-logo"/>
                </div>
                <div class="license-info"> <a href="https://creativecommons.org">CorpEA</a> © 2025 by <a href="https://creativecommons.org">SANTOS JUNIOR, J. L. N.</a> is licensed under   <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a><img src="https://mirrors.creativecommons.org/presskit/icons/cc.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;"/><img src="https://mirrors.creativecommons.org/presskit/icons/by.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;"/><img src="https://mirrors.creativecommons.org/presskit/icons/nc.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;"/><img src="https://mirrors.creativecommons.org/presskit/icons/sa.svg" style="max-width: 1em;max-height:1em;margin-left: .2em;"/>
                </div>
            </footer>

            <script src="/static/theme-toggle.js"></script>

        </body>
    </html>
};

(: Página de resultados de busca :)

declare
  %rest:GET
  %rest:path('/busca')
  %output:method('xhtml')
  %rest:query-param("palavra", "{$palavra}", "")
  %rest:query-param("universidade", "{$universidade}")
  %rest:query-param("curso", "{$curso}")
  %rest:query-param("ano", "{$ano}")
  %rest:query-param("autodeclara", "{$autodeclara}")
  %rest:query-param("ingresso", "{$ingresso}")
  %rest:query-param("faculAnt", "{$faculAnt}")
  %rest:query-param("pergunta", "{$pergunta}")
function page:busca(
  $palavra as xs:string,
  $universidade as xs:string*,
  $curso as xs:string*,
  $ano as xs:string*,
  $autodeclara as xs:string*,
  $ingresso as xs:string*,
  $faculAnt as xs:string*,
  $pergunta as xs:string*) as element() {

  let $db := fn:doc("ea6.xml")
  
  (: PASSO 1: Coletar todos os resultados que correspondem aos filtros em uma variável :)
  let $resultados :=
    for $e in $db//universidade
    let $textoBusca := $e/(p1-r1, p1-r2, p1-r3, p2-r1, p2-r2, p2-r3, p2-r4)
    where
      (string-length($palavra) = 0 or $textoBusca/text() contains text {$palavra})
      and (empty($universidade) or $e/@uni = $universidade)
      and (empty($curso) or $e/@curso = $curso)
      and (empty($ano) or $e/acad/@ano = $ano)
      and (empty($autodeclara) or $e/acad/@autodeclara = $autodeclara)
      and (empty($ingresso) or $e/acad/@ingresso = $ingresso)
      and (empty($faculAnt) or $e/acad/@faculAnt = $faculAnt)
    return $e
    
  (: PASSO 2: Fazer as contagens com base nos resultados coletados :)
  let $totalRespostas := count($resultados)
  let $totalOcorrencias :=
    if (string-length($palavra) > 0) then
      sum(
        for $r in $resultados
        return ft:count($r/(p1-r1, p1-r2, p1-r3, p2-r1, p2-r2, p2-r3, p2-r4)[./text() contains text {$palavra}])
      )
    else ()

  return
  <html>
      <head>
          <title>Resultados da Busca - CorpEA</title>
          <link href="/static/style-7-dark.css" rel="stylesheet"/>
      </head>
      <body>

      <h1>Resultados da Busca: {$totalRespostas} respostas encontradas</h1>
      
      <div class="main-container">
            <div class="content">
                <section class="filter-box">
                    <h3>Filtros Selecionados:</h3>
                    <ul>
                        { if (string-length($palavra) > 0) then <li><strong>Termo de Busca:</strong> '{$palavra}' (encontrado {$totalOcorrencias} vezes)</li> else () }
                        { if ($universidade) then <li><strong>Universidade:</strong> { string-join($universidade, ", ") }</li> else () }
                        { if ($curso) then <li><strong>Curso de Graduação:</strong> { string-join($curso, ", ") }</li> else () }
                        { if ($ano) then <li><strong>Ano da Pesquisa:</strong> { string-join($ano, ", ") }</li> else () }
                        { if ($autodeclara) then <li><strong>Autodeclaração:</strong> { string-join($autodeclara, ", ") }</li> else () }
                        { if ($ingresso) then <li><strong>Forma de Ingresso:</strong> { string-join($ingresso, ", ") }</li> else () }
                        { if ($faculAnt) then <li><strong>Fez Faculdade Anterior:</strong> { string-join($faculAnt, ", ") }</li> else () }
                        { if ($pergunta) then <li><strong>Perguntas Selecionadas:</strong> { string-join($pergunta, ", ") }</li> else () }
                    </ul>
                </section>

                <h3>Respostas encontradas:</h3>
                <ul>
                {
                    (: PASSO 3: Iterar sobre a variável $resultados para exibir os dados. Verifica usuário digitou uma palavra na busca :)
                    for $e in $resultados
                    return
                    <li>
                       <ul>
                       {
                        if (not(empty($pergunta))) then
                            (
                                if ($pergunta = "p1-r1") then <li><strong>1.1 Quais são suas expectativas em relação a esta disciplina? </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p1-r1[./text() contains text {$palavra}], "b") else $e/p1-r1}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p1-r1/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p1-r2") then <li><strong>1.2 Quais são suas dificuldades no campo da leitura e da escrita? Especifique. </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p1-r2[./text() contains text {$palavra}], "b") else $e/p1-r2}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p1-r2/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p1-r3") then <li><strong>1.3 Que funções e características da escrita acadêmica você já conhece? Explique. </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p1-r3[./text() contains text {$palavra}], "b") else $e/p1-r3}</p> <p>{$e//acad/@nome/data()}</p> <p><a href="{concat('/static/', $e/p1-r3/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p1-r4") then <li><strong>1.4 Faça um desenho mostrando como você se vê na universidade. (Pode ser a lápis e em preto e branco) </strong> <p><img src="{concat('/static/', $e/p1-r4/@src)}" alt="Desenho do aluno" style="max-width:800px;"/></p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> </li> else (),
                                if ($pergunta = "p2-r1") then <li><strong>2.1 Do que tratam as matérias que lhes foram entregues? Onde e quando foram publicadas? </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p2-r1[./text() contains text {$palavra}], "b") else $e/p2-r1}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r1/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p2-r2") then <li><strong>2.2 A que atividades acadêmicas estão relacionadas (ensino, pesquisa ou extensão)? </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p2-r2[./text() contains text {$palavra}], "b") else $e/p2-r2}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r2/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p2-r3") then <li><strong>2.3 Que  matéria lhe chamou mais a atenção? Por quê? </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p2-r3[./text() contains text {$palavra}], "b") else $e/p2-r3}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r3/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($pergunta = "p2-r4") then <li><strong>2.4 Do que trata essa matéria? Se tivesse que reportá-la a alguém, o que reportaria? </strong> <p>{if (string-length($palavra) > 0) then ft:mark($e/p2-r4[./text() contains text {$palavra}], "b") else $e/p2-r4} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p>{$e//acad/@nome/data()}</p> <p><a href="{concat('/static/', $e/p2-r4/@src)}" target="_blank">Ver manuscrito</a></p></li> else ()
                            )
                        else
                            (: Lógica nova: NENHUMA pergunta foi selecionada, então mostra TODAS as respostas que contêm a palavra :)
                            (
                                if ($e/p1-r1/text() contains text {$palavra}) then <li><strong>1.1 Quais são suas expectativas em relação a esta disciplina? </strong> <p>{ft:mark($e/p1-r1[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p1-r1/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($e/p1-r2/text() contains text {$palavra}) then <li><strong>1.2 Quais são suas dificuldades no campo da leitura e da escrita? Especifique. </strong> <p>{ft:mark($e/p1-r2[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p1-r2/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($e/p1-r3/text() contains text {$palavra}) then <li><strong>1.3 Que funções e características da escrita acadêmica você já conhece? Explique. </strong> <p>{ft:mark($e/p1-r3[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p1-r3/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                (: p1-r4 é imagem, então não é buscada, mas pode ser exibida se uma pergunta específica for selecionada :)
                                if ($e/p2-r1/text() contains text {$palavra}) then <li><strong>2.1 Do que tratam as matérias que lhes foram entregues? Onde e quando foram publicadas? </strong> <p>{ft:mark($e/p2-r1[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r1/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($e/p2-r2/text() contains text {$palavra}) then <li><strong>2.2 A que atividades acadêmicas estão relacionadas (ensino, pesquisa ou extensão)? </strong> <p>{ft:mark($e/p2-r2[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r2/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($e/p2-r3/text() contains text {$palavra}) then <li><strong>2.3 Que  matéria lhe chamou mais a atenção? Por quê? </strong> <p>{ft:mark($e/p2-r3[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r3/@src)}" target="_blank">Ver manuscrito</a></p></li> else (),
                                if ($e/p2-r4/text() contains text {$palavra}) then <li><strong>2.4 Do que trata essa matéria? Se tivesse que reportá-la a alguém, o que reportaria? </strong> <p>{ft:mark($e/p2-r4[./text() contains text {$palavra}], "b")}</p> <p>{$e//acad/@nome/data()} &#160;&#160; Idade: {$e//acad/@idade/data()} &#160;&#160; Autodeclara: {$e//acad/@autodeclara/data()} &#160;&#160; Ingresso: {$e//acad/@ingresso/data()} &#160;&#160; Turma: {$e//acad/@turma/data()} &#160;&#160; Faculdade anterior: {$e//acad/@faculAnt/data()} &#160;&#160; {$e//acad/data()}</p> <p><a href="{concat('/static/', $e/p2-r4/@src)}" target="_blank">Ver manuscrito</a></p></li> else ()
                            )
                       }
                        </ul>
                    </li>
                }
            <p><a href="/">Voltar à página inicial</a></p>
                </ul>
            </div>
        </div>

        <script src="/static/theme-toggle.js"></script>

      </body>
  </html>
};

(: Página "Como utilizar o CorpEA" :)
declare
  %rest:GET
  %rest:path('/utilizacao')
  %output:method('xhtml')
function page:utilizacao() as element() {
    <html>
        <head>
            <title>Como utilizar o CorpEA</title>
            <link href="/static/style-7-dark.css" rel="stylesheet"/>
        </head>
        <body>
            <h1>Como utilizar o CorpEA</h1>
            <div class="content">
                <p>O CorpEA é uma ferramenta de análise de textos acadêmicos que permite...</p>
                <p>Instruções detalhadas de uso do CorpEA...</p>
                <p><a href="/">Voltar à página inicial</a></p>
            </div>
            <script src="/static/theme-toggle.js"></script>
        </body>
    </html>
};

(: Página "Sobre o Projeto" :)
declare
  %rest:GET
  %rest:path('/projeto')
  %output:method('xhtml')
function page:projeto() as element() {
    <html>
        <head>
            <title>Sobre o Projeto</title>
            <link href="/static/style-7-dark.css" rel="stylesheet"/>
        </head>
        <body>
            <h1>Sobre o Projeto CorpEA</h1>
            <div class="content">
                <p>O projeto CorpEA é uma iniciativa que visa...</p>
                <p>Informações detalhadas sobre o objetivo e os parceiros do projeto...</p>
                <p><a href="/">Voltar à página inicial</a></p>
            </div>
            <script src="/static/theme-toggle.js"></script>
        </body>
    </html>
};

(: Página "Descrição Metodológica" :)
declare
  %rest:GET
  %rest:path('/metodologia')
  %output:method('xhtml')
function page:metodologia() as element() {
    <html>
        <head>
            <title>Descrição Metodológica</title>
            <link href="/static/style-7-dark.css" rel="stylesheet"/>
        </head>
        <body>
            <h1>Descrição Metodológica</h1>
            <div class="content">
                <p>A metodologia adotada pelo projeto CorpEA envolve...</p>
                <p>Detalhes sobre as técnicas e abordagens metodológicas...</p>
                <p><a href="/">Voltar à página inicial</a></p>
            </div>
            <script src="/static/theme-toggle.js"></script>
        </body>
    </html>
};
