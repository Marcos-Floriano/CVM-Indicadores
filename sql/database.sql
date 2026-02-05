drop database if EXISTS cvm_dados;
CREATE DATABASE IF NOT EXISTS cvm_dados;
USE cvm_dados;

CREATE TABLE demonstrativos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cnpj_cia VARCHAR(20),
    dt_refer DATE,
    versao INT,
    denom_cia VARCHAR(255),
    cd_cvm INT,
    grupo_dfp VARCHAR(255),
    moeda VARCHAR(20),
    escala_moeda VARCHAR(20),
    ordem_exerc VARCHAR(20),
    dt_fim_exerc DATE,
    cd_conta VARCHAR(20),
    ds_conta VARCHAR(255),
    vl_conta DECIMAL(18,2),
    st_conta_fixa CHAR(1)
);