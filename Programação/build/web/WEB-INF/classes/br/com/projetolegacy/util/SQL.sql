
/*Nome do Banco: bd_legacy*/

CREATE TABLE Influenciador (
    idInfluenciador serial not null PRIMARY KEY,
    nomeInfluenciador VARCHAR (60),
    descricaoInfluenciador VARCHAR (100),
    seloInfluenciador VARCHAR (1),
    faceInfluenciador VARCHAR (100),
    apelidoInfluenciador VARCHAR (20),
    tkInfluenciador VARCHAR (100),
    ytInfluenciador VARCHAR (100),
    emailInfluenciador VARCHAR (100),
    telInfluenciador varchar(20),
    fotoInfluenciador VARCHAR (100),
    senhaInfluenciador VARCHAR(20),
    cpfInfluenciador VARCHAR (20),
    instaInfluenciador VARCHAR (100),
    cepInfluenciador VARCHAR (20),
    ruaInfluenciador VARCHAR (100),
    bairroInfluenciador VARCHAR (100),
    numInfluenciador VARCHAR (10),
    estadoInfluenciador VARCHAR (5),
    cidadeInfluenciador VARCHAR (150)
);

CREATE TABLE Adm (
    idAdm Serial not null PRIMARY KEY,
    nomeAdm VARCHAR(60),
    loginAdm VARCHAR(100),
    senhaAdm VARCHAR(20)
);

CREATE TABLE Campanha (
    idCampanha serial not null PRIMARY KEY,
    nomeCampanha VARCHAR,
    descricaoCampanha VARCHAR,
    idInfluenciador INTEGER,
    constraint fk_influenciador_campanha
    FOREIGN KEY (idInfluenciador)
    REFERENCES Influenciador (idInfluenciador)
);

CREATE TABLE Carrinho (
    idCarrinho serial not null PRIMARY KEY,
    statusCarrinho CHAR(1),
    datafinalizacaoCarrinho DATE,
    valototalCarrinho numeric(10,2),
    totaldoacaoCarrinho numeric(10,2),
    datacriacaoCarrinho DATE,
    idCampanha integer,
    idInfluenciador integer,
    
    constraint fk_campanha_carrinho
    FOREIGN KEY (idCampanha)
    REFERENCES Campanha (idCampanha),
    
    constraint fk_influenciador_carrinho
    FOREIGN KEY (idInfluenciador)
    REFERENCES Influenciador (idInfluenciador)
);

CREATE TABLE Produto (
    idProduto serial not null PRIMARY KEY,
    nomeProduto VARCHAR(60),
    descricaoProduto VARCHAR(100),
    precoProduto numeric(10,2),
    tempousoProduto VARCHAR(10),
    fotoProduto VARCHAR(100),
    fotoProduto1 VARCHAR(100),
    fotoProduto2 VARCHAR(100),
    dataProduto date,
    statusProduto char(1),
    idCampanha INTEGER,
    idCarrinho Integer,

    constraint fk_campanha_produto
    FOREIGN KEY (idCampanha)
    REFERENCES Campanha (idCampanha),

    constraint fk_carrinho_produto
    FOREIGN KEY (idCarrinho)
    references Carrinho(idCarrinho)

);





/*select p.precoProduto, p.idCarrinho, p.idCampanha, c.statusCarrinho 
from produto p,  Carrinho c
where p.idcarrinho = c.idcarrinho


select SUM(p.precoProduto) totalcampanha, p.idCampanha
from produto p,  Carrinho c
where p.idcarrinho = c.idcarrinho
group by p.idCampanha


select porcentagemdoacao, nomecampanha, nomeinstituicao, totaldoadoDoacao 
from doacao d, instituicao i, campanha c
where d.idinstituicao = i.idinstituicao
and d.idcampanha = c.idcampanha
and d.idcampanha = 2



select * from doacao

select * from campanha
*/

CREATE TABLE Instituicao (
    idInstituicao serial not null PRIMARY KEY,
    statusInstituicao CHAR(1),
    nomeInstituicao VARCHAR(100),
    fotoInstituicao VARCHAR(100),
    telInstituicao VARCHAR(15),
    cnpjInstituicao VARCHAR(25),
    senhaInstituicao VARCHAR(20),
    cepInstituicao VARCHAR(10),
    ruaInstituicao VARCHAR(100),
    bairroInstituicao VARCHAR(100),
    cidadeInstituicao VARCHAR(100),
    estadoInstituicao VARCHAR(2),
    numInstituicao VARCHAR(5),
    idAdm INTEGER,

    constraint fk_instituicao_adm
    FOREIGN KEY (idAdm)
    REFERENCES Adm (idAdm)
);

CREATE TABLE Doacao (
    idInstituicao INTEGER,
    idCampanha INTEGER,
    porcentagemDoacao numeric(7,2),
    totaldoadoDoacao numeric(7,2),

    constraint pk_doacao primary key(idInstituicao, idCampanha),

    constraint fk_instituicao_doacao
    FOREIGN KEY (idInstituicao)
    REFERENCES Instituicao (idInstituicao),

    constraint fk_campanha_doacao
    FOREIGN KEY (idCampanha)
    REFERENCES Campanha (idCampanha)
);

/*Alter table Produto
ADD COLUMN fotoProduto VARCHAR(100)*/

/*Alter table Doacao
ADD COLUMN totaldoadoDoacao numeric(7,2)*/

/*ALTER TABLE Doacao 
RENAME COLUMN porcentagem TO porcentagemDoacao*/


/*ALTER TABLE Instituicao 
ALTER COLUMN cnpjInstituicao TYPE VARCHAR(25)*/

/*create or replace function func_carrinho()
returns TRIGGER
as $$
declare
quant numeric;
begin
select into quant p.precoProduto from Produto p, Carrinho c where p.idProduto = new.idProduto;
update Carrinho set valortotalCarrinho = (quant + valortotalCarrinho) where Carrinho.idCarrinho = new.idCarrinho;
return new;
end;
$$ LANGUAGE plpgsql;

create trigger trig_carrinho after update on Produto for each row
execute procedure func_carrinho();*/

/*Select sum(precoProduto) 
from Produto
where idCarrinho=1*/