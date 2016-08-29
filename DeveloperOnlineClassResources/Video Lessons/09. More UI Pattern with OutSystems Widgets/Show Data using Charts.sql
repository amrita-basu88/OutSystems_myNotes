SELECT 
    {Issue}.[SubmitDate], count(1), '', '', ''
FROM
    {Issue}
WHERE
    {Issue}.[SubmitDate] >= getdate() - 7
GROUP BY
    {Issue}.[SubmitDate]
ORDER BY
    {Issue}.[SubmitDate]