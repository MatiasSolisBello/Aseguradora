CREATE TABLE IF NOT EXISTS `aseguradora`.`cliente` (
  `rut` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rut`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `aseguradora`.`seguro` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `aseguradora`.`venta` (
  `id` INT NOT NULL,
  `rut` INT NOT NULL,
  `seguro` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venta_cliente_idx` (`rut` ASC),
  INDEX `fk_venta_seguro1_idx` (`seguro` ASC),
  CONSTRAINT `fk_venta_cliente`
    FOREIGN KEY (`rut`)
    REFERENCES `aseguradora`.`cliente` (`rut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_seguro1`
    FOREIGN KEY (`seguro`)
    REFERENCES `aseguradora`.`seguro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `aseguradora`.`vendedor` (
  `rut` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rut`))
ENGINE = InnoDB;

