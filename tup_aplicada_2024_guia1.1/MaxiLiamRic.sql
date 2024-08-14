DECLARE @Promedio DECIMAL(18,2)-- declaracion de variable/ (18,2)= 18 espacios, 2 despues de la coma

SET @Promedio = 0.0; --seteo de variable

DECLARE @Personas TABLE --crea tabla (alternativa de create(se guarda de memoria))
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    LU INT NOT NULL,-- NO NULO
    Nombre NVARCHAR(50),
    Nota DECIMAL(18,2) NOT NULL DEFAULT 0 
);
----------- 

INSERT INTO @Personas(LU,Nombre,Nota)
VALUES
(2342,'Anibal',45.20),
(2343,'Camila',85.50),
(2333,'Cecilia',60.60),
(2337,'Nelson',75.70),
(2589,'Jose',85.90),
(2902,'José Manuel',85.20)

SELECT @Promedio=AVG(Nota) FROM @Personas
PRINT @Promedio

--                    --Hard mode--
/*DECLARE @Nota DECIMAL (18,2)--,@Nombre NVARCHAR(50)--??'
DECLARE CursorNote CURSOR FOR SELECT Nota FROM @Personas;
--DECLARE CursorNombre CURSOR FOR SELECT Nombre FROM @Personas;

OPEN CursorNote;
FETCH NEXT FROM CursorNote INTO @Nota;

WHILE @@FETCH_STATUS = 0
BEGIN
IF @Nota> @Promedio
  PRINT 'pasa';
ELSE
  PRINT 'No pasa';

 
  FETCH NEXT FROM CursorNote INTO @Nota;
END;

CLOSE CursorNote;
DEALLOCATE CursorNote*/


SELECT * From @Personas
where Nombre COLLATE latin1_General_CI_AI like '%jose%'-- Filtro de joses 

SELECT * From @Personas
WHERE Nota>=@Promedio
-- Alternativa (sacar promedio y sup promedio)
--WHERE Nota>=(@Promedio=AVG(Nota) FROM @Personas)

ORDER BY LU ASC

SELECT TOP 1(Nota) FROM @Personas
WHERE Nota>=@Promedio
ORDER BY Nota ASC 



SELECT TOP 1(Nota) FROM @Personas
ORDER BY Nota DESC

