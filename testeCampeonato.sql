create database testecampeonato

use testecampeonato

create table times 
(
	codigotime 	int 			primary key,
	nometime 	varchar(50) 	not null,
	cidade 		varchar(100)	not null,
	estadio 	varchar(70) 	not null,
	ordenado 	int 			default(1) check(ordenado=1 or ordenado=0) not null
)

create table grupos
(
	grupo 			char(1) check(grupo='a' or grupo='b'or grupo='c' or grupo='d') not null,
	codigotime 		int 	not null
	constraint fk_codigotime foreign key (codigotime) references times(codigotime)
)

create table jogos
(
	id 			int 	primary key identity,
	timea 		int,
	timeb 		int,
	rodada 		int,
	datarod		date,
	golstimea 	int,
	golstimeb 	int
)

select * from grupos
select * from times

insert into times values
(1,'santos','santos', 'vila belmiro',1),
(2,'palmeiras','são paulo','allianz parque',1),
(3,'corinthians','são paulo','neo química arena',1),
(4,'são paulo','são paulo','morumbi',1),
(5,'ponte preta','campinas','moisés lucarelli',1),
(6,'guarani','campinas','brinco de ouro',1),
(7,'são bento','sorocaba','walter ribeiro',1),
(8,'novorizontino','novo horizonte','jorge ismael de biasi',1),
(9,'ponte preta','campinas', 'moisés lucarelli',1),
(10,'mirassol','mirassol','josé maria de campos maia',1),
(11,'ferroviária','araraquara','fonte luminosa',1),
(12,'red bull bragantino','bragança paulista','nabi abi chedid',1),
(13,'são caetano','são caetano do sul','anacleto campanella',1),
(14,'botafogo-sp','ribeirão preto','santa cruz',1),
(15,'ituano','itu','novelli júnior',1),
(16,'inter de limeira','limeira','limeirão',1)

create procedure sp_grupo(@num int, @retorno char(1) output)
as

	if (@num = 1) 
	begin
		set @retorno = 'A'
	end 

	if (@num = 2) 
	begin
		set @retorno = 'B'
	end 

	if (@num = 3) 
	begin
		set @retorno = 'C'
	end 

	if (@num = 4) 
	begin
		set @retorno = 'D'
	end 


create procedure sp_dividetime_ins
as

	update times set ordenado = 1 

	declare @cont int
	set @cont = 1
	declare @saida char(1)
	declare @cod int

	/* ----- adicionar os 4 primeiros times ------ */
	while @cont < 5
	begin

		set @cod = (select codigotime from times where codigotime = @cont)
		exec sp_grupo @cont, @saida output

		insert into grupos values (@saida, @cod)
		update times set ordenado = 0 where codigotime = @cod

		set @cont = @cont + 1
	end

	print '4 primeiros inseridos com sucesso'

	set @cont = 1

	/* ----- adicionar os outros 12 times ------ */
	declare @grupo int

	while @cont < 13
	begin

		declare @aleatoriotime int
		declare @aleatoriogrupo int

		set @aleatoriotime = (abs(checksum(newid())) % 12 ) + 5
		set @aleatoriogrupo = (abs(checksum(newid())) % 4 ) + 1

		set @cod = (select codigotime from times where codigotime = @aleatoriotime and ordenado = 1)

		declare @saidan char(1)
		exec sp_grupo @aleatoriogrupo, @saidan output
		print @saidan 


		if ( (@cod is null) or (@cod='') )
		begin
			print 'o numero selecionado não está disponivel'
			set @cont = @cont + 0
		end 
		else
		begin
			declare @tamanho int
			set @tamanho = (select count(grupo) from grupos where grupo = @saidan)

			if @tamanho >= 4
			begin	
				print 'o grupo está cheio'
				set @cont = @cont + 0
			end
			else
			begin
				update times set ordenado = 0 where codigotime = @cod
				insert into grupos values (@saidan, @cod)
				set @cont = @cont + 1
			end
		end
	end

	exec sp_dividetime_ins
	select * from grupos order by grupo
	select * from times



create procedure sp_verifica(@time int, @rodada int, @retorno varchar(10) output)
as
	declare @codigo int

	set @codigo = (select rodada from jogos where timeb = @time and rodada = @rodada)

	if (@codigo is null)
	begin
		set @retorno = 'ok'
	end
	else
	begin
		set @retorno = 'nao'
	end 


create procedure sp_formarjogo
as
	
	declare @possibilidade int
	set @possibilidade = 1

	declare @grupotimea char(1)
	declare @grupotimeb char(1)
	declare @inicio int
	set @inicio = 0

		if (@possibilidade = 1)
		begin
			set @grupotimea = 'a'
			set @grupotimeb = 'b'
			exec sp_rodadas @grupotimea, @grupotimeb, @inicio 
			set @possibilidade = @possibilidade + 1
		end

		if (@possibilidade = 2)
		begin
			set @grupotimea = 'c'
			set @grupotimeb = 'd'
			exec sp_rodadas @grupotimea, @grupotimeb, @inicio
			set @possibilidade = @possibilidade + 1
		end 

		set @inicio = @inicio + 4

		if (@possibilidade = 3)
		begin
			set @grupotimea = 'a'
			set @grupotimeb = 'c'

			exec sp_rodadas @grupotimea, @grupotimeb, @inicio
			set @possibilidade = @possibilidade + 1
		end

		if (@possibilidade = 4)
		begin
			set @grupotimea = 'b'
			set @grupotimeb = 'd'
			exec sp_rodadas @grupotimea, @grupotimeb, @inicio
			set @possibilidade = @possibilidade + 1
		end

		set @inicio = @inicio + 4

		if (@possibilidade = 5)
		begin
			set @grupotimea = 'a'
			set @grupotimeb = 'd'
			exec sp_rodadas @grupotimea, @grupotimeb, @inicio
			set @possibilidade = @possibilidade + 1
		end

		if (@possibilidade = 6)
		begin
			set @grupotimea = 'b'
			set @grupotimeb = 'c'
			exec sp_rodadas @grupotimea, @grupotimeb, @inicio
			set @possibilidade = @possibilidade + 1
		end 



	exec sp_formarjogo
	select * from jogos order by rodada
	

create procedure sp_rodadas(@grupomanda char(1), @grupovisit char(1), @incio int)
as
	declare @timemanda int
	declare @timevisit int

	declare @contmanda int
	declare @contvisit int

	set @contmanda = 0
	set @contvisit = 0

	while @contmanda < 4
	begin
		 
		set @timemanda = (select top (1) codigotime from grupos where grupo = @grupomanda and
			(codigotime not in (select top (@contmanda) codigotime from grupos where grupo = @grupomanda order by grupo, codigotime)) order by grupo, codigotime)
		print 'escolheu o mandante ' + cast(@timemanda as varchar(12))

		set @contvisit = 0
		declare @incioaux int
		set @incioaux = @incio
		
		declare @cont int
		set @cont = 0

		while @contvisit < 4
		begin
			if (@cont < 4)
			begin	
				
				print 'contvisit: ' + cast(@contvisit as varchar(12)) 
				print 'cont: ' + cast(@cont as varchar(12)) 

				set @timevisit = 0
				set @timevisit = (select top (1) codigotime from grupos where grupo = @grupovisit and
				(codigotime not in (select top (@cont) codigotime from grupos where grupo = @grupovisit
				order by grupo, codigotime)) order by grupo, codigotime)

				print 'escolheu o visitante ' + cast(@timevisit as varchar(12))


				declare @resposta varchar(10) 
				declare @incioaux2 int
				set @incioaux2 = @incioaux + 1

				print 'verificar->' + cast(@timevisit as varchar(12)) + ' - ' + cast (@incioaux2 as varchar(12)) 

				exec sp_verifica  @timevisit,  @incioaux2, @resposta output

				print @resposta


				if (@resposta = 'nao')
				begin
					print 'entrou no nao'
					set @cont = @cont + 1
				end
				else
				begin
					print 'entrou no sim'
					set @contvisit = @contvisit + 1
					set @incioaux = @incioaux + 1 
					print 'inserir->' + cast(@timemanda as varchar(12)) + ' - ' + cast(@timevisit as varchar(12)) + ' - ' + cast(@incioaux as varchar(12))
					insert into jogos values (@timemanda, @timevisit, @incioaux, null, null, null)
					set @cont = @cont + 1
				end
			end
			else 
			begin
				print 'vai zerar o cont'
				set @cont = 0
			end
		
		end

		set @contmanda = @contmanda + 1
	end


	exec sp_datasrodadas

-------------------  fim da procedure ------------------

create procedure sp_datasrodadas
as
	declare @datajogo date
	set @datajogo = '2021-02-27' --comeca no domingo

	declare @rodada int
	set @rodada = 1

	while (@rodada < 13)
	begin
		if ( (@rodada % 2) <> 0)
		begin	
			set @datajogo = (select dateadd(day,4,@datajogo))
			update jogos set datarod = @datajogo where rodada = @rodada;
		end

		if ((@rodada % 2) = 0)
		begin
			set @datajogo = (select dateadd(day,3,@datajogo))
			update jogos set datarod = @datajogo where rodada = @rodada;
		end

		set @rodada = @rodada + 1
	end



select * from jogos 



select * from grupos order by grupo, codigotime
select * from jogos order by rodada




exec sp_formarjogo

declare @resposta varchar(10) 
exec sp_verifica  3, 5, @resposta output
print @resposta


create function fn_jogos(@data date)
returns @table table
(
	nometimea 	varchar(50),
	nometimeb 	varchar(50),
	rodada 		int,
	id 			int
)
as
begin
	insert into @table (nometimea,nometimeb,rodada, id)
		select tm.nometime,tm2.nometime, jg.rodada, jg.id
	from jogos jg 
	inner join times tm on jg.timea = tm.codigotime
	inner join times tm2 on jg.timeb = tm2.codigotime
	where datarod =	@data

	return 
end

CREATE FUNCTION fn_jogos_times()
RETURNS @tabela TABLE (
	nometimea 	varchar(50),
	nometimeb 	varchar(50),
	rodada 		int,
	id 			int
)
AS
BEGIN
	insert into @tabela (nometimea,nometimeb,rodada, id)

		select tm.nometime,tm2.nometime, jg.rodada, jg.id
	from jogos jg 
	inner join times tm on jg.timea = tm.codigotime
	inner join times tm2 on jg.timeb = tm2.codigotime
	
	RETURN 
END
 
SELECT * FROM fn_jogos_times()


-------------------------------------------------------- Avaliação 2 ----------------------------------------------------------------



create trigger triggertimes on times
for insert, delete, update
as
begin
	rollback transaction
	raiserror('Nao é permitido inserir, excluir ou atualizar registros nessa tabela', 16, 1)
end


create trigger triggergrupos on grupos
for insert, delete, update
as
begin
	rollback transaction
	raiserror('Nao é permitido inserir, excluir ou atualizar registros nessa tabela', 16, 1)
end

create trigger triggerjogos on jogos
for insert, delete
as
begin
	rollback transaction
	raiserror('Nao é permitido inserir, excluir ou atualizar registros nessa tabela', 16, 1)
end


--procedure que insere o placar dos jogos
create procedure inseregols(@golsa int, @golsb int, @idjogo int)
as

	if ( (@golsa is null) or (@golsb is null) )
	begin
		print 'nao vai fazer nada'
	end
	else
	begin
		update jogos set golstimea = @golsa , golstimeb = @golsb where id = @idjogo
	end



--função para calcular as tabelas
create function fn_tabelagrupos(@numgrupo char)
returns @grupo table
(
	nometime varchar(50),
	jogos 			int,
	vitorias 		int,
	empates 		int,
	derrotas 		int,
	golsmarcados 	int,
	golssofridos 	int,
	saldogols 		int,
	pontos 			int
)
as
begin
	declare @conttimetabela int
	declare @time int
	set @conttimetabela = 0

	-- variaveis para calcular as informacoes da tabela
	declare @nome varchar(20)
	declare @jogos int
	declare @vitorias int
	declare @derrotas int
	declare @empate int
	declare @golsmarcados int
	declare @golssofridos int
	declare @saldogols int
	declare @pontos int

		-- while para cada time do grupo
		while(@conttimetabela < 4)
		begin
			--seleciona os times com grupo igual ao do parametro
			set @time = (select top(1) codigotime from grupos where grupo = @numgrupo and
				(codigotime not in (select top(@conttimetabela) codigotime from grupos where grupo = @numgrupo)))	

			--zerando as informações 
			set @nome = null
			set @jogos = 0
			set @vitorias = 0
			set @derrotas = 0
			set @empate = 0
			set @golsmarcados = 0
			set @golssofridos = 0
			set @saldogols = 0
			set @pontos = 0

			--- variaveis para percorrer a tabela
			declare @timea int
			declare @timeb int
			declare @golstimea int
			declare @golstimeb int
			declare c cursor for select timea, timeb, golstimea, golstimeb from jogos
			
			open c
			fetch next from c into @timea, @timeb, @golstimea, @golstimeb 

			while @@fetch_status = 0
			begin
				if @timea = @time or @timeb = @time
				begin 
					if (@golstimea is not null) or  (@golstimeb is not null)
					begin
						--nome do time
						set @nome = (select nometime from times where codigotime = @time)

						--calcula partidas jogadas
						set @jogos = @jogos + 1

						--calcula vitorias, derrotas, golsmarcados, golssofridos, saldogols, pontos

						if(@time = @timea)
						begin
							--time a ganha
							if(@golstimea > @golstimeb)
							begin	
								set @vitorias = @vitorias + 1
								set @golsmarcados = @golstimea + @golsmarcados
								set @golssofridos = @golstimeb + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
								set @pontos = @pontos + 3	
							end
							--time a perde
							if(@golstimea < @golstimeb)
							begin	
								set @derrotas = @derrotas + 1
								set @golsmarcados = @golstimea + @golsmarcados
								set @golssofridos = @golstimeb + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
							end
							--empate
							if(@golstimea = @golstimeb)
							begin	
								set @empate = @empate + 1
								set @golsmarcados = @golstimea + @golsmarcados
								set @golssofridos = @golstimeb + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
								set @pontos = @pontos + 1	
							end	
						end
						else
						begin
							--time b ganha
							if(@golstimea < @golstimeb)
							begin	
								set @vitorias = @vitorias + 1
								set @golsmarcados = @golstimeb + @golsmarcados
								set @golssofridos = @golstimea + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
								set @pontos = @pontos + 3	
							end
							--time b perde
							if(@golstimea > @golstimeb)
							begin	
								set @derrotas = @derrotas + 1
								set @golsmarcados = @golstimeb + @golsmarcados
								set @golssofridos = @golstimeb + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
							end
							--empate
							if(@golstimea = @golstimeb)
							begin	
								set @empate = @empate + 1
								set @golsmarcados = @golstimea + @golsmarcados
								set @golssofridos = @golstimeb + @golssofridos
								set @saldogols = @golsmarcados - @golssofridos
								set @pontos = @pontos + 1	
							end	
						end
					end
				end
				fetch next from c into @timea, @timeb, @golstimea, @golstimeb
			end

			--inserir na tabela da funcao
			insert into @grupo values (@nome,@jogos,@vitorias,@empate,@derrotas,@golsmarcados,@golssofridos, @saldogols,@pontos)


			close c
			deallocate c
		
			set @conttimetabela = @conttimetabela + 1
		end
	return
end



--função para montar a tabela geral
create function fn_tabelageral()
returns @tabela table
(
	nometime 		varchar(50),
	jogos 			int,
	vitorias 		int,
	empates 		int,
	derrotas 		int,
	golsmarcados 	int,
	golssofridos 	int,
	saldogols 		int,
	pontos 			int
)
as
begin

	insert into @tabela select * from fn_tabelagrupos('a')
	insert into @tabela select * from fn_tabelagrupos('b')
	insert into @tabela select * from fn_tabelagrupos('c')
	insert into @tabela select * from fn_tabelagrupos('d')

	return
end

create function fn_promovidos()
returns @tabela table
(
	nometime 		varchar(50),
	jogos 			int,
	vitorias	 	int,
	empates 		int,
	derrotas 		int,
	golsmarcados 	int,
	golssofridos 	int,
	saldogols 		int,
	pontos 			int
)
as
begin
		insert into @tabela select top(2) * from fn_tabelagrupos('a') order by pontos desc, vitorias desc, golsmarcados desc, saldogols desc
		insert into @tabela select top(2) * from fn_tabelagrupos('b') order by pontos desc, vitorias desc, golsmarcados desc, saldogols desc
		insert into @tabela select top(2) * from fn_tabelagrupos('c') order by pontos desc, vitorias desc, golsmarcados desc, saldogols desc
		insert into @tabela select top(2) * from fn_tabelagrupos('d') order by pontos desc, vitorias desc, golsmarcados desc, saldogols desc

	return
end

select * from fn_promovidos()