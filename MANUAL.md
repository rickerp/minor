<div class="col-sm-9 main-content" id="content-block">
	<h3 style="font-weight:300; margin-bottom: 22px; margin-top:0px;"></h3>
	<div>
		<p></p>
		<h1>Linguagem Minor</h1>
		<h2>Manual de Referência</h2>
		<h3>(10 de Fevereiro de 2020)</h3>
		<br />
		<p></p>
		<h1>1 - Introdução</h1>
		<p>
			Este manual de referência descreve a linguagem de programação
			<b>minor</b>. Embora procurando ser o mais preciso possível, utiliza-se
			português para descrever a linguagem. Desta forma o documento torna-se
			mais intuitivo, mas menos rigoroso, que uma descrição formal.
			<br />
			A linguagem <b>minor</b> é uma linguagem imperativa, não estruturada, e
			fortemente tipificada.
		</p>
		<dl>
			<dt><strong>1.1 - Tipos de dados:</strong></dt>
			<dd>
				A linguagem define 3 tipos de dados:
				<dl>
					<dt><strong>1.1.1 - números inteiros:</strong></dt>
					<dd>
						designados por <b>number</b>, representam números inteiros
						positivos, negativos ou nulos, ocupando 4 bytes em complemento para
						dois, alinhados a 32 bits.
					</dd>
					<dt><strong>1.1.2 - cadeias de carateres:</strong></dt>
					<dd>
						designadas por <b>string</b>, representam ponteiros para sequências
						de carateres UTF-8, terminadas pelo caráter com o valor 0 ASCII
						(NULL). As variáveis e literais do tipo <b>string</b> podem apenas
						ser utilizados em atribuições, em impressões e como argumentos de
						funções.
					</dd>
					<dt><strong>1.1.3 - vetores inteiros:</strong></dt>
					<dd>
						designados por <b>array</b>, representam ponteiros para conjuntos de
						números inteiros sequencialmente colocados em memória.
					</dd>
				</dl>
			</dd>
			<dt><strong>1.2 - Verificação de tipos:</strong></dt>
			<dd>
				Na linguagem <b>minor</b> as operações dependem dos tipos de dados a que
				são aplicadas. Os tipos suportados por cada operador e a operação a
				realizar são indicados na definição das expressões (ver seção 5).<br />
			</dd>
			<dt><strong>1.3 - Manipulação de nomes:</strong></dt>
			<dd>
				Os nomes são usados para designar as entidades de um programa em
				<b>minor</b>, ou seja, variáveis ou funções.
				<dl>
					<dt><strong>1.3.1 - espaços de nomes:</strong></dt>
					<dd>
						o espaço de nomes global é único, pelo que um nome utilizado para
						designar uma variável não pode ser utilizado para designar uma
						função.
					</dd>
					<dt><strong>1.3.2 - alcance das variáveis:</strong></dt>
					<dd>
						as variáveis globais (declaradas fora de qualquer função), e as
						restantes entidades, existem do início ao fim da execução do
						programa. As variáveis locais a uma função existem apenas durante a
						execução desta, e os argumentos formais estão válidos enquanto a
						função está ativa.
					</dd>
					<dt><strong>1.3.3 - visibilidade dos identificadores:</strong></dt>
					<dd>
						os identificadores estão visíveis desde a sua declaração até ao fim
						do seu alcance, ficheiro (globais) ou à função (locais). A
						redeclaração de um mesmo identificador numa função cria uma nova
						variável que encobre a global até ao fim da respetiva função. Uma
						função não pode declarar no seu corpo principal identificadores com
						mesmo nome dos seus argumentos formais.
					</dd>
				</dl>
			</dd>
		</dl>
		<p></p>
		<h1>2 - Convenções lexicais</h1>
		<p>
			A linguagem de programação <b>minor</b> é constituída por seis grupos de
			elementos lexicais (tokens), devendo o elemento lexical ser constituído
			pela maior sequência de carateres que constitua um elemento lexical
			válido:
		</p>
		<dl>
			<dt><strong>2.1 - Carateres brancos:</strong></dt>
			<dd>
				são considerados carateres brancos aqueles que, embora servindo para
				separar os elementos lexicais, não representam nenhum elemento lexical.
				São considerados carateres brancos:
				<b>espaço</b> ASCII SP (0x20, ou ' '), <b>mudança de linha</b> ASCII LF
				(0x0A, ou '\n'), <b>recuo do carreto</b> ASCII CR (0x0D, '\r') e
				<b>tabulação horizontal</b> ASCII HT (0x9, ou '\t').
			</dd>
			<dt><strong>2.2 - Comentários:</strong></dt>
			<dd>
				Os comentários funcionam como separadores de elementos lexicais. Existem
				dois tipos de comentários:
				<dl>
					<dt><strong>2.2.1 - explicativos:</strong></dt>
					<dd>
						começam pela sequência ('$$'), desde que a sequência não faça parte
						de uma cadeia de carateres, e acabam no fim da linha.
					</dd>
					<dt><strong>2.2.2 - operacionais:</strong></dt>
					<dd>
						são iniciados por ('$') e terminam com ('$') quando separados por
						outros carateres, desde que não façam parte de cadeias de carateres.
					</dd>
				</dl>
			</dd>
			<dt><strong>2.3 - Identificadores:</strong></dt>
			<dd>
				&nbsp;por vezes designados por nomes&nbsp;, são constituídos por uma
				letra (maiúscula ou minúscula) seguida por 0 (zero) ou mais letras,
				dígitos decimais ou o caráter ('_'). O número de carateres que
				constituem um identificador é ilimitado e dois nomes designam
				identificadores distintos se houver alteração de maiúscula para
				minúscula, ou vice-versa, de pelo menos um caráter.
			</dd>
			<dt><strong>2.4 - Palavras chave:</strong></dt>
			<dd>
				os identificadores indicados na tabela abaixo estão reservados pela
				linguagem <b>minor</b>, são palavras chave da linguagem, e não podem ser
				utilizados como identificadores normais. Estes identificadores têm de
				ser escritos exatamente como na tabela abaixo:
				<table>
					<tbody>
						<tr>
							<td>program</td>
							<td>module</td>
							<td>start</td>
							<td>end</td>
							<td>void</td>
							<td>const</td>
							<td>number</td>
							<td>array</td>
							<td>string</td>
							<td>function</td>
							<td>public</td>
							<td>forward</td>
							<td>if</td>
							<td>then</td>
							<td>else</td>
							<td>elif</td>
							<td>fi</td>
							<td>for</td>
							<td>until</td>
							<td>step</td>
							<td>do</td>
							<td>done</td>
							<td>repeat</td>
							<td>stop</td>
							<td>return</td>
						</tr>
					</tbody>
				</table>
			</dd>
			<dt><strong>2.5 - Literais:</strong></dt>
			<dd>
				são notações para elementos cujo valor é diretamente apresentado. (Notar
				que constantes são identificadores que designam elementos cujo valor não
				pode sofrer alterações durante a execução do programa.)
				<dl>
					<dt><strong>2.5.1 - inteiros:</strong></dt>
					<dd>
						um literal inteiro é um número positivo. (Notar que os números
						negativos são construídos pela aplicação do operador simétrico (-) a
						um literal positivo.)
						<br />
						Um literal inteiro em decimal é constituído por uma sequência de 1
						(um) ou mais dígitos decimais (&nbsp;dígitos de '0' a '9'&nbsp;) em
						que o primeiro dígito não é um '0' (zero), excepto no caso do número
						0 (zero) composto apenas pelo dígito '0' (zero), que é igual
						qualquer que seja a base de numeração. Um literal inteiro em octal
						começa sempre pelo dígito '0' (zero), sendo seguido de um ou mais
						digitos de '0' a '7'. Um literal inteiro em hexadecimal começa
						sempre pela sequência '0x', sendo seguido de um ou mais digitos de
						'0' a '9', de `a' a 'f' ou de 'A' a 'F'. As letras de 'a' a 'f', ou
						de 'A' a 'F', representam os valores de 10 a 15 respetivamente. Um
						literal inteiro em binário começa sempre pela sequência '0b', sendo
						seguido de um ou mais digitos '0' ou '1'.
						<br />
						Se não for possível representar o literal inteiro na máquina, devido
						a um <i>overflow</i>, deverá ser gerado um erro lexical.
					</dd>
					<dt><strong>2.5.2 - cadeia de carateres:</strong></dt>
					<dd>
						é consituída por dois ou mais iniciadores seguidos, sem separadores,
						mas constituindo elementos lexicais distintos, bem como uma só
						cadeia de texto. Os iniciadores podem ser valores inteiros não
						negativos, carateres individuais ou cadeias de texto. Os valores
						inteiros, em qualquer base, representam um só caráter, devendo o
						valor ser truncado caso exceda 255. Os carateres individuais começam
						e terminam com o caráter plica (') podendo conter um só caráter ou
						uma sequência especial iniciada por (\). Uma sequência especial pode
						ser representada pelos carateres ASCII LF, CR e HT ('\n', '\r' e
						'\t', respetivamente), ou ainda a plica ('\'') ou a barra ('\\').
						Qualquer outro caráter pode ser representado por 1 ou 2 digitos
						hexadecimais precedidos do caráter '\', por exemplo '\0a' ou apenas
						'\A'. Uma cadeia de texto, começa e termina com o caráter aspa ("),
						pode conter qualquer número de carateres, podendo estes ser
						carateres ASCII ou carateres UTF-8 para carateres portugueses, por
						exemplo. Os carateres utilizados para iniciar ou terminar
						comentários ('$') têm o seu valor normal ASCII não iniciando ou
						terminando qualquer comentário. As mesmas sequências especiais dos
						carateres individuais podem ser utilizados nas cadeia de texto,
						excepto o (\') que é substituído pela aspa (\") O caráter aspa (")
						pode ser utilizado desde que precedido de (\).
					</dd>
				</dl>
			</dd>
			<dt><strong>2.6 - Operadores de expressões:</strong></dt>
			<dd>
				são considerados operadores da linguagem <b>minor</b>
				os seguintes elementos lexicais,
				<table>
					<tbody>
						<tr>
							<td>-</td>
							<td>+</td>
							<td>*</td>
							<td>/</td>
							<td>%</td>
							<td>^</td>
							<td>:=</td>
							<td>&lt;</td>
							<td>&gt;</td>
							<td>=</td>
							<td>&gt;=</td>
							<td>&lt;=</td>
							<td>~=</td>
							<td>|</td>
							<td>&amp;</td>
							<td>~</td>
							<td>?</td>
						</tr>
					</tbody>
				</table>
			</dd>
			<dt><strong>2.7 - Delimitadores e separadores:</strong></dt>
			<dd>
				Os elementos lexicais seguintes são considerados delimitadores da
				linguagem
				<b>minor</b>: '#', '[', ']', '(', ')', ';', ':', '!' e ',' (vírgula).
			</dd>
			<dt><strong>2.8 - Zona de código:</strong></dt>
			<dd>
				Um programa em <b>minor</b> é representado pela parte de um ficheiro
				desde as palavras reservadas <b>program</b> ou <b>module</b> à palavra
				reservada <b>end</b>. Estas três palavras reservadas têm de aparecer no
				início da linha, caso contrario não têm o significado descrito, podendo
				ser usadas como identificadores. Assim, todo o conteúdo do ficheiro
				anterior às palavras reservadas <b>program</b> ou <b>module</b> e após a
				palavra reservada <b>end</b> deverá ser ignorado (quando no início da
				linha).
			</dd>
		</dl>
		<p></p>
		<h1>3 - Gramática</h1>
		<dl>
			<dt><strong>3.1 - Gramática:</strong></dt>
			<dd>
				A gramática da linguagem <b>minor</b> pode ser resumida pelas regras
				abaixo. Considerou-se que os elementos a negrito são literais, que os
				parênteses curvos agrupam elementos, que elementos alternativos são
				separados por uma barra vertical, que elemento opcionais estão entre
				parênteses retos, que os elementos que se repetem zero ou mais vezes
				estão entre chavetas. Cuidado que a barra vertical, os parênteses e as
				chavetas são elementos lexicais da linguagem quando representados a
				negrito.
				<table>
					<tbody>
						<tr>
							<td>ficheiro</td>
							<td>=</td>
							<td>
								programa | módulo
							</td>
						</tr>
						<tr>
							<td>programa</td>
							<td>=</td>
							<td>
								<b>program</b> [ declaração { <b>;</b> declaração } ]
								<b>start</b> corpo <b>end</b>
							</td>
						</tr>
						<tr>
							<td>módulo</td>
							<td>=</td>
							<td>
								<b>module</b> [ declaração { <b>;</b> declaração } ] <b>end</b>
							</td>
						</tr>
						<tr>
							<td>declaração</td>
							<td>=</td>
							<td>
								função | [ qualificador ] [ <b>const</b> ] variável [&nbsp;<b
									>[ </b
								>inteiro<b> ]</b>&nbsp;] [ <b>:=</b> literal ]<br />
							</td>
						</tr>
						<tr>
							<td>função</td>
							<td>=</td>
							<td>
								<b>function</b>&nbsp;[ qualificador ] ( tipo | <b>void</b> )
								ident [ variável { <b>;</b> variável } ] ( <b>done</b> |
								<b>do</b> corpo )
							</td>
						</tr>
						<tr>
							<td>variável</td>
							<td>=</td>
							<td>
								tipo ident [&nbsp;<b>[&nbsp;</b>inteiro<b>&nbsp;]</b>&nbsp;]
							</td>
						</tr>
						<tr>
							<td>tipo</td>
							<td>=</td>
							<td><b>number</b> | <b>string</b> | <b>array</b></td>
						</tr>
						<tr>
							<td>qualificador</td>
							<td>=</td>
							<td><b>public</b> | <b>forward</b></td>
						</tr>
						<tr>
							<td>corpo</td>
							<td>=</td>
							<td>{ variável <b>;</b> } { instrução }</td>
						</tr>
						<tr>
							<td>literal</td>
							<td>=</td>
							<td>
								inteiro | caráter | cadeia |&nbsp;inteiro { <b>,</b> inteiro }
							</td>
						</tr>
						<tr>
							<td>instrução</td>
							<td>=</td>
							<td>
								<b>if</b> expressão <b>then</b> { instrução } {
								<b>elif</b> expressão <b>then</b> { instrução } } [
								<b>else</b>&nbsp;{ instrução } ] <b>fi</b> |
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>
								<b>for</b> expressão <b>until</b> expressão
								<b>step</b> expressão <b>do</b> { instrução } <b>done</b> |
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>expressão ( <b>;</b> | <b>!</b> ) |</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><b>repeat</b> |</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><b>stop</b> |</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><b>return</b> [ expressão ] |</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>left-value <b>#</b> expressão <b>;</b></td>
						</tr>
					</tbody>
				</table>
				<dl>
					<dt><strong>3.1.1 - elementos lexicais:</strong></dt>
					<dd>
						foram omitidos da gramática, por já terem sido definidos acima, os
						seguintes elementos: ident: definido em 2.3, inteiro: definido em
						2.5.1, caráter: definido em 2.5.2, cadeia: definido em 2.5.2.
					</dd>
					<dt><strong>3.1.2 - left-value:</strong></dt>
					<dd>
						os elementos de uma expressão que podem ser utilizados como
						left-values encontram-se individualmente identificados na seção 6.
						Todos os left-value representam posições de memória passíveis de ser
						modificadas, podendo igualmente ser usadas como right-values em
						expressões através da leitura da respetiva posição de memória.
					</dd>
					<dt><strong>3.1.2 - expressão:</strong></dt>
					<dd>
						foi delibradamente omitida da gramática e será tratada em na seção
						6.
					</dd>
				</dl>
			</dd>
			<dt><strong>3.2 - Ficheiros:</strong></dt>
			<dd>
				Um ficheiro descrito em <b>minor</b> pode ser de dois tipos:
				<dl>
					<dt><strong>3.2.1 - programas:</strong></dt>
					<dd>
						identificados no início do ficheiro pela palavra reservada
						<b>program</b>, na 1ª coluna. Os programas têm, obrigatoriamente um
						corpo de instruções que representa o ponto de entrada no programa,
						gerando uma função designada por _main.
					</dd>
					<dt><strong>3.2.2 - módulos:</strong></dt>
					<dd>
						identificados no início do ficheiro pela palavra reservada
						<b>module</b>, na 1ª coluna. Os módulos não contêm um ponto de
						entrada, pelo que devem ser ligados com um (e um só) programa para
						gerar um ficheiro executável, podendo conter outros módulos.
					</dd>
				</dl>
			</dd>
			<dt><strong>3.3 - Declaração de variáveis e constantes:</strong></dt>
			<dd>
				cada declaração permite declarar uma única variável ou constante. Uma
				declaração inclui os seguintes componentes:
				<dl>
					<dt><strong>3.3.1 - constante:</strong></dt>
					<dd>
						designada pela palavra reservada <b>const</b>, que torna o
						identificador constante, ou seja, cujo valor representado não pode
						ser modificado. Tal não significa que os valores indiretamente
						referidos (apontados) pelo identidicador sejam constantes, por
						exemplo variáveis do tipo <b>string</b> ou <b>array</b>.
						<br />
						Notar que declarações de constantes não iniciadas só são possíveis
						se forem identificadores pré-declarados, pertencentes a outros
						ficheiros (módulos ou programa).
					</dd>
					<dt><strong>3.3.2 - Símbolos globais:</strong></dt>
					<dd>
						Para a utilização de compilação separada em
						<b>minor</b>
						existem dois qualificadores opcionais nas declarações:
						<dl>
							<dt><strong>3.3.2.1 - publico:</strong></dt>
							<dd>
								designado pela palavra reservada <b>public</b> torna o
								identificador globalmente visível fora deste módulo (ou
								programa).
							</dd>
							<dt><strong>3.3.2.2 - pré-declaração:</strong></dt>
							<dd>
								designado pela palavra reservada <b>forward</b> identifica a
								entidade ( constante, variável ou função ) não iniciada, podendo
								esta estar declarada mais à frente no ficheiro ou em outro
								ficheiro ( possivelmente noutra linguagem ).
							</dd>
						</dl>
					</dd>
					<dt><strong>3.3.3 - tipo de dados:</strong></dt>
					<dd>
						designado por um dos 3 tipos de dados (<b>number</b>,
						<b>string</b> ou <b>array</b>).
					</dd>
					<dt><strong>3.3.4 - identificador:</strong></dt>
					<dd>
						designada por um identificador que passa a nomear a entidade
						declarada. No caso declarações do tipo <b>array</b>, o identificador
						é sempre seguido de um inteiro positivo delimitado por parenteses
						retos, que corresponde à dimensão total do vetor.
					</dd>
					<dt><strong>3.3.5 - inicialização:</strong></dt>
					<dd>
						a existir, inicia-se com o operador de atribuição ':=' seguido de
						valores literais dependentes do tipo declarado:
						<dl>
							<dt><strong>3.3.5.1 - inteiros:</strong></dt>
							<dd>
								o valor a iniciar é um número inteiro, representado em binário,
								decimal, octal ou hexadecimal.
							</dd>
							<dt><strong>3.3.5.2 - cadeia de carateres:</strong></dt>
							<dd>
								uma lista não nula de valores separados por vírgulas. Os valores
								podem ser inteiros (ver 3.3.5.1), carateres individuais ou
								cadeias de texto. Estes valores são sempre constantes,
								independentemente de o identificador que as designa ser
								constante ou não.
							</dd>
							<dt><strong>3.3.5.3 - vetores de inteiros:</strong></dt>
							<dd>
								uma lista não nula de valores inteiros separados por vírgulas.
							</dd>
						</dl>
					</dd>
				</dl>
			</dd>
		</dl>
		<p></p>
		<h1>4 - Funções</h1>
		<p>
			Uma função permite agrupar um conjunto de instruções num corpo, que é
			executado com base num conjunto de parâmetros ( os argumentos formais )
			quando é invocada a partir de uma expressão.
		</p>
		<dl>
			<dt><strong>4.1 - Declaração :</strong></dt>
			<dd>
				As funções em <b>minor</b> são sempre designadas por identificadores
				constantes precedidas da palavra chave <b>function</b>, de um
				qualificador opcional, e do tipo de dados devolvido pela função. <br />
				As funções, que recebam argumentos, devem indicá-los no cabeçalho,
				separados por v?gulas, após o identificador da função. Cada argumento é
				descrito por um tipo seguido do identificador.<br />
				Uma declaração de uma função não iniciada, termina com a palavra
				reservada <b>done</b> e, é utilizada para tipificar um identificador
				exterior ou para efetuar <i>forward declarations</i> (utilizada para
				pré-declarar uma função que seja usada antes de ser definida, por
				exemplo, entre duas funções mutuamente recursivas). Caso a declaração
				seja iniciada, através da palavra reservada <b>do</b> seguido de um
				corpo, define-se uma nova função. <br />
				O valor devolvido por uma função, através da instrução <b>return</b>,
				deve ser sempre do tipo declarado. Todas as funções terminam com a
				instrução <b>return</b>, mesmo que não devolvam um valor ( tipo
				<b>void</b> ). Por outro lado, a função principal de um programa nunca
				termina com uma instrução <b>return</b>, caso a última instrução seja
				executada a função principal deve devolver o inteiro <b>0</b> ( zero )
				ao sistema operativo. Contudo, a instrução <b>return</b> pode ser
				utilizada nos sub-blocos ( em <b>if</b>s ou <b>for</b>s ) da função
				principal.
				<br />
				A função não pode definir variáveis designadas por identificadores com o
				mesmo nome de nenhum dos argumentos formais da função.
			</dd>
			<dt><strong>4.2 - Invocação :</strong></dt>
			<dd>
				A função só pode ser invocada através de um identificador que refira uma
				função previamente declarada ou definida. Se a função não tiver
				argumentos não devem ser utilizados parenteses na sua invocação.<br />
				Caso existam argumentos, na invocação da função o seu identificador é
				seguido de uma lista de expressões delimitadas por parenteses curvos. A
				lista de expressões é uma sequência, não nula, de expressões separadas
				por vírgulas. O valor resultante passado por cópia (&nbsp;passagem de
				argumentos por valor&nbsp;). <br />
				O número e tipo de parâmetros atuais deve ser igual ao número e tipo dos
				parâmetros formais da função invocada. A ordem dos parâmetros atuais
				deverá ser a mesma dos argumentos formais da função a ser invocada. Os
				parâmetros atuais devem ser colocados na pilha de dados pela ordem
				inversa da sua declaração (&nbsp;o primeiro no topo da pilha&nbsp;) e o
				endereço de retorno no topo da pilha. <br />
				Quem coloca os argumentos na pilha (&nbsp;a função chamadora&nbsp;)
				também é responsável pela sua remoção após o retorno da função chamada
				(&nbsp;chamada <i>à</i> C&nbsp;). Os valores de retorno são devolvidos
				no acumulador do processador.
			</dd>
			<dt><strong>4.3 - Corpo :</strong></dt>
			<dd>
				um sub-bloco de função ( usada numa instrução condicional ou de iteração
				) não pode definir variáveis.
			</dd>
		</dl>
		<p></p>
		<h1>5 - Instruções</h1>
		<p>
			Excepto quando indicado as instruções são executadas em sequência, sendo
			os seus efeitos traduzidos, em geral, pela alteração do valor de
			variáveis.
		</p>
		<dl>
			<dt><strong>5.1 - Instrução condicional:</strong></dt>
			<dd>
				a instrução é delimitada pela palavras reservadas <b>if</b> e <b>fi</b>.
				Se a expressão que segue a palavra reservada <b>if</b> for diferente de
				0 (zero) então o corpo que lhe segue é executado. <br />
				Caso existam conjuntos <b>elif</b> as suas expressões serão
				sucessivamente executadas, caso todas as condições anteriores sejam
				nulas ( iguais a 0 ). Assim que uma dessas condições seja diferente de 0
				(zero), o seu corpo é executado e a instrução termina. <br />
				Caso exista um conjunto <b>else</b>, o seu corpo só é executado se
				nenhum dos anteriores corpos da instrção o tenha sido.
			</dd>
			<dt><strong>5.2 - Instrução de iteração:</strong></dt>
			<dd>
				a instrução é delimitada pela palavras reservadas <b>for</b> e
				<b>done</b>. A palavra reservada <b>for</b> é seguida de uma expressão
				de inicialização. As instruções do ciclo serão executadas enquanto a
				expressão que segue a palavra reservada <b>until</b> for igual a zero
				(falsa). Após as instruções do ciclo serem todas executadas, a expressão
				que segue a palavra reservada <b>step</b> é executada antes de testar a
				condição <b>until</b>. As instruções do ciclo aparecem após a palavra
				reservada <b>do</b>.
			</dd>
			<dt><strong>5.3 - Instrução de retorno:</strong></dt>
			<dd>
				iniciada pela palavra reservada <b>return</b>, a existir deverá ser a
				última instrução do bloco em que se insere. Esta instrução termina a
				execução da função, mesmo que se encontre num corpo que não seja o bloco
				principal. A instrução só é seguida de um expressão caso a função não
				seja do tipo <b>void</b>.
			</dd>
			<dt><strong>5.4 - Instrução de continuação:</strong></dt>
			<dd>
				constituída pela palavra reservada <b>repeat</b>, a existir deverá ser a
				última instrução do bloco em que se insere. Esta instrução reinicia o
				ciclo <b>for</b> mais interior em que a instrução <b>repeat</b> se
				encontra, tal como a instrução <b>continue</b> em <b>C</b>. Esta
				instrução só pode existir dentro de um ciclo.
			</dd>
			<dt><strong>5.5 - Instrução de terminação:</strong></dt>
			<dd>
				constituída pela palavra reservada <b>stop</b>, a existir deverá ser a
				última instrução do bloco em que se insere. Esta instrução termina a
				execução do ciclo <b>for</b> mais interior em que a instrução
				<b>stop</b> se encontra, tal como a instrução homónima em <b>C</b>. Esta
				instrução só pode existir dentro de um ciclo.
			</dd>
			<dt><strong>5.6 - Expressão como instrução:</strong></dt>
			<dd>
				qualquer expressão pode ser utilizada como instrução, mesmo que não
				produza qualquer efeito secundário. Caso a expressão seja terminada por
				<b>!</b> o seu valor deve ser impresso. O valor deve ser impresso em
				decimal para os valores do tipo <b>number</b> ou <b>array</b>, em ASCII
				e UTF-8 para valores do tipo <b>string</b>.
			</dd>
			<dt><strong>5.7 - Reserva de memória na pilha</strong></dt>
			<dd>
				A instrução de reserva de memória na pilha utiliza o operador <b>#</b> e
				permite atribuir ao ponteiro, <i>left-value</i> da esquerda, o início da
				zona de memória com comprimento igual ao número de unidades do
				<i>left-value</i>
				indicado na expressão da direita.
			</dd>
		</dl>
		<p></p>
		<h1>6 - Expressões</h1>
		<p>
			Uma expressão é uma representação algébrica de uma quantidade. Assim,
			todas as expressões devolvem um valor. As expressões na linguagem de
			programação <b>minor</b> utilizam operadores algébricos comuns: soma,
			subtração, multiplicação e divisão inteira e resto da divisão, além de
			outros operadores.
			<br />
			As expressões são sempre avaliadas da esquerda para a direita,
			independentemente da associatividade do operador. A precedência dos
			operadores é a mesma para operadores na mesma seção, sendo as seções
			seguintes de menor prioridade que as anteriores. O valor resultante da
			aplicação da expressão bem como a sua associatividade são descriminados em
			cada operador.
			<br />
			A tabela seguinte que resume os operadores da linguagem <b>minor</b>, por
			grupos de precedência decrescente:
			<br />
		</p>
		<blockquote>
			<blockquote>
				<blockquote>
					<table>
						<tbody>
							<tr>
								<th>designação</th>
								<th>operadores</th>
								<th>associatividade</th>
							</tr>
							<tr>
								<td>primária</td>
								<td>( ) [ ]</td>
								<td>não associativos</td>
							</tr>
							<tr>
								<td>unária</td>
								<td>&amp; - ?</td>
								<td>não associativos</td>
							</tr>
							<tr>
								<td>potência</td>
								<td>^</td>
								<td>da direita para a esquerda</td>
							</tr>
							<tr>
								<td>multiplicativa</td>
								<td>* / %</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>aditiva</td>
								<td>+ -</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>comparativa</td>
								<td>&lt; &gt; &lt;= &gt;=</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>igualdade</td>
								<td>~= =</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>`não' lógico</td>
								<td>~</td>
								<td>não associativo</td>
							</tr>
							<tr>
								<td>`e' lógico</td>
								<td>&amp;</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>`ou' lógico</td>
								<td>|</td>
								<td>da esquerda para a direita</td>
							</tr>
							<tr>
								<td>atribuição</td>
								<td>:=</td>
								<td>da direita para a esquerda</td>
							</tr>
						</tbody>
					</table>
				</blockquote>
			</blockquote>
		</blockquote>
		Os operadores têm o mesmo significado que em <b>C</b>, com a excepção do
		operador de diferença (que usa <b>~=</b> em vez de <b>!=</b>), o operador de
		igualdade (que usa <b>=</b> em vez de <b>==</b>), o operador de atribuição
		(que usa <b>:=</b> em vez de <b>=</b>), além do operador de leitura (que usa
		<b>?</b>) e do operador de potência (que usa <b>^</b>), como noutras
		linguagens de programação.
		<p></p>
		<dl>
			<dt><strong>6.1 - Expressões primárias:</strong></dt>
			<dd>
				<dl>
					<dt><strong>6.1.1 - identificadores:</strong></dt>
					<dd>
						Um identificador é uma expressão desde que tenha sido devidamente
						declarado. Um identificador pode denotar uma variável, uma constante
						ou uma função. Neste último caso o identificador representa a
						invocação de uma função sem argumentos.<br />
						Um identificador é o caso mais simples de um <i>left-value</i>, ou
						seja, uma entidade que pode ser utilizada no lado esquerdo
						(<i>left-value</i>) de uma atribuição.
					</dd>
					<dt><strong>6.1.2 - literais:</strong></dt>
					<dd>
						Os literais podem ser valores constantes inteiros não negativos, tal
						como definidos nas convenções lexicais, ou cadeias de carateres.
					</dd>
					<dt><strong>6.1.3 - parenteses curvos:</strong></dt>
					<dd>
						Uma expressão entre parenteses curvos tem o valor da expressão sem
						os parenteses e permite alterar a prioridade dos operadores. Uma
						expressão entre parenteses não pode ser utilizada como
						<i>left-value</i> (&nbsp;ver em indexação&nbsp;).
					</dd>
					<dt><strong>6.1.4 - indexação:</strong></dt>
					<dd>
						Uma expressão indexação devolve um valor inteiro que referencia um
						<i>left-value</i> através da sua localização em memória, somado ao
						deslocamento da expressão entre parenteses retos que representa o
						número de unidades. O resultado de uma expressão de indexação é o
						valor existente na posição de memória indicada pelo identificador.
						Uma indexação também pode ser utilizada como <i>left-value</i>.
					</dd>
					<dt><strong>6.1.5 - invocação:</strong></dt>
					<dd>
						A função só pode ser invocada através de um identificador que refira
						uma função previamente declarada ou definida. A invocação de uma
						função sem argumentos refere apenas o seu identificador. Para
						funções com argumentos, estes são expressões separadas por vírgulas
						e delimitadas por parêntesis curvos.<br />
					</dd>
					<dt><strong>6.1.6 - leitura:</strong></dt>
					<dd>
						A operação de leitura de um valor inteiro pode ser efetuado pela
						expressão <b>?</b>, que devolve o valor lido.
					</dd>
				</dl>
			</dd>
			<dt><strong>6.2 - Expressões unárias:</strong></dt>
			<dd>
				<dl>
					<dt><strong>6.2.1 - localização:</strong></dt>
					<dd>
						A expressão localização <b>&amp;</b> devolve um valor inteiro que
						representa a posição de memória ocupada pelo <i>left-value</i> e
						utiliza o operador prefixado <b>&amp;</b>.
					</dd>
					<dt><strong>6.2.2 - simétrico:</strong></dt>
					<dd>
						A expressão valor simétrico <b>-</b> devolve o simétrico do valor
						inteiro e utiliza o operador prefixado <b>-</b>.
					</dd>
				</dl>
			</dd>
			<dt><strong>6.3 - Expressão de potência:</strong></dt>
			<dd>
				a operação <b>^</b> é apenas aplicável a valores inteiros, devolvendo a
				multiplicação do primeiro argumento por ele próprio tantas vezes quantas
				o valor do segundo argumento.
			</dd>
			<dt><strong>6.4 - Expressões multiplicativas:</strong></dt>
			<dd>
				as operações <b>*</b>, <b>/</b> e <b>%</b> são apenas aplicáveis a
				valores inteiros, devolvendo o resultado da respetiva operação
				algébrica.
			</dd>
			<dt><strong>6.5 - Expressões aditivas:</strong></dt>
			<dd>
				as operações <b>+</b> e <b>-</b> são apenas aplicáveis a valores
				inteiros, ou quando um deles é inteiro e o outro é vetor (aritmética de
				ponteiros), devolvendo o resultado da respetiva operação algébrica. É
				possível fazer a diferença entre dois vetores, resultando num inteiro.
			</dd>
			<dt><strong>6.6 - Expressões de grandeza:</strong></dt>
			<dd>
				as operações <b>&lt;</b>, <b>&gt;</b>, <b>&lt;=</b> e <b>&gt;=</b>
				são aplicáveis quando ambos os valores são inteiros, ou ambos cadeias,
				devolvendo o valor inteiro 0 (zero) caso seja falsa e um valor diferente
				de zero caso contrário.
			</dd>
			<dt><strong>6.7 - Expressões de igualdade:</strong></dt>
			<dd>
				as operações <b>~=</b> e <b>=</b> são aplicáveis quando ambos os valores
				são inteiros, ou ambos cadeias, devolvendo o valor inteiro 0 (zero) caso
				seja falsa e um valor diferente de zero caso contrário.
			</dd>
			<dt><strong>6.8 - Expressões de negação lógica:</strong></dt>
			<dd>
				a operação <b>~</b> é aplicável a valores inteiros, devolvendo o valor
				inteiro 0 (zero) caso o argumento seja diferente de 0 (zero) e um valor
				diferente de zero caso contrário.
			</dd>
			<dt><strong>6.9 - Expressões de junção lógica:</strong></dt>
			<dd>
				a operação <b>&amp;</b> é aplicável a valores inteiros, devolvendo um
				valor diferente de zero caso ambos os argumentos sejam diferente de 0
				(zero) e um valor diferente de zero caso contrário. Caso o primeiro
				argumento seja 0 (zero) o segundo argumento não deve ser avaliado.
			</dd>
			<dt><strong>6.10 - Expressões de alternativa lógica:</strong></dt>
			<dd>
				a operação <b>|</b> é aplicável a valores inteiros, devolvendo o valor
				inteiro 0 (zero) caso ambos os argumentos sejam iguais a 0 (zero) e um
				valor diferente de zero caso contrário. Caso o primeiro argumento seja
				um valor diferente de zero o segundo argumento não deve ser avaliado.
			</dd>
			<dt><strong>6.11 - Expressões de atribuição:</strong></dt>
			<dd>
				O valor da expressão do lado direito do operador <b>:=</b> é guardado na
				posição indicada pelo <i>left-value</i> do lado direito do operador de
				atribuição. Só podem atribuídos valores a variáveis do mesmo tipo. O
				valor <b>0</b> (zero) pode ser atribuído a qualquer tipo de variável,
				correspondendo ao ponteiro nulo no caso de cadeias e vetores.
			</dd>
		</dl>
		<p></p>
		<h1>7 - Interface com o sistema operativo</h1>
		<p></p>
		<dl>
			<dt><strong>7.1 - Função principal:</strong></dt>
			<dd>
				A execução de um programa em <b>minor</b> inicia-se com a invocação da
				função que realiza o programa, designado por program, e que no seu
				término deverá retornar 0 (zero).
			</dd>
			<dt><strong>7.2 - rotinas de biblioteca:</strong></dt>
			<dd>
				O ficheiro <b>linux.asm</b> contém a rotina de arranque (_start) que
				invoca a função principal para os programas desenvolvidos em
				<b>minor</b>, bem como a rotina de terminação (_exit). O ficheiro
				<b>lib.asm</b> contém um conjunto de rotinas de biblioteca que poderá
				utilizar, com nomes auto-explicativos e semelhantes aos da biblioteca de
				<b>C</b>:
				<ul>
					<li>
						<b> void println</b>: imprime o caráter de mudança de linha ('\n');
					</li>
					<li><b> void printsp(int n)</b>: imprime 'n' espaços brancos;</li>
					<li>
						<b> void prints(const char *s)</b>: imprime a cadeia de caracteres
						's', terminada em NULL ('\0');
					</li>
					<li>
						<b> void printi(int i)</b>: imprime o valor inteiro 'i', em decimal;
					</li>
					<li>
						<b> char *readln(char *buf, int size)</b>: equivale a fgets(buf,
						size, stdin) em <b>C</b>;
					</li>
					<li><b> int readb</b>: lê um byte do terminal;</li>
					<li>
						<b> int readi</b>: lê um inteiro decimal, isolado numa linha, do
						terminal;
					</li>
					<li>
						<b> int strlen(const char *s)</b>: equivalente à rotina homónima em
						<b>C</b>;
					</li>
					<li>
						<b> int atoi(const char *s)</b>: equivalente à rotina homónima em
						<b>C</b>;
					</li>
					<li>
						<b> char *itoa(int i)</b>: converte um valor inteiro para uma cadeia
						de caracteres ASCII, terminada em NULL ('\0'), situada num bloco de
						memória fixo (é reutilizado em chamadas subsequentes), em decimal.
					</li>
				</ul>
				Deverão igualmente ser adicionadas quaisquer rotinas necessárias ao
				correto funcionamento dos operadores existentes na linguagem.
			</dd>
			<dt><strong>7.3 - argumentos do programa:</strong></dt>
			<dd>
				Existem 3 funções que permitem obter os argumentos normalmente obtidos
				pela função main do <b>C</b>:
				<dl>
					<dt><strong>número de argumentos da linha de comando:</strong></dt>
					<dd>
						função designada por argc e que devolve um inteiro que representa o
						número de argumentos indicados na linha de comando, incluindo o nome
						do programa.
					</dd>
					<dt><strong>argumentos da linha de comando:</strong></dt>
					<dd>
						função designada por argv, recebe como argumento um inteiro, entre
						<b>0</b> e <b>argc</b>, que representa o número do argumento e
						devolve a respectiva cadeia de caracteres.
					</dd>
					<dt><strong>variáveis de ambiente:</strong></dt>
					<dd>
						função designada por envp, recebe como argumento um inteiro, de
						<b>0</b> até que <b>envp(N) == 0</b> (para N &gt;= 0), que
						representa o número da variável de ambiente e devolve a respectiva
						cadeia de caracteres.
					</dd>
				</dl>
			</dd>
			<dt><strong>7.4 - chamadas ao sistema operativo:</strong></dt>
			<dd>
				O ficheiro <b>sys.asm</b> contém as chamadas ao sistema que pode
				realizar em programas escritos em <b>minor</b>. Uma explicação das
				chamadas ao sistema pode ser obtida através de:
				<pre>	prompt$ <i>man 2 intro</i>
	prompt$ <i>man 2 syscalls</i>
	</pre>
				Algumas destas chamadas não existem na biblioteca de <b>C</b>, outras,
				como o <b>brk</b>, têm um comportamento diferente da rotina homónima da
				biblioteca de <b>C</b>.
			</dd>
			<dt>
				<strong>7.5 - rotinas em <b>C</b>:</strong>
			</dt>
			<dd>
				Como a passagem de parâmetros e retorno de valores é igual ao <b>C</b>,
				podem-se invocar de <b>minor</b> rotinas em <b>C</b> e vice-versa.
			</dd>
		</dl>
		<p></p>
		<h1>8 - Exemplos</h1>
		<p>
			Os exemplos apresentados não são exaustivos, pelo que nem todas as
			construções da linguagem são utilizadas.
		</p>
		<p>
			O já habitual hello world:
		</p>
		<pre>
program start
	"olá pessoal!\n"!
end
</pre
		>
		<p>
			O cálculo da função de Ackermann. (Esta função tem um crescimento muito
			elevado pelo que nos computadores atuais, mesmo utilizando <b>C</b>, os
			argumentos não deverão exceder m=3 e n=12 para executar em poucos
			segundos)
		</p>
		<pre>
program
number cnt := 0;
function forward number atoi string s done;
function forward number argc done;
function forward string argv number n done;
function number ackermann number m ; number n do
	cnt := cnt + 1;
	if m = 0 then return n+1 fi
	if n = 0 then return ackermann(m-1, 1) fi
	return ackermann(m-1, ackermann(m, n-1))
start
	if argc &gt; 2 then
		ackermann(atoi(argv(1)), atoi(argv(2)))! " #"! cnt! "\n"!
	fi
end
</pre
		>
		Outros
		<a
			href="https://fenix.tecnico.ulisboa.pt/downloadFile/282093452076368/exs.tgz"
			>exemplos</a
		>
		podem ser obtidos a partir da página do projeto no fénix.
		<p></p>
		<h1>9 - Avaliação</h1>
		<p>
			Este projeto pretende desenvolver um compilador para a linguagem de
			programação <b>minor</b>. Este compilador deverá efetuar a análise
			sintática e semântica da linguagem, produzindo como resultado código
			máquina (<i>assembly</i>) com seleção de instruções em formato
			<b>nasm</b> para <b>linux-elf32-i386</b>. O compilador deverá ser escrito
			em <b>C/C++</b> com auxílio das ferramentas de análise lexical, sintática
			e seleção de instruções, respetivamente, flex, byacc e pburg. Nenhuma
			destas ferramentas deve produzir erros ou avisos na sua invocação. A
			análise semântica da linguagem deverá garantir que o programa a processar
			se encontra corretamente escrito e que pode ser gerado código, devendo
			gerar mensagens de erro explícitas em caso contrário. Se forem encontrados
			erros (lexicais, sintáticos ou semânticos) não deve ser gerado código e
			compilador deve devolver um valor não zero. A seleção das instruções deve
			aproveitar da melhor forma possível as capacidades do processador, as
			macros <b>postfix</b>. Para o cálculo dos custos deve-se considerar que
			cada instrução <b>postfix</b> tem um custo pelo menos unitário (1),
			excluindo as diretivas <i>assembly</i>.
		</p>
		<p>
			O ficheiro <i>assembly</i> gerado deve ser processado pelo
			<i>assembler</i> <b>nasm</b>, com o comando nasm -felf32 file.asm, para
			obter o ficheiro objeto file.o, assumindo que não são encontrados erros no
			seu processamento. O executável final deve ser construído pelo
			<i>loader</i> <b>ld</b> com todos os ficheiros objeto necessários e a
			biblioteca de <i>runtime</i>: ld -m elf_i386 file1.o file2.o -lminor.
		</p>
		<p>
			O projeto é desenvolvido individualmente. Apenas se consideram para
			avaliação os projetos submetidos no Fenix, contendo todos os ficheiros
			fontes necessários à resolução do projeto, em formato .tgz (ou .zip), até
			à data limite. A submissão de um projeto pressupõe o compromisso de honra
			que o trabalho incluso foi realizado pelo aluno. A quebra deste
			compromisso, ou seja a tentativa de um aluno se apropriar de trabalho
			realizado por outros, tem como consequência a reprovação de todos os
			alunos envolvidos (incluindo os que possibilitaram a ocorrência) à
			disciplina neste ano letivo.
		</p>
		<p>
			Parte da nota do projeto é obtida através de testes automáticos, pelos que
			estas instruções devem ser seguidas rigorosamente. Caso os testes falhem
			por causas imputáveis ao aluno a nota refletirá apenas os testes bem
			sucedidos. As restantes componentes da nota são obtidas pela análise do
			código entregue e pela avaliação do teste prático. O código é avaliado
			quanto à sua correção, simplicidade e legibilidade. Para tal, os
			comentários, nomeadamente, não devem ser excessivos nem óbvios, por forma
			a dificultar a legibilidade, nem muito escassos, por forma a impedir a
			compreensão das partes mais complexas do programa.
		</p>
		<p>
			A entrega intermédia deve incluir os ficheiros de especificação
			<b>lex</b> (minor.l) e <b>yacc</b> (minor.y) que realizem a análise
			semântica e, caso o programa esteja correto, imprime a árvore sintática
			abstrata (<b>AST</b>) no stdout. Deve incluir uma Makefile no diretório
			principal, que produza o executável minor no mesmo diretório, e todos os
			ficheiros auxiliares que forem necessários para gerar o executável. A
			execução do referido ficheiro executável deverá devolver 0 (zero) se o
			programa processado não tiver erros ou devolver 1 (um) e produzir
			mensagens de erro esclarecedoras no terminal (usando o stderr) caso o
			programa tenha erros lexicais, sintáticos ou semânticos.
		</p>
		<p>
			O executável <b>minor</b> da entrega final não imprime a árvore sintática
			abstrata, gera código <b>linux-elf32-i386</b> no ficheiro de saída e deve
			incluir o ficheiro de especificação <b>burg</b> (minor.brg). A Makefile
			principal deve produzir, além do executável do compilador <b>minor</b>, a
			biblioteca de <i>runtime</i> libminor.a, no mesmo diretório, contendo
			suporte para todas as operações da linguagem.
		</p>
		<p></p>
		<h1>10 - Desenvolvimento</h1>
		<p>
			A ferramentas, e material de apoio, contêm mecanismos de teste e
			<i>debug</i>. O compilador deve ser desenvolvido em passos de complexidade
			crescente, não devendo passar ao passo seguinte antes de concluir com
			sucesso o anterior:
		</p>
		<ul>
			<li>
				expressões regulares (definir tokens em minor.y e especificação lexical
				completa em minor.l): <br /><b>./minor -initial ex.min</b> <br />deve
				imprimir todos os <i>tokens</i> presentes no exemplo.
			</li>
			<li>
				gramática (definir apenas a gramática em minor.y): <br /><b
					>YYDEBUG=1 ./minor ex.min</b
				>
				<br />não deve dar erros nos programas corretos.
			</li>
			<li>
				árvore sintática (definir apenas a árvore nas ações em minor.y):
				<br /><b>NODEDBUG=1 ./minor ex.min</b> <br />deve imprimir a árvore nos
				programas corretos.
			</li>
			<li>
				tabela de símbolos (acrescentar manipulação de símbolos nas ações em
				minor.y): <br /><b>IDDEBUG=1 ./minor ex.min</b> <br />deve detetar
				identificadores não declarados.
			</li>
			<li>
				semântica (acrescentar verificações semânticas nas ações em minor.y):
				<br /><b>./minor ex.min</b> <br />deve detetar qualquer erro da
				linguagem.
			</li>
			<li>
				seleção (definir apenas a gramática em minor.brg): <br /><b
					>./minor -trace ex.min</b
				>
				<br />não deve dar erros nos programas corretos. <br />User
				<b>NODEDBUG=1 ./minor -trace ex.min</b> para obter também os custos.
			</li>
			<li>
				geração de código (acrescentar ações <b>postfix</b> em minor.brg):
				<br /><b>./minor ex.min</b> <br /><b>nasm -felf32 ex.asm</b> <br />não
				deve dar erros nos programas corretos e produzir
				<i>assembler</i> correto.
			</li>
			<li>
				runtime (introduzir biblioteca de <i>runtime</i> em run/): <br /><b
					>./minor ex.min</b
				>
				<br /><b>nasm -felf32 ex.asm</b> <br /><b
					>ld -m elf_i386 ex.o -lminor</b
				>
				<br /><b>./a.out</b> <br />programas compilados devem executar como
				esperado.
			</li>
		</ul>
		No caso da seleção e geração de código pode ser útil começar por processar a
		árvore de exemplos simples, tipo <i>hello world</i>, e depois destes
		executarem corretamente evoluir para programas sucessivamente mais complexos
		(árvores maiores e com mais tipos de nós).
		<br />
		<i>Pedro Reis dos Santos</i>
		<br /><i>2020-03-19</i>
		<p></p>
	</div>
</div>
