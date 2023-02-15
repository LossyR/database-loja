CREATE DATABASE loja;
use loja;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(100),
    data_cadastro DATE
);

INSERT INTO clientes (nome, endereco, data_cadastro) VALUES
('Lucas', 'Rua Leme','2023-02-15'),
('Maria', 'Rua quiruá','2023-02-15'),
('Luana', 'Rua pêra', '2023-01-15'),
('Julia', 'Rua angu', '2022-06-11');



DELIMITER //
CREATE FUNCTION cadastro_clientes(data DATE)
RETURNS INT
Deterministic
BEGIN
  DECLARE total_clientes INT;
  SELECT COUNT(*) INTO total_clientes FROM clientes WHERE data_cadastro = data;
  RETURN total_clientes;
END;
//

SELECT cadastro_clientes ('2023-02-15')