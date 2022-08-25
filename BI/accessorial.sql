SELECT Accessorial.AccessorialName, Accessorial.AccessorialAlias, Accessorial.Description , AccessorialCriteria.TableName, AccessorialCriteria.FieldName, AccessorialCriteria.FieldValue,
AccessorialCriteria.Comparison, AccessorialCriteria.DataType

FROM Accessorial Inner Join AccessorialCriteria ON Accessorial.AccessorialName = AccessorialCriteria.AccessorialName

WHERE Accessorial.GLCode = 'Inbound Handling' 