create database loja;
use loja;

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER NOT NULL
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    produto_id INTEGER REFERENCES produtos(id),
    quantidade INTEGER NOT NULL,
    data_pedido DATE NOT NULL
);

-- Inserindo registros na tabela clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João Silva', 'joao@email.com', '1111-1111', 'Rua A, 123'),
('Maria Souza', 'maria@email.com', '2222-2222', 'Rua B, 456'),
('Carlos Pereira', 'carlos@email.com', '3333-3333', 'Rua C, 789'),
('Ana Lima', 'ana@email.com', NULL, 'Rua D, 321'),
('Bruno Castro', 'bruno@email.com', '5555-5555', 'Rua E, 654'),
('Fernando Alves', 'fernando@email.com', NULL, NULL),
('Tatiane Mendes', 'tatiane@email.com', '7777-7777', 'Rua G, 987'),
('Diego Moreira', 'diego@email.com', '8888-8888', 'Rua H, 147'),
('Larissa Rocha', 'larissa@email.com', NULL, 'Rua I, 258'),
('Pedro Nogueira', 'pedro@email.com', '1010-1010', 'Rua J, 369');

-- Inserindo registros na tabela produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Core i7, 16GB RAM, SSD 512GB', 4500.00, 20),
('Smartphone Samsung', '128GB, Tela 6.4"', 2500.00, 30),
('Fone Bluetooth', 'Cancelamento de ruído', 500.00, 50),
('Monitor LG', 'Full HD, 24 polegadas', 800.00, 25),
('Teclado Mecânico', 'RGB, Switch Red', 350.00, 40),
('Mouse Gamer', '16000 DPI, RGB', 250.00, 35),
('Impressora HP', 'Multifuncional Wi-Fi', 1200.00, 15),
('Cadeira Gamer', 'Reclinável, Preto/Vermelho', 950.00, 10),
('Microfone Condensador', 'USB, Profissional', 400.00, 12),
('Webcam Full HD', '1080p, Autofoco', 300.00, 18);

-- Inserindo registros na tabela pedidos
INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido) VALUES
(1, 1, 2, '2025-03-01'),
(2, 3, 1, '2025-03-02'),
(3, 5, 1, '2025-03-03'),
(4, 7, 3, '2025-03-04'), 
(5, 9, 2, '2025-03-05'),
(NULL, 2, 1, '2025-03-06'), -- Pedido sem cliente associado
(7, NULL, 1, '2025-03-07'), -- Pedido sem produto associado
(8, 4, 2, '2025-03-08'),
(9, 6, 1, '2025-03-09'),
(10, 8, 1, '2025-03-10');


-- 1:
select count(id) from clientes;

-- 2:
select count(id) from produtos;

-- 3:
select * from produtos;
select * from pedidos;
SELECT SUM(p.quantidade * pr.preco) AS valor_total_pedidos
FROM pedidos p
JOIN produtos pr ON p.produto_id = pr.id;

-- 4:
select * from produtos;
select avg(preco) from produtos;

-- 5:
SELECT c.nome, p.id AS pedido_id, pr.nome AS produto, p.quantidade, p.data_pedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
LEFT JOIN produtos pr ON p.produto_id = pr.id;
 
 -- 6:
 select *
 from pedidos as pe
 join produtos as pr on pe.id = pr.id; 
 
 -- 7:
 select * from produtos order by preco desc;
 
 -- 8:
 select * from produtos order by estoque asc;

 -- 9:
 select count(pe.id) 
 from pedidos as pe
 join clientes as cl on cl.id = pe.cliente_id;
 
-- 10:

-- 11:
SELECT c.nome  
FROM clientes c  
LEFT JOIN pedidos p ON c.id = p.cliente_id  
WHERE p.id IS NULL;

-- 12:
select pr.nome
from produtos pr
join pedidos pe on pr.id = pe.id 
where pr.id is null;