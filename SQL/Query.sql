-- Prueba de query 
UPDATE Cursos
SET Nombre = 'Programacion'
WHERE Nombre = 'Programación'

select Nombre,Apellido, 
cast((AVG(N.Nota)) as DECIMAL(10,2)) as promedio -- Redondeo el promedio a 2 decimales
from Alumnos a 
join Notas n
on a.AlumnoID = n.AlumnoID
GROUP by a.AlumnoID, a.Nombre, a.Apellido
HAVING AVG(N.Nota) > 4 -- Obtengo el promedio y valido que sea mayor a 4


-- Escriba un Query que entregue la lista de alumnos para el curso “programación”.
select a.Nombre from Alumnos a 
join Inscripciones i on a.AlumnoID = i.AlumnoID -- tabla intermedio M-M
join Cursos c on i.CursoID = c.CursoID
where c.Nombre = 'Programacion'

-- Escriba un Query que calcule el promedio de notas de un alumno en un curso.
DECLARE @AlumnoID INT = 1;
DECLARE @CursoID INT = 1;
SELECT 
    a.Nombre AS NombreAlumno,
    a.Apellido AS ApellidoAlumno,
    CAST(AVG(n.Nota) AS DECIMAL(10,2)) AS PromedioNotas
FROM Notas n
JOIN Pruebas p ON n.PruebaID = p.PruebaID
JOIN Alumnos a ON n.AlumnoID = a.AlumnoID
WHERE n.AlumnoID = @AlumnoID AND p.CursoID = @CursoID
GROUP BY a.Nombre, a.Apellido;


-- Escriba un Query que entregue a los alumnos y el promedio que tiene en cada ramo.
SELECT 
    a.Nombre,
    a.Apellido,
    c.Nombre AS Curso,
    cast(AVG(N.Nota)AS decimal(10,2)) AS Promedio
FROM Alumnos a
JOIN Inscripciones I ON a.AlumnoID = i.AlumnoID
JOIN Cursos c ON i.CursoID = c.CursoID
JOIN Pruebas p ON c.CursoID = p.CursoID
JOIN Notas n ON p.PruebaID = n.PruebaID AND a.AlumnoID = n.AlumnoID
GROUP BY a.Nombre, a.Apellido, c.Nombre
ORDER by Promedio desc