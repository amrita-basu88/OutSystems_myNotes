SELECT
    {Client}.[Name], count(distinct {Order}.[Id]), sum({OrderItem}.[TotalPrice])
FROM
    {OrderItem}
    inner join {Order} on {Order}.[Id] = {OrderItem}.[OrderId]
    inner join {Client} on {Client}.[Id] = {Order}.[ClientId]
WHERE
    {Order}.[StatusId] <> @CancelledStatusId
GROUP BY
    {Client}.[Name]
ORDER BY
    sum({OrderItem}.[TotalPrice]) DESC