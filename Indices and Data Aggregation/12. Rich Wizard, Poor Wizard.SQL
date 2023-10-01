SELECT SUM(RS.SumDifference) AS SumDifference FROM (SELECT (DepositAmount) - LEAD(DepositAmount) OVER (ORDER BY Id) AS SumDifference
FROM WizzardDeposits) AS RS