create function udf_CreatorWithBoardgames (@name nvarchar(30))
returns int as
begin
declare @count int =
(select count(cb.BoardgameId) 
from CreatorsBoardgames as cb join Creators as c on cb.CreatorID = c.Id
where c.FirstName = @name)
return @count
end