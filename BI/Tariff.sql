SELECT Tariff.TariffName, Tariff.TariffAlias, Tariff.Description, TariffCriteria.TableName, TariffCriteria.FieldName, TariffCriteria.FieldValue, TariffCriteria.DataType

FROM Tariff Inner Join TariffCriteria on Tariff.TariffName = TariffCriteria.TariffName

WHERE Tariff.GLCode = 'Inbound Handling'