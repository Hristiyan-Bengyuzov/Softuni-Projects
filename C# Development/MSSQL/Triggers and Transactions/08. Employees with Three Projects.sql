CREATE PROC usp_AssignProject
(@emloyeeId INT, @projectID INT)
AS
BEGIN TRANSACTION
	DECLARE @projectsCount INT =
	(
		SELECT
			COUNT(ProjectID)
		FROM [EmployeesProjects]
		WHERE [EmployeeID] = @emloyeeId
	)

	IF (@projectsCount >= 3) -- Equal to 3?? Problem description incorrect
	BEGIN
		RAISERROR('The employee has too many projects!', 16, 1)
		ROLLBACK		
	END

	INSERT INTO [EmployeesProjects] VALUES
		(@emloyeeId, @projectID)
COMMIT TRANSACTION